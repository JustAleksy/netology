# Определение образа для виртуальных машин
data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_image_name
}

# Определение виртуальной машины для веб-приложения
resource "yandex_compute_instance" "web" {
  
  count = 2

  name        = "web-${count.index + 1}"
  platform_id = var.vm_web_platform_id

  resources {
    cores         = var.vms_resources.web.cores
    memory        = var.vms_resources.web.memory
    core_fraction = var.vms_resources.web.core_fraction
  }
    
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = var.vm_web_preemptible
  }
  network_interface {
    subnet_id       = yandex_vpc_subnet.develop.id
    nat             = var.vm_web_nat
    security_group_ids  = [yandex_vpc_security_group.example.id]
  }

  metadata = {
    serial-port-enable = local.serial-port-enable
    ssh-keys           = local.ssh
  }

  depends_on = [yandex_compute_instance.db]
}