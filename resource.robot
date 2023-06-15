*** Settings ***
Library       SeleniumLibrary

*** Variables ***
${MAIN_PAGE}      http://192.168.10.169/log-audit
${LOGIN_PAGE}     http://192.168.10.169/login

*** Keywords ***
Open Main Page Using Chrome Browser
  Open Browser    ${MAIN_PAGE}    Chrome
  Maximize Browser Window

Open Login Page Using Chrome Browser
  Open Browser    ${LOGIN_PAGE}   Chrome    options=add_argument("--ignore-certificate-errors")
  Maximize Browser Window