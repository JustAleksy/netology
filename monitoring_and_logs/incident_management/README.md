# Постмортем сбоя в системе GitHub 21 октября 2018 года

## Краткое описание инцидента

- **Дата и время:** 21 октября 2018 года, начало в 22:52 UTC.
- **Продолжительность:** Приблизительно 24 часа и 11 минут затруднений в работе сервисов.
- **Вовлеченные системы:** Сетевая инфраструктура, серверы баз данных MySQL в различных центрах обработки данных (восточное и западное побережье США).
- **Влияние:** Кратковременное прерывание связи между узлами вызвало длительное ухудшение качества работы сервисов, затруднения с доступностью данных и задержки в обработке запросов.

## Хронология событий

- **22:52 UTC:** Плановые работы по замене оптического оборудования вызвали потерю связи между основным центром данных на восточном побережье и сетевым узлом в этом же регионе. Связь была восстановлена через 43 секунды.
- **22:54 UTC:** Начались первые сбои в системе. Инженеры начали реагирование на инцидент.
- **23:07 UTC:** Команда реагирования решила заблокировать внутренние инструменты развертывания для предотвращения дальнейших изменений.
- **23:19 UTC:** Было принято решение о временной приостановке выполнения некоторых задач для сохранения целостности данных.
- **00:05 UTC:** Началась разработка плана восстановления и синхронизации данных.
- **06:51 UTC:** Началось восстановление баз данных из бэкапов.
- **11:12 UTC:** Большинство основных баз данных были восстановлены, и началась нормализация работы сервисов.
- **16:24 UTC:** Произведен возврат к исходной топологии баз данных.
- **23:03 UTC:** Все накопленные задания были обработаны, состояние системы возвращено в норму.

## Причины инцидента

- **Техническая ошибка во время замены оборудования,** что привело к потере связи между центрами данных.
- **Недостатки в конфигурации Orchestrator,** что привело к автоматическому переключению записи данных на серверы, расположенные на западном побережье.

## Решения и улучшения

- **Изменение конфигурации Orchestrator** для предотвращения переключения мастер-серверов через региональные границы.
- **Ускорение миграции к новой системе отчетности о состоянии сервисов.**
- **Инициатива по поддержке трафика GitHub из нескольких центров данных** в дизайне active/active/active для обеспечения избыточности на уровне центра данных.
- **Проведение тестирования предположений** и использование методик хаос-инжиниринга для проверки устойчивости системы к сбоям.

## Заключение

GitHub признает критическое значение надежности и доступности своих сервисов для пользователей и продолжит анализировать данный инцидент, чтобы извлечь уроки и улучшить качество обслуживания и безопасность данных.
