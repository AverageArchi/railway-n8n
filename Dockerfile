FROM n8nio/n8n:latest

USER root

RUN mkdir -p /data/custom && \
    chown -R node:node /data

USER node

WORKDIR /data/custom

RUN npm init -y && \
    npm install pdf-lib

WORKDIR /data

ENV N8N_CUSTOM_EXTENSIONS="/data/custom"
ENV N8N_EXTERNAL_MODULES="/data/custom/node_modules"
ENV NODE_PATH="/data/custom/node_modules"

CMD ["n8n"]
