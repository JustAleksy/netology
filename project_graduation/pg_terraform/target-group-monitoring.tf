resource "yandex_lb_target_group" "k8s_worker_target_group" {
  name      = "k8s-worker-target-group"
  region_id = var.region_id

  dynamic "target" {
    for_each = yandex_compute_instance.k8s_worker_nodes

    content {
      subnet_id = local.private_subnet_ids_by_zone[target.value.zone]
      address   = target.value.network_interface[0].ip_address
    }
  }
}
