# Cloud Vars
variable "vm_db_token" {
  type        = string
  default     = "ups-ups"
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "vm_db_cloud_id" {
  type        = string
  default     = "b1g42ti2ko6ej4ofm9me"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "vm_db_folder_id" {
  type        = string
  default     = "b1gt4l5ig7dgpnm1aqc6"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "vm_db_default_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "vm_db_default_cidr" {
  type        = list(string)
  default     = ["10.0.0.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vm_db_vpc_name" {
  type        = string
  default     = "develop-db"
  description = "VPC network & subnet name"
}

# SSH Vars
#variable "vm_web_vms_ssh_root_key" {
#  type        = string
#  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFblJ9p542BWB/TxbZ3cCaU7JED+pzwD50WLA4YJ5I6t meat@MeaT"
#  description = "ssh-keygen -t ed25519"
#}

# VM DB Variables
variable "vm_db_image_name" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "VM image"
}

#variable "vm_db_name" {
#  type        = string
#  default     = "netology-develop-platform-db"
#  description = "Name of the VM"
#}

#variable "vm_db_cores" {
#  type        = number
#  default     = 2
#  description = "Number of CPU cores for the VM"
#}

#variable "vm_db_memory" {
#  type        = number
#  default     = 2
#  description = "Amount of memory for the VM in GB"
#}

#variable "vm_db_core_fraction" {
#  type        = number
#  default     = 20
#  description = "Fraction of CPU core for the VM"
#}

variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "Platform ID for the VM"
}

variable "vm_db_preemptible" {
  type        = bool
  default     = true
  description = "Whether the VM is preemptible or not"
}

variable "vm_db_nat" {
  type        = bool
  default     = true
  description = "Whether NAT is enabled for the VM"
}

#variable "vm_db_serial_port_enable" {
#  type        = number
#  default     = 1
#  description = "Enable or disable serial port for the VM"
#}

# locals

variable "vm_db_locals_platform" {
  type        = string
  default     = "netology"
  description = "Name used in local variables"
}

variable "vm_db_locals_name" {
  type        = string
  default     = "db"
  description = "Name used in local variables"
}

variable "vm_db_locals_branch" {
  type        = string
  default     = "develop"
  description = "Branch name used in local variables"
}
