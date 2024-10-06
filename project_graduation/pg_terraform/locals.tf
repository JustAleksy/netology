locals {
  private_subnet_ids_by_zone = {
    for subnet in yandex_vpc_subnet.private_subnets :
    subnet.zone => subnet.id
  }

  zones_list = values(var.zones)
}
