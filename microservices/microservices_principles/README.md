# Домашне задание по теме "Микросервисы: принципы"
---
## Задача 1: API Gateway

### Требования к API Gateway:

1. Маршрутизация запросов к нужному сервису на основе конфигурации.
2. Возможность проверки аутентификационной информации в запросах.
3. Обеспечение терминации HTTPS.

### Сравнительная таблица возможностей различных программных решений для API Gateway:

| Параметр/Решение     | Kong                   | Apigee                | AWS API Gateway       | Nginx                     |
|---------------------|------------------------|-----------------------|-----------------------|---------------------------|
| **Маршрутизация**   | Поддержка на уровне URI, заголовков и других параметров | Динамическая маршрутизация на основе содержимого запросов | Поддержка на уровне URI, параметров запроса | Поддержка базовой маршрутизации на уровне URI |
| **Аутентификация**  | JWT, OAuth2.0, Basic Auth, Key Auth, LDAP, и другие | Широкий спектр методов, включая OAuth, SAML, JWT, и Key Auth | Cognito User Pools, Lambda Authorizers, IAM Roles | JWT, Basic Auth, OAuth2.0 |
| **HTTPS Терминация**| Полная поддержка       | Полная поддержка       | Полная поддержка       | Полная поддержка           |
| **Расширяемость**   | Плагины; возможность добавления собственных | Различные политики и скрипты | Лямбда-функции для обработки запросов | Модульная архитектура с поддержкой Lua скриптов |
| **Управление API**  | Управление версиями, ограничение частоты запросов, мониторинг | Управление жизненным циклом API, аналитика, мониторинг | Управление версиями, мониторинг, интеграция с другими AWS сервисами | Базовое управление, ограничение частоты запросов |
| **Облачная интеграция** | Поддержка многих облачных провайдеров | Мощная интеграция в облачной среде Google Cloud | Глубокая интеграция с AWS сервисами | Независим, подходит для любой облачной среды |

### Выбор решения и его обоснование

На основе вышеуказанной таблицы и требований, рекомендуется выбрать **AWS API Gateway** для реализации API Gateway в микросервисной архитектуре по следующим причинам:

- **Интеграция с AWS**: Если инфраструктура уже использует сервисы AWS, API Gateway будет легко интегрироваться с другими сервисами AWS, что упрощает управление и мониторинг.
- **Безопасность и маршрутизация**: AWS API Gateway предоставляет продвинутые возможности для управления доступом и аутентификации, включая интеграцию с AWS IAM и Cognito, что обеспечивает высокий уровень безопасности.
- **Терминация HTTPS**: Этот сервис поддерживает терминацию HTTPS "из коробки", обеспечивая безопасную обработку шифрованного трафика.

Выбор этого решения позволит эффективно управлять запросами к микросервисам, обеспечивая надежную аутентификацию и безопасное соединение.

---

## Задача 2: Брокер сообщений

### Требования к брокеру сообщений:

1. Поддержка кластеризации для обеспечения надёжности.
2. Хранение сообщений на диске в процессе доставки.
3. Высокая скорость работы.
4. Поддержка различных форматов сообщений.
5. Разделение прав доступа к различным потокам сообщений.
6. Простота эксплуатации.

### Сравнительная таблица возможностей различных брокеров сообщений:

| Параметр/Решение     | Apache Kafka             | RabbitMQ                  | Amazon SQS                | ActiveMQ                  |
|----------------------|--------------------------|---------------------------|---------------------------|---------------------------|
| **Кластеризация**    | Отличная поддержка       | Поддержка с использованием плагинов | Не требуется, обслуживается AWS | Поддерживается, но с ограничениями |
| **Хранение на диске**| Да, постоянное хранение  | Да, опционально           | Нет, управляемый сервис   | Да, опционально           |
| **Скорость работы**  | Очень высокая            | Средняя                   | Зависит от настройки AWS  | Средняя                   |
| **Форматы сообщений**| Байты, произвольные форматы | Множество форматов, включая JSON, XML | Ограничен, преимущественно текстовые | Множество форматов, включая JSON, XML |
| **Разделение доступа** | Гибкие настройки ACL   | Поддержка разделения с помощью плагинов | IAM Roles для доступа      | Поддерживается, но менее гибко |
| **Простота эксплуатации** | Средняя                | Высокая                   | Высокая, как управляемый сервис | Средняя                   |

### Выбор решения и его обоснование

На основе вышеуказанной таблицы и требований, рекомендуется выбрать **Apache Kafka** для реализации брокера сообщений в микросервисной архитектуре по следующим причинам:

- **Надёжность и кластеризация**: Kafka известен своей высокой устойчивостью и отличной поддержкой кластеризации, что критично для обеспечения надёжности в распределённых системах.
- **Хранение сообщений на диске**: Kafka обеспечивает постоянное хранение сообщений на диске, что гарантирует сохранность данных даже при сбоях системы.
- **Высокая скорость работы**: Kafka спроектирован для обработки больших объемов данных с высокой пропускной способностью, что делает его идеальным выбором для систем, требующих высокой производительности.
- **Поддержка различных форматов сообщений**: Поддержка произвольных форматов данных позволяет гибко интегрироваться с различными приложениями и сервисами.
- **Разделение прав доступа**: Kafka предлагает продвинутые настройки для контроля доступа к сообщениям, что важно для обеспечения безопасности и соответствия политикам доступа.

Этот выбор поддерживается высокой устойчивостью и масштабируемостью Kafka, что делает его подходящим для комплексных и критически важных систем.