resource "yandex_lb_target_group" "target_group" {
  name      = "my-target-group"
  region_id = var.region_id

  target {
    subnet_id = yandex_vpc_subnet.public_subnet.id
    address   = yandex_compute_instance_group.lamp_group.instances[0].network_interface[0].ip_address
  }
}
