FROM n8nio/n8n

USER root

# Копируем package.json в рабочую директорию
COPY package.json /usr/local/lib/n8n/

# Переходим в неё и ставим зависимости глобально
WORKDIR /usr/local/lib/n8n
RUN npm install --omit=dev

USER node
