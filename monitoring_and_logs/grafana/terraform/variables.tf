# Cloud Variables
variable "token" {
  type        = string
  default     = "ups-ups"
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  default     = "b1g42ti2ko6ej4ofm9me"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  default     = "b1gt4l5ig7dgpnm1aqc6"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}

# VM Web Variables
variable "vm_image_name" {
  type        = string
  default     = "ubuntu-2204-lts-oslogin"
  description = "VM image"
}

variable "vm_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "Platform ID for the VM"
}

variable "user_name" {
  description = "The name of the user to be created on the VM"
  type        = string
  default     = "aleksei"
}

variable "ssh_keys" {
  description = "SSH keys for the user"
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEWsvs+8GLkWUbqQe42AOsAKbNu12mmyKK7/BonlA1g0 aleksei@aleksei-PC"
}


variable "each_vm" {
  type = list(object({
    vm_name       = string
    cpu           = number
    ram           = number
    core_fraction = number
    disk_volume   = number
  }))
  default = [
    {
      vm_name       = "db-server"
      cpu           = 2
      ram           = 2
      core_fraction = 20
      disk_volume   = 10
    },
    {
      vm_name       = "server-1"
      cpu           = 2
      ram           = 2
      core_fraction = 20
      disk_volume   = 10
    },
    {
      vm_name       = "server-2"
      cpu           = 2
      ram           = 2
      core_fraction = 20
      disk_volume   = 10
    }
  ]
}