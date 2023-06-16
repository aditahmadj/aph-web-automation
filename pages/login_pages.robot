*** Settings ***
Library       SeleniumLibrary
Library       SeleniumLibrary
Library       RequestsLibrary

*** Variables ***
${USERNAME_FIELD}             //input[@id="username"]
${PASSWORD_FIELD}             //input[@id='password']
${LOGIN_BUTTON}               //*[@class="ant-btn css-htwhyh ant-btn-primary ant-btn-block"]
${EMPTY_MESSAGE}              Username is needed
${ERROR_MESSAGE}              Unauthorized, incorrect username or password
${SHOWPASSWORD_BUTTON}        //*[@class="ant-input-suffix"]
${USER_TYPE}                  //*[@class="ant-select-selection-item"]
${USER_LDAP}                  //*[@title="LDAP"]
${USER_LOCAL}                 //*[@title="Local"]

*** Keywords ***
Click User Type
  Wait Until Element Is Visible     ${USER_TYPE}
  Element Should Be Visible         ${USER_TYPE}
  Sleep    2s
  Click Element    ${USER_TYPE}
  Sleep    1s

Select User LDAP
  Wait Until Element Is Enabled     ${USER_LDAP}
  Click Element                     ${USER_LDAP}

Select User Local
  Wait Until Element Is Enabled     ${USER_LOCAL}
  Click Element                     ${USER_LOCAL}


Login Page Opened
  Wait Until Element Is Visible     ${USERNAME_FIELD}
  Element Should Be Visible         ${USERNAME_FIELD}
  Wait Until Element Is Visible     ${PASSWORD_FIELD}
  Element Should Be Visible         ${PASSWORD_FIELD}

Input Username
  [Arguments]                       ${username}
  Wait Until Element Is Enabled     ${USERNAME_FIELD}
  Input Text                        ${USERNAME_FIELD}       ${username}

Login Button Should Be Enabled
  Wait Until Element Is Enabled     ${LOGIN_BUTTON}
  Element Should Be Enabled         ${LOGIN_BUTTON}

Input Pass
  [Arguments]                       ${password}
  Wait Until Element Is Enabled     ${PASSWORD_FIELD}
  Input Text                        ${PASSWORD_FIELD}       ${password}

Show Password Button Should Be Visible
  Wait Until Element Is Visible     ${SHOWPASSWORD_BUTTON}
  Element Should Be Visible         ${SHOWPASSWORD_BUTTON}
  #Click Button                      ${SHOWPASSWORD_BUTTON}

Click Login Button
  Wait Until Element Is Enabled     ${LOGIN_BUTTON}
  Click Element                     ${LOGIN_BUTTON}

Error Message Displayed
  Sleep    3s
  Page Should Contain    ${ERROR_MESSAGE}
  Capture Page Screenshot
  #Wait Until Element Is Visible     ${ERROR_MESSAGE}
  #Element Should Be Visible         ${ERROR_MESSAGE}

Error Empty Message Displayed
  Sleep    3s
  Page Should Contain    ${EMPTY_MESSAGE}
  Capture Page Screenshot
