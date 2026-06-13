# Imagem oficial e atualizada do n8n
FROM n8nio/n8n:latest

# Ativa as permissões para o caso de você precisar usar nós de código mais para frente
ENV NODE_FUNCTION_ALLOW_BUILTIN=*
ENV NODE_FUNCTION_ALLOW_EXTERNAL=*
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=false

# Porta padrão do n8n
EXPOSE 5678
