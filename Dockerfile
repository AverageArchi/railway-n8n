FROM n8nio/n8n

USER root

# Устанавливаем дополнительные библиотеки
COPY package.json ./
RUN npm install

USER node
