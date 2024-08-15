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
  default     = "ru-central1-a"
}

variable "region_id" {
  description = "Регион Yandex Cloud"
  type        = string
  default     = "ru-central1"
}

############################################
# Настройки сети
############################################

variable "public_subnet_cidr" {
  description = "CIDR-блок для публичной подсети"
  type        = string
  default     = "192.168.20.0/24"  # измененное значение
}

############################################
# Настройки виртуальных машин
############################################

variable "platform_id" {
  description = "Идентификатор платформы для виртуальных машин"
  type        = string
  default     = "standard-v1"
}

variable "student_name" {
  description = "Имя студента"
  type        = string
  default     = "aleksei"
}

variable "image_id" {
  description = "ID образа для создания виртуальных машин"
  type        = string
  default     = "fd827b91d99psvq5fjit"
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

variable "vm_metadata" {
  description = "Метаданные для виртуальных машин, включая создание пользователей и SSH-ключи"
  type = object({
    username        = string
    ssh_key         = string
    sudo_privileges = string
    shell           = string
  })
  default = {
    username        = "aleksei"
    ssh_key         = "~/.ssh/id_ed25519_aleksei.pub"
    sudo_privileges = "ALL=(ALL) NOPASSWD:ALL"
    shell           = "/bin/bash"
  }
}

############################################
# Настройки сервисного аккаунта
############################################

variable "service_account_id" {
  description = "Идентификатор сервисного аккаунта"
  type        = string
  default     = "aje75gcs2u9lmpp03ijh"
}

############################################
# Настройки Object Storage
############################################

variable "YC_ACCESS_KEY" {
  description = "Access key for Yandex Object Storage, полученный из переменной окружения"
  type        = string
}

variable "YC_SECRET_KEY" {
  description = "Secret key for Yandex Object Storage, полученный из переменной окружения"
  type        = string
}

variable "storage_acl" {
  description = "Access control list (ACL) for Yandex Object Storage"
  type        = string
  default     = "public-read"
}

############################################
# Настройки Load Balancer
############################################

variable "lb_name" {
  description = "Имя сетевого балансировщика"
  type        = string
  default     = "my-load-balancer"
}

variable "instance_group_name" {
  description = "Имя группы виртуальных машин"
  type        = string
  default     = "lamp-instance-group"
}

############################################
# Настройки KMS
############################################

variable "kms_key_name" {
  description = "Название ключа KMS для шифрования содержимого бакета"
  type        = string
  default     = "bucket-encryption-key"
}

variable "kms_key_rotation_period" {
  description = "Период ротации ключа KMS"
  type        = string
  default     = "24h"
}