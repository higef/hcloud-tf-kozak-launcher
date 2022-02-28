variable "hcloud_token" {
  sensitive = true
}

variable "location" {
  default = "nbg1"
}

variable "kozak_count" {
  default = 2
}

variable "server_type" {
  default = "cx11"
}

variable "os_type" {
  default = "debian-10"
}

variable "target" {}