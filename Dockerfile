# Используем стабильную версию n8n до внедрения task-runner
FROM n8nio/n8n:1.72.0

# Работаем от имени root для установки зависимостей
USER root

# Создаём директорию для пользовательских зависимостей
RUN mkdir -p /data/custom && \
    chown -R node:node /data

# Переходим под пользователя node
USER node

# Переходим в кастомную директорию и устанавливаем pdf-lib
WORKDIR /data/custom

RUN npm init -y && \
    npm install pdf-lib

# Возвращаемся к рабочей директории n8n
WORKDIR /data

# Указываем путь к модулям, чтобы Run Node их видела
ENV NODE_PATH="/data/custom/node_modules"

# Запускаем n8n
CMD ["n8n"]
