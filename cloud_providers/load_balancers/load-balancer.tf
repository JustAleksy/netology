resource "yandex_lb_network_load_balancer" "lb" {
  name      = var.lb_name
  region_id = var.region_id

  listener {
    name     = "http"
    port     = 80
    protocol = "tcp"
    target_port = 80
  }

  attached_target_group {
    target_group_id = yandex_lb_target_group.target_group.id

    healthcheck {
      name = "http"
      http_options {
        port = 80
        path = "/"
      }
      interval            = 5
      timeout             = 4
      healthy_threshold   = 2
      unhealthy_threshold = 4
    }
  }
}
