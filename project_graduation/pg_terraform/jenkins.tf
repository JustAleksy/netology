resource "yandex_compute_instance" "jenkins_instances" {
  for_each = { for vm in var.jenkins_vms : vm.name => vm }

  name        = each.value.name
  platform_id = var.platform_id
  zone        = each.value.zone

  resources {
    cores         = each.value.cpu
    memory        = each.value.memory
    core_fraction = each.value.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size     = each.value.disk_size
      type     = "network-ssd"
    }
  }

  network_interface {
    subnet_id = local.private_subnet_ids_by_zone[each.value.zone]
  }

  metadata = {
    ssh-keys = "${var.vm_metadata.private.username}:${file(var.vm_metadata.private.ssh_public_key)}"
    user-data = <<-EOF
      #cloud-config
      datasource:
       Ec2:
        strict_id: false
      ssh_pwauth: no
      users:
        - name: ${var.vm_metadata.private.username}
          sudo: ${var.vm_metadata.private.sudo_privileges}  
          shell: ${var.vm_metadata.private.shell}      
          ssh-authorized-keys:
          - ${file(var.vm_metadata.private.ssh_public_key)}
    EOF
  }
}
