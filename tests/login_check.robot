*** Settings ***
Library    Browser
Suite Setup    Open Headless Browser
Suite Teardown    Close Browser

*** Variables ***
${URL}    https://sauce-demo.myshopify.com/account/login
${LOGIN_TEXT}    Log in

*** Test Cases ***
Validar Página De Login Está Visível
    [Documentation]    Acessa a página de login e valida se o botão de login está visível.
    Go To    ${URL}
    Wait For Elements State    text=${LOGIN_TEXT}    visible    timeout=30s

*** Keywords ***
Open Headless Browser
    New Browser    chromium    headless=True
    New Context
    New Page    ${URL}
    Wait For Load State    load    timeout=30s
