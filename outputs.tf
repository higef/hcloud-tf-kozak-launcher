output "ips" {
  value = ["${hcloud_server.kozak.*.ipv4_address}"]
}
