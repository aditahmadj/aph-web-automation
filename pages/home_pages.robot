*** Settings ***
Library       SeleniumLibrary

*** Variables ***
${User_Login}          //*[@id="root"]/section/section/div/div
${Dashboard}            Log Audit

*** Keywords ***
Home Page Opened
  Wait Until Element Is Visible    ${User_Login}
  Element Should Be Visible        ${User_Login}
  Sleep    3s
  Capture Page Screenshot
  Page Should Contain               ${Dashboard}