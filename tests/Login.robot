*** Settings ***
Resource          ../resource.robot
Resource          ../pages/login_pages.robot
Resource          ../pages/home_pages.robot
Resource          ../steps/login_steps.robot
Test Setup        Open Login Page Using Chrome Browser
Test Teardown     Close Browser

*** Variables ***
${valid_ldap_username}       laura.puspita
${valid_ldap_password}       puspita@2018
${valid_local_password}      aditya.ahmad
${valid_local_password}       abcd1234
${invalid_username}     abcdefgh
${invalid_password}     12345678

*** Test Cases ***
Login With LDAP Valid Credentials
  GIVEN Login Page Opened
  WHEN Input Username And Password    ${valid_ldap_username}    ${valid_ldap_password}
  THEN Home Page Opened

#Login With Local Valid Credentials
  #GIVEN Login Page Opened
  #WHEN Input Username And Password    ${valid_local_username}    ${valid_local_password}
  #THEN Home Page Opened

Login With Empty Username And Password Should Fail
  GIVEN Login Page Opened
  WHEN Input Username And Password      ${EMPTY}    ${EMPTY}
  THEN Error Empty Message Displayed

Login With Invalid Password Should Fail
  GIVEN Login Page Opened
  WHEN Input Username And Password      ${valid_ldap_username}    ${invalid_password}
  THEN Error Message Displayed

Login With Invalid Username Should Fail
  GIVEN Login Page Opened
  WHEN Input Username And Password      ${invalid_username}    ${valid_ldap_password}
  THEN Error Message Displayed

Login With Invalid Username And Invalid Password Should Fail
  GIVEN Login Page Opened
  WHEN Input Username And Password      ${invalid_username}    ${invalid_password}
  THEN Error Message Displayed


*** Keywords ***
Login with Empty Credentials
  [Arguments]   ${username}   ${password}
  GIVEN Login Page Opened
  WHEN Input Username And Password    ${username}    ${password}
  THEN Error Empty Message Displayed

Login with Invalid Username Or Password
  [Arguments]   ${username}   ${password}
  GIVEN Login Page Opened
  WHEN Input Username And Password    ${username}    ${password}
  THEN Error Message Displayed

