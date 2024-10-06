resource "yandex_compute_instance" "jump_host" {
  name        = "jump-host"
  platform_id = var.platform_id
  zone        = var.zones["b"]

  resources {
    cores         = var.public_vm_resources.cores
    memory        = var.public_vm_resources.memory
    core_fraction = var.public_vm_resources.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size     = 20
      type     = "network-hdd"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.public_subnets["b"].id
    nat       = true
  }

  metadata = {
    ssh-keys = "${var.vm_metadata.public.username}:${file(var.vm_metadata.public.ssh_public_key)}"
    user-data = <<-EOF
      #cloud-config
      datasource:
       Ec2:
        strict_id: false
      ssh_pwauth: no
      users:
        - name: ${var.vm_metadata.public.username}
          sudo: ${var.vm_metadata.public.sudo_privileges}  
          shell: ${var.vm_metadata.public.shell}      
          ssh-authorized-keys:
          - ${file(var.vm_metadata.public.ssh_public_key)}
    EOF
  }

  connection {
    type        = "ssh"
    host        = self.network_interface[0].nat_ip_address
    user        = var.vm_metadata.public.username
    private_key = file(var.ansible_public_key)
  }

  provisioner "file" {
    source      = "~/.ssh/private_vm_key"
    destination = "/home/${var.vm_metadata.public.username}/.ssh/private_vm_key"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod 600 /home/${var.vm_metadata.private.username}/.ssh/private_vm_key"
    ]
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt install -y software-properties-common",
      "sudo apt install -y ansible"
    ]
  }
}