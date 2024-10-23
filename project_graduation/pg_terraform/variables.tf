############################################
# Аутентификация и доступ
############################################

variable "access_key" {
  description = "Access Key для Yandex Object Storage"
  type        = string
  default     = ""
}

variable "secret_key" {
  description = "Secret Key для Yandex Object Storage"
  type        = string
  default     = ""
}

variable "YC_SERVICE_ACCOUNT_KEY_FILE" {
  description = "value"
  type = string
  default = ""
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

variable "region_id" {
  description = "Регион Yandex Cloud"
  type        = string
  default     = "ru-central1"
}

############################################
# Определение зон
############################################

variable "zones" {
  description = "Список зон доступности"
  type        = map(string)
  default = {
    "a" = "ru-central1-a"
    "b" = "ru-central1-b"
    "d" = "ru-central1-d"
  }
}

############################################
# Сетевые настройки
############################################

variable "vpc_name" {
  description = "Имя виртуальной сети (VPC)"
  type        = string
  default     = "my-vpc"
}

variable "public_subnet_cidrs" {
  description = "CIDR-блоки для публичных подсетей"
  type        = map(string)
  default = {
    "a" = "192.168.10.0/24"
    "b" = "192.168.11.0/24"
    "d" = "192.168.12.0/24"
  }
}

variable "private_subnet_cidrs" {
  description = "CIDR-блоки для приватных подсетей"
  type        = map(string)
  default = {
    "a" = "10.0.1.0/24"
    "b" = "10.0.2.0/24"
    "d" = "10.0.3.0/24"
  }
}

############################################
# Настройки NAT
############################################

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

variable "nat_image_id" {
  description = "Идентификатор образа для NAT-инстанса"
  type        = string
  default     = "fd80mrhj8fl2oe87o4e1"
}

############################################
# Ресурсы виртуальных машин
############################################

variable "platform_id" {
  description = "Идентификатор платформы для виртуальных машин"
  type        = string
  default     = "standard-v2"
}

variable "public_vm_resources" {
  description = "Ресурсы для публичных виртуальных машин"
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
  default     = "fd8btqg2mh540ftne9p4"
}

############################################
# Метаданные и пользовательские настройки
############################################

variable "vm_metadata" {
  description = "Метаданные для виртуальных машин, включая создание пользователя и SSH-ключи"
  type = object({
    public = object({
      username        = string
      ssh_public_key  = string
      sudo_privileges = string
      shell           = string
    })
    private = object({
      username        = string
      ssh_public_key  = string
      sudo_privileges = string
      shell           = string
    })
  })
  default = {
    public = {
      username        = "aleksei"
      ssh_public_key  = "~/.ssh/id_ed25519_aleksei.pub"
      sudo_privileges = "ALL=(ALL) NOPASSWD:ALL"
      shell           = "/bin/bash"
    }
    private = {
      username        = "aleksei"
      ssh_public_key  = "~/.ssh/private_vm_key.pub"
      sudo_privileges = "ALL=(ALL) NOPASSWD:ALL"
      shell           = "/bin/bash"
    }
  }
}

variable "ansible_public_key" {
  description = "Путь к публичному SSH-ключу для подключения"
  type        = string
  default     = "~/.ssh/id_ed25519_aleksei"
}

############################################
# Определение виртуальных машин Jenkins
############################################

variable "jenkins_vms" {
  description = "Список виртуальных машин Jenkins"
  type = list(object({
    name          = string
    zone          = string
    cpu           = number
    memory        = number
    core_fraction = number
    disk_size     = number
  }))
  default = [
    {
      name          = "jenkins-master"
      zone          = "ru-central1-a"
      cpu           = 2
      memory        = 4
      core_fraction = 5
      disk_size     = 10
    },
    {
      name          = "jenkins-agent"
      zone          = "ru-central1-b"
      cpu           = 2
      memory        = 4
      core_fraction = 5
      disk_size     = 10
    }
  ]
}

############################################
# Настройки Kubernetes нод
############################################

variable "k8s_master_resources" {
  description = "Ресурсы для Kubernetes мастер-нод"
  type = object({
    cores         = number
    memory        = number
    core_fraction = number
  })
  default = {
    cores         = 2
    memory        = 4
    core_fraction = 20
  }
}

variable "k8s_worker_resources" {
  description = "Ресурсы для Kubernetes воркер-нод"
  type = object({
    cores         = number
    memory        = number
    core_fraction = number
  })
  default = {
    cores         = 2
    memory        = 4
    core_fraction = 20
  }
}
