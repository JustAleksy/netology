# Дипломный проект: Развёртывание Kubernetes-кластера в Яндекс.Облаке с CI/CD и мониторингом

## Описание проекта

Данный проект представляет собой автоматизированное развёртывание облачной инфраструктуры в Яндекс.Облаке с использованием Terraform и Ansible. В рамках проекта реализованы следующие компоненты:

- **Облачная инфраструктура**: автоматическое создание сети VPC, подсетей, виртуальных машин и балансировщиков нагрузки.
- **Kubernetes-кластер**: развёртывание кластера с одной мастер-нодой и двумя воркер-нодами.
- **Система мониторинга**: установка и настройка Prometheus, Grafana и Alertmanager для мониторинга состояния кластера.
- **Тестовое приложение**: развёртывание простого веб-приложения на базе Nginx.
- **CI/CD**: настройка Jenkins для автоматической сборки Docker-образа и деплоя приложения при изменении кода.

## Структура репозиториев

- [**pg_terraform**](https://github.com/JustAleksy/pg_terraform): конфигурационные файлы Terraform для создания облачной инфраструктуры.
- [**pg_ansible**](https://github.com/JustAleksy/pg_ansible): плейбуки Ansible для настройки Kubernetes-кластера и установки систем мониторинга и CI/CD.
- [**pg_nginx_app**](https://github.com/JustAleksy/test_app): исходный код тестового приложения, Dockerfile и манифесты Kubernetes.

## Предварительные требования

- Аккаунт в [Яндекс.Облаке](https://cloud.yandex.ru/).
- Установленные на локальной машине:
  - [Terraform](https://www.terraform.io/downloads.html) версии >= 1.0.0.
  - [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html).
  - [kubectl](https://kubernetes.io/ru/docs/tasks/tools/).
  - [Helm 3](https://helm.sh/docs/intro/install/).
  - [Git](https://git-scm.com/downloads).
- Настроенные SSH-ключи для доступа к виртуальным машинам.
- Docker Hub аккаунт (или альтернативный Docker Registry).
- Jenkins (устанавливается в рамках проекта).

## Развёртывание проекта
---
### Шаг 1: Клонирование репозиториев

```bash
# Клонируем репозиторий с Terraform конфигурациями
git clone https://github.com/JustAleksy/pg_terraform.git

# Клонируем репозиторий с Ansible плейбуками
git clone https://github.com/JustAleksy/pg_ansible.git

# Клонируем репозиторий с тестовым приложением
git clone https://github.com/JustAleksy/pg_nginx_app.git
```
---
### Шаг 2: Настройка переменных и аутентификации

1. **Terraform**:

   - Перейдите в директорию `pg_terraform`.
   - Создайте файл `terraform.tfvars` и укажите в нём необходимые переменные:

     ```hcl
     access_key               = "Ваш_Yandex_Object_Storage_Access_Key"
     secret_key               = "Ваш_Yandex_Object_Storage_Secret_Key"
     YC_SERVICE_ACCOUNT_KEY_FILE = "/путь/к/вашему/ключу/сервисного/аккаунта.json"
     ```
   - Либо используйте переменные окружения:
      ```bash
        export YC_SERVICE_ACCOUNT_KEY_FILE=/путь/до/файла
        export AWS_ACCESS_KEY_ID=<acess_key>
        export AWS_SECRET_ACCESS_KEY=<secret_key>
        export TF_VAR_access_key=<acess_key>
        export TF_VAR_secret_key=<secret_key>
      ```
   - Убедитесь, что у вас есть сервисный аккаунт с необходимыми правами и скачанный JSON-ключ.

2. **Ansible**:

   - Перейдите в директорию `pg_ansible`.
   - В файле `inventory/hosts.ini` убедитесь, что указаны правильные IP-адреса для ваших хостов.
   - Обновите путь к приватному ключу SSH в файле `ansible.cfg`:

     ```ini
     private_key_file = ~/.ssh/private_vm_key
     ```
---
### Шаг 3: Создание инфраструктуры с помощью Terraform

```bash
# 1. Перейдите в директорию pg_terraform:
cd pg_terraform

# 2. Инициализируйте Terraform:
terraform init

# 3. Проверьте конфигурацию:
terraform validate

# 4. Просмотрите план развертывания:
terraform plan

# 5. Примените изменения (подтвердите выполнение, введя 'yes', если будет запрошено):
terraform apply
```
---
### Шаг 4: Настройка Kubernetes-кластера с помощью Ansible

```bash
# 1. Перейдите в директорию pg_ansible:
cd ../pg_ansible

# 2. Убедитесь, что Ansible может подключиться к вашим серверам:
ansible all -m ping

# 3. Запустите плейбук для установки Kubernetes:
ansible-playbook -i inventory/hosts.ini playbook/kubernetes.yml

# 4. После успешного выполнения убедитесь, что контекст Kubernetes настроен:
kubectl get nodes

# Результат: должны отображаться мастер и воркер-ноды в статусе Ready.
```
---
### Шаг 5: Установка системы мониторинга
```bash
# 1. Запустите плейбук для установки мониторинга:
ansible-playbook -i inventory/hosts.ini playbook/monitoring.yml

# 2. После завершения установки проверьте, что все компоненты запущены:
kubectl get pods -n monitoring
```
**Авторизуйтесь в Grafana**
```
http://<IP-адрес балансировщика>:80
```
- **Логин**: admin
- **Пароль**: admin
---
### Шаг 6: Развёртывание тестового приложения

1. **Перейдите в директорию с приложением:**

```bash
cd ../pg_nginx_app
```
2. **Соберите Docker-образ и отправьте его в Docker Hub:**

```bash
docker build -t your_dockerhub_username/test-app:latest .
docker push your_dockerhub_username/test-app:latest
```
*Замените your_dockerhub_username на ваш логин Docker Hub.*

3. **Обновите манифест deployment.yaml в каталоге kuber, указав ваш Docker-образ.**

Примените манифесты Kubernetes:

```bash
kubectl apply -f kuber/deployment.yaml
kubectl apply -f kuber/service.yaml
```

Проверьте статус приложения:

```bash
kubectl get pods
```
Доступ к приложению осуществляется через Port 8080 по адресу:
```
http://<IP-адрес балансировщика>:8080
```
---
### Шаг 7: Настройка Jenkins для CI/CD

1. **Запустите плейбук для установки Jenkins:**

```bash
ansible-playbook -i inventory/hosts.ini playbook/jenkins.yml
```
2. **После установки перейдите в веб-интерфейс Jenkins:**
```
http://<IP_адрес_балансировщика>
```
3. **Разблокируйте Jenkins, следуя инструкциям на экране.**

4. **Установите необходимые плагины:**

- Docker Pipeline
- Kubernetes CLI
- Kubernetes Client API
- Kubernetes Credentials
- Git
- Command Agent Launcher 
- Credentials Binding
- Generic Webhook Trigger
- Terraform

1. **Создайте новую задачу в Jenkins, используя Jenkinsfile из репозитория pg_nginx_app.**

2. **Настройте креденшалы в Jenkins для доступа к Docker Hub и Kubernetes.**

Теперь при каждом коммите в репозиторий pg_nginx_app будет происходить автоматическая сборка Docker-образа и деплой в Kubernetes.

---
# Заключение
Проект демонстрирует полную цепочку автоматизации: от создания инфраструктуры до непрерывной интеграции и доставки приложения в Kubernetes-кластер с настроенной системой мониторинга.

# Чеклист
1. **Репозиторий с конфигурационными файлами Terraform и готовность продемонстрировать создание всех ресурсов с нуля.**
```
https://github.com/JustAleksy/pg_terraform
```
2. **Пример CI-CD-terraform pipeline.**
```ruby
Started by user Кряжевских Алексей Александрович
Checking out git https://github.com/JustAleksy/pg_terraform into /var/lib/jenkins/workspace/d@script/db1b608b46aa6c5de37fc738842c2aae538848919591dae24e8a82acc3142ca6 to read Jenkinsfile
The recommended git tool is: NONE
using credential 959684e1-53c5-4126-b3f4-7e6d79912413
Cloning the remote Git repository
Cloning repository https://github.com/JustAleksy/pg_terraform
 > git init /var/lib/jenkins/workspace/d@script/db1b608b46aa6c5de37fc738842c2aae538848919591dae24e8a82acc3142ca6 # timeout=10
Fetching upstream changes from https://github.com/JustAleksy/pg_terraform
 > git --version # timeout=10
 > git --version # 'git version 2.34.1'
using GIT_ASKPASS to set credentials GiHub
 > git fetch --tags --force --progress -- https://github.com/JustAleksy/pg_terraform +refs/heads/*:refs/remotes/origin/* # timeout=10
 > git config remote.origin.url https://github.com/JustAleksy/pg_terraform # timeout=10
 > git config --add remote.origin.fetch +refs/heads/*:refs/remotes/origin/* # timeout=10
Avoid second fetch
 > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
Checking out Revision 3afb4bc9d9a687c823aebc0c55f32abd1787e530 (refs/remotes/origin/master)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 3afb4bc9d9a687c823aebc0c55f32abd1787e530 # timeout=10
Commit message: "Дипломный проект"
First time build. Skipping changelog.
[Pipeline] Start of Pipeline
[Pipeline] node
Running on agent in /opt/jenkins_agent/workspace/d
[Pipeline] {
[Pipeline] stage
[Pipeline] { (Declarative: Checkout SCM)
[Pipeline] checkout
The recommended git tool is: NONE
using credential 959684e1-53c5-4126-b3f4-7e6d79912413
Cloning the remote Git repository
Avoid second fetch
Checking out Revision 3afb4bc9d9a687c823aebc0c55f32abd1787e530 (refs/remotes/origin/master)
Commit message: "Дипломный проект"
Cloning repository https://github.com/JustAleksy/pg_terraform
 > git init /opt/jenkins_agent/workspace/d # timeout=10
Fetching upstream changes from https://github.com/JustAleksy/pg_terraform
 > git --version # timeout=10
 > git --version # 'git version 2.34.1'
using GIT_ASKPASS to set credentials GiHub
 > git fetch --tags --force --progress -- https://github.com/JustAleksy/pg_terraform +refs/heads/*:refs/remotes/origin/* # timeout=10
 > git config remote.origin.url https://github.com/JustAleksy/pg_terraform # timeout=10
 > git config --add remote.origin.fetch +refs/heads/*:refs/remotes/origin/* # timeout=10
 > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 3afb4bc9d9a687c823aebc0c55f32abd1787e530 # timeout=10
[Pipeline] }
[Pipeline] // stage
[Pipeline] withEnv
[Pipeline] {
[Pipeline] withCredentials
Masking supported pattern matches of $TF_VAR_access_key or $AWS_ACCESS_KEY_ID or $AWS_SECRET_ACCESS_KEY or $YC_SERVICE_ACCOUNT_KEY_FILE or $TF_VAR_secret_key
[Pipeline] {
[Pipeline] stage
[Pipeline] { (Checkout)
[Pipeline] git
The recommended git tool is: NONE
No credentials specified
Fetching changes from the remote Git repository
Checking out Revision 3afb4bc9d9a687c823aebc0c55f32abd1787e530 (refs/remotes/origin/master)
Commit message: "Дипломный проект"
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Terraform Init)
 > git rev-parse --resolve-git-dir /opt/jenkins_agent/workspace/d/.git # timeout=10
 > git config remote.origin.url https://github.com/JustAleksy/pg_terraform # timeout=10
Fetching upstream changes from https://github.com/JustAleksy/pg_terraform
 > git --version # timeout=10
 > git --version # 'git version 2.34.1'
 > git fetch --tags --force --progress -- https://github.com/JustAleksy/pg_terraform +refs/heads/*:refs/remotes/origin/* # timeout=10
 > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 3afb4bc9d9a687c823aebc0c55f32abd1787e530 # timeout=10
 > git branch -a -v --no-abbrev # timeout=10
 > git checkout -b master 3afb4bc9d9a687c823aebc0c55f32abd1787e530 # timeout=10
[Pipeline] sh
+ terraform init
Initializing the backend...
Successfully configured the backend "s3"! Terraform will automatically
use this backend unless the backend configuration changes.
Initializing provider plugins...
- Finding yandex-cloud/yandex versions matching "~> 0.76"...
- Installing yandex-cloud/yandex v0.131.0...
- Installed yandex-cloud/yandex v0.131.0 (unauthenticated)
Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.
Warning: Incomplete lock file information for providers
Terraform has been successfully initialized!
+ terraform validate
Success! The configuration is valid.
+ terraform plan
...
Apply complete! Resources: 1 added, 1 changed, 0 destroyed.
Outputs:
bucket_name = "tf-state-bucket-justaleksy"
jenkins_agent_ip = "10.0.2.35"
jenkins_master_ip = "10.0.1.32"
jump_host_public_ip = "158.160.21.90"
k8s_master_ips = [
  "10.0.1.30",
]
k8s_worker_ips = [
  "10.0.1.29",
  "10.0.2.10",
  "10.0.3.24",
]
kms_key_id = "abjv4eu54ns4s20btqrs"
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Declarative: Post Actions)
[Pipeline] archiveArtifacts
Archiving artifacts
[Pipeline] echo
Terraform applied successfully!
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
[Pipeline] // withCredentials
[Pipeline] }
[Pipeline] // withEnv
[Pipeline] }
[Pipeline] // node
[Pipeline] End of Pipeline
Finished: SUCCESS
```
3. **Репозиторий с конфигурацией ansible, если был выбран способ создания Kubernetes кластера при помощи ansible.**
```
https://github.com/JustAleksy/pg_ansible
```
4. **Репозиторий с Dockerfile тестового приложения и ссылка на собранный docker image.**
- **Репозиторий**: 
  ```
  https://github.com/JustAleksy/test_app
  ```
- **Docker Hub**: 
  ```
  https://hub.docker.com/repository/docker/justmeat/test-app/general
  ```
5. **Репозиторий с конфигурацией Kubernetes кластера (интегрирован в репозиторий тестового приложения).**
```
https://github.com/JustAleksy/test_app
```
6. **Ссылка на тестовое приложение и веб интерфейс Grafana с данными доступа.**  
**Grafana**: 
```
http://84.201.170.225:80
```
- **Логин**: admin
- **Пароль**: В комментарии к заданию

**test_app**: 
```
http://84.201.170.225:8080
```
7. **Все репозитории рекомендуется хранить на одном ресурсе (github, gitlab)**