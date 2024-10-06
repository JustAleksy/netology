resource "yandex_lb_network_load_balancer" "jenkins_lb" {
  name      = "jenkins-lb"
  region_id = var.region_id

  listener {
    name        = "jenkins-listener"
    port        = 80  # Порт, на котором будет доступен Jenkins извне
    target_port = 8080  # Порт Jenkins на мастер-ноде
    protocol    = "tcp"
  }

  attached_target_group {
    target_group_id = yandex_lb_target_group.jenkins_target_group.id

    healthcheck {
      name                = "jenkins-healthcheck"
      interval            = 10
      timeout             = 5
      unhealthy_threshold = 4
      healthy_threshold   = 2
      tcp_options {
        port = 8080  # Порт Jenkins на мастер-ноде
      }
    }
  }
}
