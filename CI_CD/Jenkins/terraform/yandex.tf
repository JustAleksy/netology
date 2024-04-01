# Определение VPC сети
resource "yandex_vpc_network" "net" {
  name = var.vpc_name
}

# Определение подсети
resource "yandex_vpc_subnet" "subnet" {
  name           = "${var.vpc_name}-subnet"
  network_id     = yandex_vpc_network.net.id
  v4_cidr_blocks = var.default_cidr
  zone           = var.default_zone
}

# Определение образа для виртуальных машин
data "yandex_compute_image" "centos" {
  family = var.vm_image_name
}

# Определение виртуальных машин
resource "yandex_compute_instance" "vm" {
  for_each = { for vm in var.each_vm : vm.vm_name => vm }

  name        = each.value.vm_name


  platform_id = var.vm_platform_id

  resources {
    cores         = each.value.cpu
    memory        = each.value.ram
    core_fraction = each.value.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.centos.id
      size     = each.value.disk_volume
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet.id
    nat       = true
    ipv6      = false
  }

  scheduling_policy {
    preemptible = true
  }

  metadata = {
    ssh-keys = "${var.user_name}:${var.ssh_keys}"
    user-data = "${file("cloud-init.yml")}"
  }

}