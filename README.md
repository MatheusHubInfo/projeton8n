# Robot Framework + Browser (Playwright)

Este projeto contém um teste básico para validar a página de login do Shopify demo em modo headless.

## Arquivos
- tests/login_check.robot

## Como executar
```bash
cd '/home/matheusalves/Área de Trabalho/projeto_n8n'
source ~/.nvm/nvm.sh
nvm use 20.19.5
mkdir -p results
python3 -m robot --outputdir results tests/login_check.robot
```

## Como abrir o relatório
```bash
xdg-open results/report.html
```

## Dependências necessárias
```bash
python3 -m pip install robotframework robotframework-browser
python3 -m pip show robotframework robotframework-browser
rfbrowser init
```
