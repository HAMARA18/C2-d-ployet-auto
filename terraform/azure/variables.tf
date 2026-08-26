variable "name" {
  type    = string
  default = "covenant-lab"
}

variable "location" {
  type    = string
  default = "West Europe"
}

variable "size" {
  type    = string
  default = "Standard_B2s"
}

variable "admin_username" {
  type    = string
  default = "labadmin"
}

variable "ssh_public_key" {
  type        = string
  description = "Chemin vers la clé publique SSH"
}
