output "ips" {
  value = ["${hcloud_server.kozak.*.ipv4_address}"]
}

output "price" {
  value = "Hourly cost is ${var.server_price * var.kozak_count}"
}