output "web_instance_info" {
  value = {
    instance_name = yandex_compute_instance.web[0].name
    external_ip   = yandex_compute_instance.web[0].network_interface.0.nat_ip_address
    fqdn          = yandex_compute_instance.web[0].fqdn
  }
}

output "db_instance_info" {
  value = {
    instance_name = yandex_compute_instance.db["main"].name
    external_ip   = yandex_compute_instance.db["main"].network_interface.0.nat_ip_address
    fqdn          = yandex_compute_instance.db["main"].fqdn
  }
}


output "storage_instance_info" {
  value = {
    instance_name = yandex_compute_instance.storage_vm.name
    external_ip   = yandex_compute_instance.storage_vm.network_interface.0.nat_ip_address
    fqdn          = yandex_compute_instance.storage_vm.fqdn
  }
}