FROM n8nio/n8n

USER root

# Рабочая директория — внутрь самого пакета n8n
WORKDIR /usr/local/lib/node_modules/n8n

# Копируем package.json со списком кастомных зависимостей
COPY package.json ./

# Устанавливаем их прямо внутрь n8n
RUN npm install --omit=dev

# Включаем поддержку внешних модулей
ENV N8N_ENABLE_EXTERNAL_MODULES=true

USER node
