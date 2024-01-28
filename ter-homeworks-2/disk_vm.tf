# Создание виртуальных дисков
resource "yandex_compute_disk" "disk" {
  count = 3

  name        = "disk-${count.index + 1}"
  size        = var.disk_size
}

# Создание виртуальной машины с дополнительными дисками
resource "yandex_compute_instance" "storage_vm" {
  name         = var.storage_vm_name
  platform_id  = var.vm_web_platform_id
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

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = var.vm_web_nat
  }

  metadata = {
    serial-port-enable = local.serial-port-enable
    ssh-keys           = local.ssh
  }

  # Подключение дополнительных дисков
  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.disk

    content {
      disk_id = secondary_disk.value.id
    }
  }
}

