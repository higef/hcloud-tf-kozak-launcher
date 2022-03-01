Инструкция (Guide) https://github.com/higef/hcloud-tf-kozak-launcher/blob/main/readme/README.md

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_hcloud"></a> [hcloud](#provider\_hcloud) | 1.33.1 |
| <a name="provider_local"></a> [local](#provider\_local) | 2.1.0 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 3.1.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [hcloud_server.kozak](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/server) | resource |
| [hcloud_ssh_key.cloud_ssh_key](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/ssh_key) | resource |
| [local_file.kozak](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [tls_private_key.ssh_key](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_hcloud_token"></a> [hcloud\_token](#input\_hcloud\_token) | Hetzner API Token | `string` | n/a | yes |
| <a name="input_locations"></a> [locations](#input\_locations) | Available Hetzner locations | `list(string)` | <pre>[<br>  "hel1",<br>  "nbg1",<br>  "fsn1"<br>]</pre> | no |
| <a name="input_os_type"></a> [os\_type](#input\_os\_type) | Operating system type | `string` | `"debian-10"` | no |
| <a name="input_server_price"></a> [server\_price](#input\_server\_price) | Hourly cost per instance | `number` | `0.007` | no |
| <a name="input_server_type"></a> [server\_type](#input\_server\_type) | Instance type | `string` | `"cx11"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ips"></a> [ips](#output\_ips) | IP addresses of created instances |
| <a name="output_price"></a> [price](#output\_price) | Hourly cost, JFYI |
<!-- END_TF_DOCS -->