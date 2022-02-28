output "ips" {
  value       = ["${hcloud_server.kozak.*.ipv4_address}"]
  description = "IP addresses of created instances"
}

output "price" {
  value       = "Hourly cost is ${var.server_price * var.kozak_count} Euro"
  description = "Hourly cost, JFYI"
}