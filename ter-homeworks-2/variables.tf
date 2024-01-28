# Cloud Variables
variable "token" {
  type        = string
  default     = "ups"
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
variable "vm_web_image_name" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "VM image"
}

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "Platform ID for the VM"
}

variable "vm_web_preemptible" {
  type        = bool
  default     = true
  description = "Whether the VM is preemptible or not"
}

variable "vm_web_nat" {
  type        = bool
  default     = true
  description = "Whether NAT is enabled for the VM"
}

# locals

variable "locals_name" {
  type        = string
  default     = "ubuntu"
  description = "metadata"
}

variable "locals_ssh" {
  type        = string
  default     = "~/.ssh/terik.pub"
  description = "metadata"
}

# for_each Variables

variable "each_vm" {
  type = list(object({
    vm_name       = string,
    cpu           = number,
    ram           = number,
    core_fraction = number,
    disk_volume   = number
  }))
  default = [
    {
      vm_name       = "main"
      cpu           = 2
      ram           = 1
      core_fraction = 5,
      disk_volume   = 10
    },
    {
      vm_name       = "replica"
      cpu           = 4
      ram           = 2
      core_fraction = 20,
      disk_volume   = 12
    }
  ]
}


# Resources project

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
  }
}


# Disc_vm.tf Variables

variable "disk_size" {
  type        = number
  default     = 1
  description = "Virtual Disk Size"
}

variable "storage_vm_name" {
  type        = string
  default     = "storage"
  description = "Virtual Disk VM Name"
}