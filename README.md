# WikiJS MCP Server

A Model Context Protocol (MCP) Сервер, обеспечивающий интеграцию с Wiki.js, позволяющий AI-помощникам искать и извлекать контент из базы знаний wiki.js.

## Обзор

Этот MCP-сервер позволяет AI-помощникам взаимодействовать с Wiki.js, предоставляя инструменты для:
- Поиска страниц по строке запроса
- Извлечения страниц по ID
- Извлечения страниц по пути и локали
- Получения всех страниц из вики

## Получение API ключа для подключения к Wiki.js

1. Войти в Админ-панель Wiki.js
2. Перейти в раздел группы и создать группу "Wiki Reader" с правами:
Общие: read:pages, write:pages, manage:pages, read:source, read:history, read:assets, read:comments
Page Rules: / read:pages, manage:pages, read:source, read:history, read:assets, read:comments
3. Перейти в раздел "Доступ к API"
4. Создать новый API ключ с групповыми разрешениями для "Wiki Reader"
5. Добавить ключ в .env


## Запуск контейнера MCP-сервера

1. Склонировать репозиторий:
```bash
git clone https://github.com/UserMSU/wikijs-mcp.git
cd wikijs-mcp
```

2. Скопируйте .env файл и заполнить.
```bash
cp env.example .env
```

3. Запустить MCP-сервер
```bash
docker compose up -d
```

## Переменные окружения
| Variable                               | Description                                              | Required | Allowed Values         |Default                    |
|----------------------------------------|----------------------------------------------------------|----------|------------------------|---------------------------|
| `WIKIJS_URL`                           | URL of your WikiJS instance                              | Yes      | -                      | -                         |
| `WIKIJS_API_KEY`                       | WikiJS API key                                           | Yes      | -                      | -                         |
| `TRANSPORT_METHOD`                     | The transport method                                     | No       | stdio, streamable-http | stdio                     |
| `TRANSPORT_OPTIONS_CORS_ORIGIN`        | Cors Origin (only on streamable-http)                    | No       | -                      | *                         |
| `TRANSPORT_OPTIONS_CORS_HEADERS`       | Cors Headers, comma separated (only on streamable-http)  | No       | -                      |Content-Type=mcp-session-id|
| `TRANSPORT_OPTIONS_CORS_METHODS`       | Cors Methods, comma separated (only on streamable-http)  | No       | -                      |GET,POST,OPTIONS           | 
| `TRANSPORT_OPTIONS_SESSION_TIMEOUT_MS` | Session timeout (only on streamable-http)                | No       | -                      |60000                      |
