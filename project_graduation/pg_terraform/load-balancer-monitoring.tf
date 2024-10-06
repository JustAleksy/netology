# resource "yandex_lb_network_load_balancer" "app_and_grafana_lb" {
#   name      = "app-and-grafana-lb"
#   region_id = var.region_id

#   listener {
#     name        = "app-listener"
#     port        = 80
#     target_port = 30000  # Порт для приложения
#     protocol    = "tcp"
#   }

#   listener {
#     name        = "grafana-listener"
#     port        = 8080
#     target_port = 32000  # Порт для Grafana
#     protocol    = "tcp"
#   }

#   attached_target_group {
#     target_group_id = yandex_lb_target_group.k8s_worker_target_group.id

#     healthcheck {
#       name                = "app-healthcheck"
#       interval            = 10
#       timeout             = 5
#       unhealthy_threshold = 2
#       healthy_threshold   = 2
#       tcp_options {
#         port = 30000
#       }
#     }
#   }
# }

resource "yandex_lb_network_load_balancer" "app_and_grafana_lb" {
  name      = "app-and-grafana-lb"
  region_id = var.region_id

  listener {
    name        = "http-listener"
    port        = 80          # Внешний порт для HTTP
    target_port = 31907       # NodePort для HTTP на Ingress
    protocol    = "tcp"
  }

  listener {
    name        = "https-listener"
    port        = 443         # Внешний порт для HTTPS
    target_port = 32107       # NodePort для HTTPS на Ingress
    protocol    = "tcp"
  }

  attached_target_group {
    target_group_id = yandex_lb_target_group.k8s_worker_target_group.id

    healthcheck {
      name                = "ingress-healthcheck"
      interval            = 10
      timeout             = 5
      unhealthy_threshold = 2
      healthy_threshold   = 2
      tcp_options {
        port = 31907       # Проверка доступности NodePort для HTTP
      }
    }
  }
}
