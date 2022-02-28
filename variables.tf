variable "hcloud_token" {
  type        = string
  sensitive   = true
  description = "Hetzner API Token"
}

variable "location" {
  type        = string
  default     = "nbg1"
  description = "Hetzner location (default is Nuremberg)"
}

variable "kozak_count" {
  type        = number
  default     = 2
  description = "Number of instances to spin up"
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

variable "target" {
  description = "Target URL"
}