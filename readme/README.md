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
### 6. Клонируем репозиторий и идем в его корень (Cloning repo) 
```bash
git clone https://github.com/higef/hcloud-tf-kozak-launcher.git && cd hcloud-tf-kozak-launcher
```
### 7. Заполняем config.yml (fill out config.yml)
Решаем сколько серверов будут смотреть на какие вебсайты (decide how many servers should target which websites)
```yml
targets:
  - host: вебсайт1 (website1)
    count: колличество серверов (server count)
  - host: вебсайт2 (website2)
    count: колличество серверов (server count)
```
### 8. Запускаем (Launching)
```terraform
terraform init
terraform apply -auto-approve"
```
### 8. Останавливаем (Stopping)
```terraform
terraform destroy -auto-approve
```
---
based on https://github.com/UA-TECH-POWER/DDoS_terraform_aws