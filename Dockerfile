# Usamos a imagem oficial do n8n como base
FROM n8nio/n8n:latest

# Alternamos para o usuário root para instalar as dependências do sistema
USER root

# Atualizamos os pacotes e instalamos Python, pip, Chromium e dependências visuais
RUN apk add --no-cache --update \
    python3 \
    py3-pip \
    chromium \
    nss \
    freetype \
    harfbuzz \
    ca-certificates \
    ttf-freefont

# Criamos um ambiente virtual do Python (evita travas de segurança do Linux)
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Instalamos o Robot Framework e a biblioteca Browser
RUN pip install --no-cache-dir robotframework robotframework-browser

# Inicializamos os binários do Playwright/Browser do Robot Framework
RUN rfbrowser init

# Liberamos as permissões no n8n para rodar comandos de terminal (child_process)
ENV NODE_FUNCTION_ALLOW_BUILTIN=*
ENV NODE_FUNCTION_ALLOW_EXTERNAL=*
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=false

# Retornamos para o usuário padrão do n8n por segurança
USER node
