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

# SSH Variables
#variable "vms_ssh_root_key" {
#  type        = string
#  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFblJ9p542BWB/TxbZ3cCaU7JED+pzwD50WLA4YJ5I6t meat@MeaT"
#  description = "ssh-keygen -t ed25519"
#}

# VM Web Variables
variable "vm_web_image_name" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "VM image"
}

#variable "vm_web_name" {
#  type        = string
#  default     = "netology-develop-platform-web"
#  description = "Name of the VM"
#}

#variable "vm_web_cores" {
#  type        = number
#  default     = 2
#  description = "Number of CPU cores for the VM"
#}

#variable "vm_web_memory" {
#  type        = number
#  default     = 1
#  description = "Amount of memory for the VM in GB"
#}

#variable "vm_web_core_fraction" {
#  type        = number
#  default     = 5
#  description = "Fraction of CPU core for the VM"
#}

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

#variable "vm_web_serial_port_enable" {
#  type        = number
#  default     = 1
#  description = "Enable or disable serial port for the VM"
#}

# locals

variable "vm_web_locals_platform" {
  type        = string
  default     = "netology"
  description = "Name used in local variables"
}

variable "vm_web_locals_branch" {
  type        = string
  default     = "develop"
  description = "Branch name used in local variables"
}

variable "vm_web_locals_name" {
  type        = string
  default     = "web"
  description = "Name used in local variables"
}

# Map resources

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
