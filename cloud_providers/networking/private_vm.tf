resource "yandex_compute_instance" "private_vm" {
  name        = "private-vm"
  platform_id = var.platform_id
  zone        = var.zone

  resources {
    cores         = var.private_vm_resources.cores
    memory        = var.private_vm_resources.memory
    core_fraction = var.private_vm_resources.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.private_subnet.id
  }

  metadata = {
    user-data = <<-EOF
      #cloud-config
      users:
        - name: ${var.vm_metadata.private.username}
          ssh-authorized-keys:
            - ${file(var.vm_metadata.private.ssh_key)}
          sudo: ${var.vm_metadata.private.sudo_privileges}
          shell: ${var.vm_metadata.private.shell}
    EOF
  }
}
