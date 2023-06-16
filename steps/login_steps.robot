*** Settings ***
Resource          ../pages/login_pages.robot

*** Keywords ***
Input Username And Password
  Click User Type
  Select User LDAP
  [Arguments]   ${username}   ${password}
  Input Username                              ${username}
  Input Pass                                  ${password}
  Show Password Button Should Be Visible
  Capture Page Screenshot
  Login Button Should Be Enabled
  Click Login Button


