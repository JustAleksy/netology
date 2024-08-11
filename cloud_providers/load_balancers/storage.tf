resource "yandex_storage_bucket" "my_bucket" {
  bucket     = "${var.student_name}-${formatdate("YYYYMMDD", timestamp())}"
  acl        = var.storage_acl
  access_key = var.YC_ACCESS_KEY
  secret_key = var.YC_SECRET_KEY
}

resource "null_resource" "upload_image" {
  depends_on = [yandex_storage_bucket.my_bucket]

  provisioner "local-exec" {
    command = <<EOT
      export AWS_ACCESS_KEY_ID=$${YC_ACCESS_KEY} 
      export AWS_SECRET_ACCESS_KEY=$${YC_SECRET_KEY}
      aws --endpoint-url=https://storage.yandexcloud.net s3 cp ~/study/image.jpg s3://${yandex_storage_bucket.my_bucket.bucket}/image.jpg
    EOT
  }
}

resource "null_resource" "empty_bucket" {
  provisioner "local-exec" {
    command = <<EOT
      export AWS_ACCESS_KEY_ID=$${YC_ACCESS_KEY} 
      export AWS_SECRET_ACCESS_KEY=$${YC_SECRET_KEY}
      aws --endpoint-url=https://storage.yandexcloud.net s3 rm s3://${yandex_storage_bucket.my_bucket.bucket} --recursive
      sleep 20
    EOT
  }

  triggers = {
    bucket_id = yandex_storage_bucket.my_bucket.id
  }
}
