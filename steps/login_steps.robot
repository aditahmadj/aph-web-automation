*** Settings ***
Resource          ../pages/login_pages.robot

*** Keywords ***
Input Username And Password LDAP
  Click User Type
  Select User LDAP
  [Arguments]   ${username}   ${password}
  Input Username                              ${username}
  Input Pass                                  ${password}
  Show Password Button Should Be Visible
  Capture Page Screenshot
  Login Button Should Be Enabled
  Click Login Button

Input Username And Password LOCAL
  Click User Type
  Select User Local
  [Arguments]   ${username}   ${password}
  Input Username                              ${username}
  Input Pass                                  ${password}
  Show Password Button Should Be Visible
  Capture Page Screenshot
  Login Button Should Be Enabled
  Click Login Button


