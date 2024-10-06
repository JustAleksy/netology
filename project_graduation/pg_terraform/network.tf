resource "yandex_vpc_network" "my_vpc" {
  name = var.vpc_name
}

# Публичные подсети
resource "yandex_vpc_subnet" "public_subnets" {
  for_each = var.zones

  name           = "public-${each.key}"
  zone           = each.value
  network_id     = yandex_vpc_network.my_vpc.id
  v4_cidr_blocks = [var.public_subnet_cidrs[each.key]]
}

# Приватные подсети
resource "yandex_vpc_subnet" "private_subnets" {
  for_each = var.zones

  name           = "private-${each.key}"
  zone           = each.value
  network_id     = yandex_vpc_network.my_vpc.id
  v4_cidr_blocks = [var.private_subnet_cidrs[each.key]]
  route_table_id = yandex_vpc_route_table.private_route_table.id
}

# Таблица маршрутов для приватных подсетей
resource "yandex_vpc_route_table" "private_route_table" {
  name       = "private-route-table"
  network_id = yandex_vpc_network.my_vpc.id

  static_route {
    destination_prefix = "0.0.0.0/0"
    next_hop_address   = yandex_compute_instance.nat_instance.network_interface[0].ip_address
  }
}
