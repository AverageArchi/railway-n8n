FROM n8nio/n8n

USER root

# Копируем package.json
COPY package.json /usr/local/lib/n8n-custom/

# Устанавливаем зависимости
RUN cd /usr/local/lib/n8n-custom && npm install

# Указываем путь до node_modules
ENV NODE_PATH="/usr/local/lib/n8n-custom/node_modules"
ENV NODE_OPTIONS="--require module-alias/register"

USER node
