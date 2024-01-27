# Задание 1
## Пункт 1
### yandex cloud
![Снимок экрана от 2024-01-20 14-04-04](https://github.com/JustAleksy/netology/assets/143338652/07234a08-17d0-4820-934f-1434330202ff)  
### `curl ifconfig`
![Снимок экрана от 2024-01-20 14-05-04](https://github.com/JustAleksy/netology/assets/143338652/bff0b490-670f-4167-ba6b-ad1b5be41e5c)  

## Пункт 4

![Снимок экрана от 2024-01-20 12-50-09](https://github.com/JustAleksy/netology/assets/143338652/04132a9f-1472-401a-a3a5-3a99b8760048)  
![Снимок экрана от 2024-01-20 12-50-31](https://github.com/JustAleksy/netology/assets/143338652/f4f0819d-bd3a-467e-bc2b-4731dcc93bb6)  


Ответ на вопрос:
platform_id = "standart-v4" 
   - v4 - не существует
   - ошибка в слове standard
   - минимальное количество ядер для платформы - 2

### [Ссылка на инфу по standard в Yandex Cloud](https://cloud.yandex.ru/ru/docs/compute/concepts/performance-levels)

## Пункт 6
Ответ на вопрос:  

`preemptible = true` (Виртуальные машины с предварительным завершением):
1. Предоставление ресурсов по сниженной цене, но с тем условием, что они будут завершены в любой момент
2. Когда необходимо использовать большое количество вычислительных ресурсов на короткое время, мб Machine Learning какой нибудь.
3. Ну и конечно же экономия $$$, на которые можно накупить больше курсов, хехехе.
[YouTube](https://www.youtube.com/watch?v=lyBEBVEMweI)

`core_fraction = 5` (Доля ядра):
1. Позволяет указать, какую часть выделенных ядер процессора следует использовать для данной ВМ
2. Ну тоже денежный вопрос, экономия все дела.
3. В зависимости от конкретных задач, можно регулировать вычислительные ресурсы.

# Задание 2
```terraform
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

# Определение образа для виртуальных машин
data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_image_name
}

# Определение виртуальной машины для веб-приложения
resource "yandex_compute_instance" "platform" {
  name        = var.vm_web_name
  platform_id = var.vm_web_platform_id
  resources {
    cores         = var.vm_web_cores
    memory        = var.vm_web_memory
    core_fraction = var.vm_web_core_fraction
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

  metadata = {
    serial-port-enable = var.vm_web_serial_port_enable
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }
}
```
* Изменений в terraform plan не было, скриншот сделать забыл

# Задание 3

```terraform
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
  name        = var.vm_web_name
  platform_id = var.vm_web_platform_id
  resources {
    cores         = var.vm_web_cores
    memory        = var.vm_web_memory
    core_fraction = var.vm_web_core_fraction
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

  metadata = {
    serial-port-enable = var.vm_web_serial_port_enable
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }
}

# Определение виртуальной машины для базы данных
resource "yandex_compute_instance" "platform-db" {
  name        = var.vm_db_name
  platform_id = var.vm_db_platform_id
  resources {
    cores         = var.vm_db_cores
    memory        = var.vm_db_memory
    core_fraction = var.vm_db_core_fraction
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

  metadata = {
    serial-port-enable = var.vm_db_serial_port_enable
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }
  
}
```

# Задание 4
### Содержимое outputs.tf
```terraform
output "web_instance_info" {
  value = {
    instance_name = yandex_compute_instance.platform.name
    external_ip   = yandex_compute_instance.platform.network_interface.0.nat_ip_address
    fqdn          = yandex_compute_instance.platform.fqdn
  }
}

output "db_instance_info" {
  value = {
    instance_name = yandex_compute_instance.platform-db.name
    external_ip   = yandex_compute_instance.platform-db.network_interface.0.nat_ip_address
    fqdn          = yandex_compute_instance.platform-db.fqdn
  }
}
```
### Скриншон `terraform output`
![Снимок экрана от 2024-01-24 22-13-31](https://github.com/JustAleksy/netology/assets/143338652/c718a7e9-9040-468a-b0f2-f43b54a3cff2)


# Задание 5
### Содержимое файла locals.tf

```terraform
locals {
    name_vm_1        = "${var.vm_web_locals_platform}-${var.vm_web_locals_branch}-platform-${var.vm_web_locals_name}"
    name_vm_2        = "${var.vm_db_locals_platform}-${var.vm_db_locals_branch}-platform-${var.vm_db_locals_name}"
}
```

# Задание 6
### map-переменные
``` terraform
variable "vms_resources" {
  type = map(object({
    cores         = number
    memory        = number
    core_fraction = number
  }))
  default = {
    web = {
      cores         = 2
      memory        = 1
      core_fraction = 5
    }
    db = {
      cores         = 2
      memory        = 2
      core_fraction = 20
    }
  }
}

# Map metadata

variable "vm_metadata" {
  type = object({
    serial-port-enable = number
    ssh-keys           = string
  })
  default = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFblJ9p542BWB/TxbZ3cCaU7JED+pzwD50WLA4YJ5I6t meat@MeaT"
  }
}
```

`terraform plan` изменений не показал. 

* Не используемые переменные закоментированны.
