resource "yandex_compute_instance" "public_vm" {
  name        = "public-vm"
  platform_id = var.platform_id
  zone        = var.zone

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
    subnet_id = yandex_vpc_subnet.public_subnet.id
    nat       = true
  }

  connection {
    type        = "ssh"
    host        = self.network_interface[0].nat_ip_address
    user        = var.vm_metadata.public.username
    private_key = file(var.ssh_private_key)
  }

  provisioner "file" {
    source      = "~/.ssh/private_vm_key"
    destination = "/home/${var.vm_metadata.private.username}/.ssh/private_vm_key"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod 600 /home/${var.vm_metadata.private.username}/.ssh/private_vm_key"
    ]
  }

  metadata = {
    user-data = <<-EOF
      #cloud-config
      users:
        - name: ${var.vm_metadata.public.username}
          ssh-authorized-keys:
            - ${file(var.vm_metadata.public.ssh_key)}
          shell: ${var.vm_metadata.public.shell}
          sudo: ${var.vm_metadata.public.sudo_privileges}
    EOF
  }
}
