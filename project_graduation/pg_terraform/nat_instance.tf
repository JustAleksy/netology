resource "yandex_compute_instance" "nat_instance" {
  name        = "nat-instance"
  platform_id = var.platform_id
  zone        = var.zones["a"]

  resources {
    cores         = var.nat_instance_resources.cores
    memory        = var.nat_instance_resources.memory
    core_fraction = var.nat_instance_resources.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = var.nat_image_id
      size     = 10
      type     = "network-hdd"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.public_subnets["a"].id
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
}