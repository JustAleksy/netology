resource "yandex_compute_instance" "k8s_worker_nodes" {
  count = 2
  name  = "k8s-worker-${count.index}"
  platform_id = var.platform_id

  zone = element(local.zones_list, count.index % length(local.zones_list))

  resources {
    cores         = var.k8s_worker_resources.cores
    memory        = var.k8s_worker_resources.memory
    core_fraction = var.k8s_worker_resources.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size     = 10
      type     = "network-ssd"
    }
  }

  network_interface {
    subnet_id = local.private_subnet_ids_by_zone[element(local.zones_list, count.index % length(local.zones_list))]
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
