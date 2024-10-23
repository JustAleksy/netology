resource "yandex_storage_bucket" "tf_state_bucket" {
  bucket = "tf-state-bucket-justaleksy"
  acl    = "private"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm   = "aws:kms"
        kms_master_key_id = yandex_kms_symmetric_key.tf_state_key.id
      }
    }
  }
}

resource "yandex_kms_symmetric_key" "tf_state_key" {
  name                = "tf-state-key"
  description         = "Key for encrypting Terraform state in the bucket"
  default_algorithm   = "AES_256"
  rotation_period     = "8760h"
  deletion_protection = false
  folder_id           = var.folder_id
}
