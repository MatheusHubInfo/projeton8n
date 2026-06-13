# Usamos uma imagem estável do Python baseada em Ubuntu/Debian
FROM python:3.10-slim

# Instala o Node.js (necessário para o n8n) e dependências de sistema para o Chromium
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    gnupg \
    ca-certificates \
    chromium \
    libnss3 \
    libfreetype6 \
    libharfbuzz0b \
    fonts-freefont-ttf \
    && curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*

# Instala o n8n globalmente via npm
RUN npm install -g n8n@latest --omit=dev

# Instala o Robot Framework e a biblioteca Browser
RUN pip install --no-cache-dir robotframework robotframework-browser

# Inicializa os binários do Playwright/Browser do Robot Framework
RUN rfbrowser init

# Configura as variáveis de ambiente necessárias para o n8n funcionar sem travas
ENV NODE_FUNCTION_ALLOW_BUILTIN=*
ENV NODE_FUNCTION_ALLOW_EXTERNAL=*
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=false

# Expõe a porta padrão que o n8n usa
EXPOSE 5678

# Comando para iniciar o n8n assim que o container ligar no Render
CMD ["n8n", "start"]
