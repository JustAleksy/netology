# Домашнее задание к занятию «Организация сети»
---
## Yandex Cloud
---
### Публичная подсеть
##### 1. Создать в VPC subnet с названием public

```tf
resource "yandex_vpc_subnet" "public_subnet" {
  name           = "public"
  zone           = var.zone
  network_id     = yandex_vpc_network.my_vpc.id
  v4_cidr_blocks = [var.public_subnet_cidr]
}
```
##### 2. Создать в этой подсети NAT-инстанс
```tf
resource "yandex_compute_instance" "nat_instance" {
  name        = "nat-instance"
  platform_id = var.platform_id
  zone        = var.zone

  resources {
    cores         = var.nat_instance_resources.cores
    memory        = var.nat_instance_resources.memory
    core_fraction = var.nat_instance_resources.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
    }
  }

  network_interface {
    subnet_id  = yandex_vpc_subnet.public_subnet.id
    nat        = true
    ip_address = var.nat_ip_address
  }

  metadata = {
    user-data = <<-EOF
      #cloud-config
      users:
        - name: ${var.vm_metadata.public.username}
          ssh-authorized-keys:
            - ${file(var.vm_metadata.public.ssh_key)}
          sudo: ${var.vm_metadata.public.sudo_privileges}
          shell: ${var.vm_metadata.public.shell}
    EOF
  }
}
```
##### 3. Создать в этой публичной подсети виртуалку с публичным IP
```tf
resource "yandex_compute_instance" "public_vm" {
  name        = "public-vm"
  platform_id = var.platform_id
  zone        = var.zone

  resources {
    cores         = var.public_vm_resources.cores
    memory        = var.public_vm_resources.memory
    core_fraction = var.public_vm_resources.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.public_subnet.id
    nat       = true
  }

  connection {
    type        = "ssh"
    host        = self.network_interface[0].nat_ip_address
    user        = var.vm_metadata.public.username
    private_key = file(var.ssh_private_key)
  }

  provisioner "file" {
    source      = "~/.ssh/private_vm_key"
    destination = "/home/${var.vm_metadata.private.username}/.ssh/private_vm_key"
  }
 
  provisioner "remote-exec" {
    inline = [
      "chmod 600 /home/${var.vm_metadata.private.username}/.ssh/private_vm_key"
    ]
  }

  metadata = {
    user-data = <<-EOF
      #cloud-config
      users:
        - name: ${var.vm_metadata.public.username}
          ssh-authorized-keys:
            - ${file(var.vm_metadata.public.ssh_key)}
          shell: ${var.vm_metadata.public.shell}
          sudo: ${var.vm_metadata.public.sudo_privileges}
    EOF
  }
}
```
##### 4. Убедиться, что есть доступ к интернету

![Доступ к интернету с паблик ВМ](./media/Интернет%20из%20публичной%20ВМ.png)

---

### Приватная подсеть
##### 1. Создать в VPC subnet с названием private
```tf
resource "yandex_vpc_subnet" "private_subnet" {
  name           = "private"
  zone           = var.zone
  network_id     = yandex_vpc_network.my_vpc.id
  v4_cidr_blocks = [var.private_subnet_cidr]
  route_table_id = yandex_vpc_route_table.private_route_table.id
}
```
##### 2. Создать route table
```tf
resource "yandex_vpc_route_table" "private_route_table" {
  name       = "private-route-table"
  network_id = yandex_vpc_network.my_vpc.id

  static_route {
    destination_prefix = "0.0.0.0/0"
    next_hop_address   = yandex_compute_instance.nat_instance.network_interface.0.ip_address
  }
}
```
##### 3. Создать в этой приватной подсети виртуалку с внутренним IP
```tf
resource "yandex_compute_instance" "private_vm" {
  name        = "private-vm"
  platform_id = var.platform_id
  zone        = var.zone

  resources {
    cores         = var.private_vm_resources.cores
    memory        = var.private_vm_resources.memory
    core_fraction = var.private_vm_resources.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.private_subnet.id
  }

  metadata = {
    user-data = <<-EOF
      #cloud-config
      users:
        - name: ${var.vm_metadata.private.username}
          ssh-authorized-keys:
            - ${file(var.vm_metadata.private.ssh_key)}
          sudo: ${var.vm_metadata.private.sudo_privileges}
          shell: ${var.vm_metadata.private.shell}
    EOF
  }
}

```
##### 4. Убедиться, что есть доступ к интернету

![](./media/Интернет%20из%20приватной%20ВМ.png)

#### Скрин созданных ВМ

![](./media/ya-cloud.png)

### Ссылки на манифесты
- [providers.tf](./providers.tf)
- [network.tf](./network.tf)
- [public_vm.tf](./public_vm.tf)
- [private_vm.t](./private_vm.tf)
- [nat_instance.tf](./nat_instance.tf)
- [variables.tf](./variables.tf)
- [outputs.tf](./outputs.tf)