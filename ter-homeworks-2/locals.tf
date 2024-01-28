locals {
    serial-port-enable = 1
    ssh  = "${var.locals_name}:${file(var.locals_ssh)}"
}