resource "yandex_compute_instance_group" "lamp_group" {
  name               = var.instance_group_name
  service_account_id = var.service_account_id

  instance_template {
    platform_id = var.platform_id
    resources {
      cores         = var.public_vm_resources.cores
      memory        = var.public_vm_resources.memory
      core_fraction = var.public_vm_resources.core_fraction
    }
    boot_disk {
      initialize_params {
        image_id = var.image_id
      }
    }
    network_interface {
      subnet_ids = [yandex_vpc_subnet.public_subnet.id]
      nat        = true
    }

    metadata = {
      user-data = <<-EOF
        #cloud-config
        users:
          - name: ${var.vm_metadata.username}
            ssh-authorized-keys:
              - ${file(var.vm_metadata.ssh_key)}
            sudo: ${var.vm_metadata.sudo_privileges}
            shell: ${var.vm_metadata.shell}

        #!/bin/bash
        apt update && apt install -y apache2 mysql-server php libapache2-mod-php php-mysql
        echo "<html><body><h1>Welcome to LAMP</h1><img src='https://storage.yandexcloud.net/${yandex_storage_bucket.my_bucket.bucket}/image.jpg'></body></html>" > /var/www/html/index.html
        systemctl restart apache2
      EOF
    }
  }

  scale_policy {
    fixed_scale {
      size = 3
    }
  }

  allocation_policy {
    zones = [var.zone]
  }

  deploy_policy {
    max_unavailable = 1
    max_expansion   = 0
  }

  health_check {
    interval            = 10
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 4
    tcp_options {
      port = 80
    }
  }
}
