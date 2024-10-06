resource "yandex_lb_target_group" "jenkins_target_group" {
  name      = "jenkins-target-group"
  region_id = var.region_id

  target {
    subnet_id = local.private_subnet_ids_by_zone[yandex_compute_instance.jenkins_instances["jenkins-master"].zone]
    address   = yandex_compute_instance.jenkins_instances["jenkins-master"].network_interface[0].ip_address
  }
}
