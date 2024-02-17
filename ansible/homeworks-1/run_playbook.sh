#!/bin/bash

# Поднятие контейнеров
echo "Запуск Docker контейнеров..."
docker run -d --name ubuntu_container ubuntu_python /bin/bash -c "sleep infinity"
docker run -d --name centos_container centos_python /bin/bash -c "sleep infinity"
docker run -d --name fedorka_container pycontribs/fedora /bin/bash -c "sleep infinity"

# Запуск Ansible Playbook
echo "Запуск Ansible Playbook..."
ansible-playbook -i inventory/prod.yml site.yml --ask-vault-pass

# Остановка контейнеров
echo "Остановка Docker контейнеров..."
docker stop ubuntu_container
docker stop centos_container
docker stop fedorka_container
