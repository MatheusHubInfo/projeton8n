# Usamos a imagem oficial do n8n como base (atualmente baseada em Debian/Ubuntu)
FROM n8nio/n8n:latest

# Alternamos para o usuário root para instalar as dependências do sistema
USER root

# Atualizamos os pacotes e instalamos Python, pip, Chromium e dependências usando apt
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3 \
    python3-pip \
    python3-venv \
    chromium \
    libnss3 \
    libfreetype6 \
    libharfbuzz0b \
    ca-certificates \
    fonts-freefont-ttf \
    && rm -rf /var/lib/apt/lists/*

# Criamos um ambiente virtual do Python para o Robot Framework
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Instala o Robot Framework e a biblioteca Browser
RUN pip install --no-cache-dir robotframework robotframework-browser

# Inicializa os binários do Playwright/Browser
RUN rfbrowser init

# Libera as permissões no n8n para rodar comandos de terminal
ENV NODE_FUNCTION_ALLOW_BUILTIN=*
ENV NODE_FUNCTION_ALLOW_EXTERNAL=*
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=false

# Retornamos para o usuário padrão do n8n por segurança
USER node
