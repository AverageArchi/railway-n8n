# Базовый образ n8n
FROM n8nio/n8n:latest

# Устанавливаем необходимые зависимости, включая pdf-lib
USER root

# Создаем директорию для кастомных модулей
RUN mkdir -p /data/custom && \
    chown -R node:node /data

USER node

# Переходим в рабочую директорию, где будут установлены модули
WORKDIR /data/custom

# Инициализируем package.json и устанавливаем pdf-lib
RUN npm init -y && \
    npm install pdf-lib

# Назад к рабочей директории n8n
WORKDIR /data

# Устанавливаем NODE_PATH, чтобы нода Run Node могла видеть pdf-lib
ENV NODE_PATH="/data/custom/node_modules"

# Запуск n8n (это значение Railway использует по умолчанию)
CMD ["n8n"]
