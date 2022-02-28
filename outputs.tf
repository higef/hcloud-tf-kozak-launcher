output "ips" {
  value       = ["${hcloud_server.kozak.*.ipv4_address}"]
  description = "IP addresses of created instances"
}

output "price" {
  value       = "Hourly cost is ${var.server_price * length(local.t_array)} Euro"
  description = "Hourly cost, JFYI"
}