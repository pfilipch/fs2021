variable resource_group {
  description = "Name of resource group to provision resources"
  default     = "default"
}

variable "ibmcloud_region" {
  description = "Preferred IBM Cloud region to use for your infrastructure"
  default = "us-south"
}

variable "vpc_name" {
  default = "vpc-fs2021-vpc-lab"
  description = "Name of your VPC"
}

variable "zone1" {
  default = "us-south-1"
  description = "Define the 1st zone of the region"
}

variable "zone2" {
  default = "us-south-2"
  description = "Define the 2nd zone of the region"
}

variable "zone3" {
  default = "us-south-3"
  description = "Define the 2nd zone of the region"
}

variable "zone1_cidr" {
  default = "10.10.0.0/24"
  description = "CIDR block to be used for zone 1"
}

variable "zone2_cidr" {
  default = "10.20.0.0/24"
  description = "CIDR block to be used for zone 2"
}

variable "zone3_cidr" {
  default = "10.30.0.0/24"
  description = "CIDR block to be used for zone 2"
}

variable "subnet1-name" {
  default = "fs2021-vpc-lab-sn1"
  description = "Name to be used for subnet 1"
}

variable "subnet2-name" {
  default = "fs2021-vpc-lab-sn2"
  description = "Name to be used for subnet 2"
}

variable "subnet3-name" {
  default = "fs2021-vpc-lab-sn3"
  description = "Name to be used for subnet 3"
}

variable "subnet1-pg-name" {
  default = "fs2021-vpc-sn1-pg"
  description = "Name to be used for subnet1 public gateway"
}

variable "subnet2-pg-name" {
  default = "fs2021-vpc-sn2-pg"
  description = "Name to be used for subnet2 public gateway"
}

variable "subnet3-pg-name" {
  default = "fs2021-vpc-sn3-pg"
  description = "Name to be used for subnet2 public gateway"
}
