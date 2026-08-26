variable "project_id" {
  type = string
}

variable "name" {
  type    = string
  default = "covenant-lab"
}

variable "region" {
  type    = string
  default = "europe-west1"
}

variable "zone" {
  type    = string
  default = "europe-west1-b"
}

variable "machine_type" {
  type    = string
  default = "e2-medium"
}
