resource "yandex_vpc_network" "my_vpc" {
  name = "${var.student_name}-vpc"
}

resource "yandex_vpc_subnet" "public_subnet" {
  name           = "${var.student_name}-public-subnet"
  zone           = var.zone
  network_id     = yandex_vpc_network.my_vpc.id
  v4_cidr_blocks = [var.public_subnet_cidr]
}
