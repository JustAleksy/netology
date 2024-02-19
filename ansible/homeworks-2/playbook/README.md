# Ansible-Playbook для ClickHouse и Vector

## Оглавление
- [Введение](#введение)
- [Версии и Ветвление](#версии-и-ветвление)
- [Установка и Настройка](#установка-и-настройка)
  - [Предварительные условия](#предварительные-условия)
  - [Настройка](#настройка)
  - [Установка](#установка)
  - [Конфигурация Vector](#конфигурация-vector)
- [Использование](#использование)
- [Поддержка и Вклад](#поддержка-и-вклад)

## Введение
Этот репозиторий содержит Ansible Playbook для автоматизированной установки и настройки сервера ClickHouse и инструмента Vector.

## Версии и Ветвление
Данный Playbook использует версии ClickHouse `24.1.5.6` и Vector `0.36.0-1`.

## Установка и Настройка

### Предварительные условия
- Ansible 2.9 или выше.
- SSH доступ к целевым серверам.

### Настройка
Используйте `prod.yml` для настройки хостов и `vars.yml` для определения версий компонентов.

### Установка
Запустите Playbook командой: `ansible-playbook -i inventory/prod.yml site.yml`.

### Конфигурация Vector
Vector настраивается для сбора и обработки логов с помощью шаблона `vector_config.j2`.

## Поддержка и Вклад
Приветствуется любой вклад в проект. Если у вас есть предложения или изменения, пожалуйста, создайте issue или pull request в репозитории.