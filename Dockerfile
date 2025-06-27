FROM n8nio/n8n

USER root

# Копируем package.json
COPY package.json /usr/local/lib/n8n-custom/

# Устанавливаем зависимости в эту папку
RUN cd /usr/local/lib/n8n-custom && npm install

# Говорим Node.js искать модули в этой папке
ENV NODE_PATH=/usr/local/lib/n8n-custom/node_modules

USER node
