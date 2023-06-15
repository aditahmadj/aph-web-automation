*** Settings ***
Resource          ../resource.robot
Resource          ../pages/login_pages.robot
Resource          ../pages/home_pages.robot
Resource          ../steps/login_steps.robot
Test Setup        Open Login Page Using Chrome Browser
Test Teardown     Close Browser

*** Variables ***
${valid_username}       laura.puspita
${valid_password}       puspita@2018
${invalid_username}     abcdefgh
${invalid_password}     12345678

*** Test Cases ***
Valid Login
  GIVEN Login Page Opened
  WHEN Input Username And Password    ${valid_username}    ${valid_password}
  THEN Home Page Opened

Invalid Login
  [Template]    Login with Invalid Credentials
  ${valid_username}   ${invalid_password}
  ${invalid_username} ${valid_password}
  ${invalid_username} ${invalid_password}

Empty Credentials
  [Template]  Login with Empty Credentials
  # username   password
  ${EMPTY}      ${EMPTY}

*** Keywords ***
Login with Empty Credentials
  [Arguments]   ${username}   ${password}
  GIVEN Login Page Opened
  WHEN Input Username And Password    ${username}    ${password}
  THEN Error Empty Message Displayed


Login with Invalid Credentials
  [Arguments]   ${username}   ${password}
  GIVEN Login Page Opened
  WHEN Input Username And Password    ${username}    ${password}
  THEN Error Message Displayed
