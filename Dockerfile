FROM n8nio/n8n

USER root

# Копируем package.json
COPY package.json /usr/local/lib/n8n/

# Устанавливаем зависимости
WORKDIR /usr/local/lib/n8n
RUN npm install --omit=dev

# Указываем путь к внешним модулям
ENV N8N_CUSTOM_EXTENSIONS="/usr/local/lib/n8n"

# Включаем загрузку внешних модулей
ENV N8N_ENABLE_EXTERNAL_MODULES=true

USER node
