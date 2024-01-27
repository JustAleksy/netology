# Определение VPC сети
resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}

# Определение подсети для веб-приложения
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}

# Определение подсети для базы данных
resource "yandex_vpc_subnet" "develop-db" {
  name           = var.vm_db_vpc_name
  zone           = var.vm_db_default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.vm_db_default_cidr
}

# Определение образа для виртуальных машин
data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_image_name
}

# Определение виртуальной машины для веб-приложения
resource "yandex_compute_instance" "platform" {
  name        = local.name_vm_1
  platform_id = var.vm_web_platform_id

  zone           = var.default_zone

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
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = var.vm_web_nat
  }

  metadata = var.vm_metadata
}

# Определение виртуальной машины для базы данных
resource "yandex_compute_instance" "platform-db" {
  name        = local.name_vm_2
  platform_id = var.vm_db_platform_id

  zone           = var.vm_db_default_zone
  
  resources {
    cores         = var.vms_resources.db.cores
    memory        = var.vms_resources.db.memory
    core_fraction = var.vms_resources.db.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = var.vm_db_preemptible
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop-db.id
    nat       = var.vm_db_nat
  }

  metadata = var.vm_metadata
  
}