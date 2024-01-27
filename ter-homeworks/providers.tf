terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=1.5"
}

provider "yandex" {
  # token     = var.token
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.default_zone
  service_account_key_file = file("~/.authorized_key.json")
}

provider "yandex" {
  # token     = var.vm_db_token
  alias                    = "second"
  cloud_id                 = var.vm_db_cloud_id
  folder_id                = var.vm_db_folder_id
  zone                     = var.vm_db_default_zone
  service_account_key_file = file("~/.authorized_key.json")
}
