############################################
# Аутентификация и доступ
############################################

variable "token" {
  type        = string
  default     = ""
  description = "OAuth-токен"
}

variable "YC_TOKEN" {
  description = "OAuth-токен Yandex Cloud, полученный из переменной окружения"
  type        = string
  default     = ""
}

############################################
# Настройки инфраструктуры
############################################

variable "cloud_id" {
  type        = string
  default     = "b1g42ti2ko6ej4ofm9me"
  description = "Идентификатор облака Yandex Cloud"
}

variable "folder_id" {
  type        = string
  default     = "b1gt4l5ig7dgpnm1aqc6"
  description = "Идентификатор каталога Yandex Cloud"
}

variable "zone" {
  description = "Зона доступности Yandex Cloud"
  type        = string
  default     = "ru-central1-b"
}

############################################
# Сетевые настройки
############################################

variable "vpc_name" {
  description = "Имя виртуальной сети (VPC)"
  type        = string
  default     = "my-vpc"
}

variable "public_subnet_cidr" {
  description = "CIDR-блок для публичной подсети"
  type        = string
  default     = "192.168.10.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR-блок для приватной подсети"
  type        = string
  default     = "192.168.20.0/24"
}

variable "nat_ip_address" {
  description = "IP-адрес для NAT-инстанса"
  type        = string
  default     = "192.168.10.254"
}

############################################
# Настройки виртуальных машин
############################################

variable "platform_id" {
  description = "Идентификатор платформы для виртуальных машин"
  type        = string
  default     = "standard-v1"
}

variable "nat_instance_resources" {
  description = "Ресурсы для NAT-инстанса"
  type = object({
    cores         = number
    memory        = number
    core_fraction = number
  })
  default = {
    cores         = 2
    memory        = 2
    core_fraction = 5
  }
}

variable "public_vm_resources" {
  description = "Ресурсы для публичной виртуальной машины"
  type = object({
    cores         = number
    memory        = number
    core_fraction = number
  })
  default = {
    cores         = 2
    memory        = 2
    core_fraction = 5
  }
}

variable "private_vm_resources" {
  description = "Ресурсы для приватной виртуальной машины"
  type = object({
    cores         = number
    memory        = number
    core_fraction = number
  })
  default = {
    cores         = 2
    memory        = 2
    core_fraction = 5
  }
}

variable "image_id" {
  description = "Идентификатор образа для виртуальных машин"
  type        = string
  default     = "fd80mrhj8fl2oe87o4e1"
}

############################################
# Метаданные и пользовательские настройки
############################################

variable "vm_metadata" {
  description = "Метаданные для виртуальной машины, включая создание пользователя и SSH-ключи"
  type = map(object({
    username        = string
    ssh_key         = string
    sudo_privileges = string
    shell           = string
  }))
  default = {
    public = {
      username        = "aleksei"
      ssh_key         = "~/.ssh/id_ed25519_aleksei.pub"
      sudo_privileges = "ALL=(ALL) NOPASSWD:ALL"
      shell           = "/bin/bash"
    }
    private = {
      username        = "aleksei"
      ssh_key         = "~/.ssh/private_vm_key.pub"
      sudo_privileges = "ALL=(ALL) NOPASSWD:ALL"
      shell           = "/bin/bash"
    }
  }
}

variable "ssh_private_key" {
  description = "Путь к приватному SSH-ключу для подключения"
  type        = string
  default     = "~/.ssh/id_ed25519_aleksei"
}