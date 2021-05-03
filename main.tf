resource "ibm_is_vpc" "vpc1" {
  name = "${var.vpc_name}"
}

resource "ibm_is_vpc_address_prefix" "vpc-ap1" {
  name = "vpc-ap1"
  zone = "${var.zone1}"
  vpc  = "${ibm_is_vpc.vpc1.id}"
  cidr = "${var.zone1_cidr}"
}

resource "ibm_is_vpc_address_prefix" "vpc-ap2" {
  name = "vpc-ap2"
  zone = "${var.zone2}"
  vpc  = "${ibm_is_vpc.vpc1.id}"
  cidr = "${var.zone2_cidr}"
}

resource "ibm_is_vpc_address_prefix" "vpc-ap3" {
  name = "vpc-ap3"
  zone = "${var.zone3}"
  vpc  = "${ibm_is_vpc.vpc1.id}"
  cidr = "${var.zone3_cidr}"
}

resource "ibm_is_public_gateway" "subnet1-pg" {
    name = "${var.subnet1-pg-name}"
    vpc = "${ibm_is_vpc.vpc1.id}"
    zone = "${var.zone1}"
}

resource "ibm_is_public_gateway" "subnet2-pg" {
    name = "${var.subnet2-pg-name}"
    vpc = "${ibm_is_vpc.vpc1.id}"
    zone = "${var.zone2}"
}

resource "ibm_is_public_gateway" "subnet3-pg" {
    name = "${var.subnet3-pg-name}"
    vpc = "${ibm_is_vpc.vpc1.id}"
    zone = "${var.zone3}"
}

resource "ibm_is_subnet" "subnet1" {
  name            = "${var.subnet1-name}"
  vpc             = "${ibm_is_vpc.vpc1.id}"
  zone            = "${var.zone1}"
  ipv4_cidr_block = "${var.zone1_cidr}"
  public_gateway  = "${ibm_is_public_gateway.subnet1-pg.id}"
  depends_on      = ["ibm_is_vpc_address_prefix.vpc-ap1"]
}

resource "ibm_is_subnet" "subnet2" {
  name            = "${var.subnet2-name}"
  vpc             = "${ibm_is_vpc.vpc1.id}"
  zone            = "${var.zone2}"
  ipv4_cidr_block = "${var.zone2_cidr}"
  public_gateway  = "${ibm_is_public_gateway.subnet2-pg.id}"
  depends_on      = ["ibm_is_vpc_address_prefix.vpc-ap2"]
}

resource "ibm_is_subnet" "subnet3" {
  name            = "${var.subnet3-name}"
  vpc             = "${ibm_is_vpc.vpc1.id}"
  zone            = "${var.zone3}"
  ipv4_cidr_block = "${var.zone3_cidr}"
  public_gateway  = "${ibm_is_public_gateway.subnet3-pg.id}"
  depends_on      = ["ibm_is_vpc_address_prefix.vpc-ap3"]
}

resource "ibm_is_security_group_rule" "sg1_tcp_rule_22" {
  group     = "${ibm_is_vpc.vpc1.default_security_group}"
  direction = "inbound"
  remote    = "0.0.0.0/0"
  tcp = {
    port_min = "22"
    port_max = "22"
  }
}

resource "ibm_is_security_group_rule" "sg1_tcp_rule_80" {
  group     = "${ibm_is_vpc.vpc1.default_security_group}"
  direction = "inbound"
  remote    = "0.0.0.0/0"
  tcp = {
    port_min = "80"
    port_max = "80"
  }
}
