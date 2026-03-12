FROM node:20.20.1-alpine

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем файлы зависимостей
COPY package*.json ./
COPY tsconfig.json ./
# COPY node_modules ./node_modules

RUN npm install

# Копируем исходный код
COPY src/ ./src/
COPY .env ./

# Собираем проект
RUN npm run build

# Указываем порт
EXPOSE 3000

# Запускаем сервер с отключенной проверкой SSL (для самоподписанного сертификата)
ENV NODE_TLS_REJECT_UNAUTHORIZED=0

# Запуск
CMD ["node", "build/index.js"]