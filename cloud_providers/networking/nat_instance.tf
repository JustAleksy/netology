resource "yandex_compute_instance" "nat_instance" {
  name        = "nat-instance"
  platform_id = var.platform_id
  zone        = var.zone

  resources {
    cores         = var.nat_instance_resources.cores
    memory        = var.nat_instance_resources.memory
    core_fraction = var.nat_instance_resources.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
    }
  }

  network_interface {
    subnet_id  = yandex_vpc_subnet.public_subnet.id
    nat        = true
    ip_address = var.nat_ip_address
  }

  metadata = {
    user-data = <<-EOF
      #cloud-config
      users:
        - name: ${var.vm_metadata.public.username}
          ssh-authorized-keys:
            - ${file(var.vm_metadata.public.ssh_key)}
          sudo: ${var.vm_metadata.public.sudo_privileges}
          shell: ${var.vm_metadata.public.shell}
    EOF
  }
}
