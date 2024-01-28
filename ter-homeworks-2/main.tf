# Определение VPC сети
resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}

# Определение подсети для веб-приложения
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}
