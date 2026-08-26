variable "name" {
  type    = string
  default = "covenant-lab"
}

variable "region" {
  type    = string
  default = "eu-west-3"
}

variable "az" {
  type    = string
  default = "eu-west-3a"
}

variable "vpc_cidr" {
  type    = string
  default = "10.42.0.0/16"
}

variable "subnet_cidr" {
  type    = string
  default = "10.42.1.0/24"
}

variable "instance_type" {
  type    = string
  default = "t3.medium"
}
