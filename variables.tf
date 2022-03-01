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
  default     = "debian-10"
  description = "Operating system type"
}
