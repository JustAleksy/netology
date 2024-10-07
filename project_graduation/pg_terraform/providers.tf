terraform {
  required_version = ">= 1.0.0"

  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "~> 0.76"
    }
  }

  backend "s3" {
    endpoints = {
      s3 = "https://storage.yandexcloud.net"
    }
    bucket = "tf-state-bucket-justaleksy"
    region = "ru-central1"
    key    = "~/terraform.tfstate"

    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true

  }
}

provider "yandex" {
  token     = var.token != "" ? var.token : var.YC_TOKEN
  # service_account_key_file = var.SA_KEY_FILE
  storage_access_key = var.access_key
  storage_secret_key = var.secret_key
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.zones["a"]
}
