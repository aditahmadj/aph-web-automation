*** Settings ***
Documentation    Tests to verify that account withdrawals succeed and
...              fail correctly depending from users account balance
...              and account type dependent rules.
...              See http://internal.example.com/docs/abs.pdf
Metadata         Version    0.1
Library         SeleniumLibrary
Test Setup       Open Login Page Using Chrome Browser
Test Teardown    Close Browser

*** Settings ***
#Library    Browser
#Suite Setup    New Browser    browser=${BROWSER}    headless=${HEADLESS}
#Test Setup    New Context
#Test Teardown    Close Context
#Suite Teardown    Close Browser

*** Keywords ***
Open Login Page Using Chrome Browser
    Open Browser    ${login_page}   chrome
    Maximize Browser Window

*** Variables ***
${BROWSER}    chromium
${HEADLESS}    False
${login_page}   http://192.168.10.169/login
&{admin_user}   username=laura.puspita  password=puspita@2018

*** Test Cases ***
Login as Admin
    Given Open Login Page Using Chrome Browser
    When I login as admin
    Then I should see the Dashboard page

#Login With Invalid User
 #   Given I am on the login page
 #   When I login with username "123" and password "puspita@2018"
#    Then I should see the error message
 #   And I should be able to login again
#Login With Valid Credentials
#Login With Empty Password Should Fail
#Login With Empty Username Should Fail
#Login With Empty Username And Password Should Fail
#Login With Invalid Username Should Fail
#Login With Invalid Password Should Fail
#Login With Invalid Username And Invalid Password Should Fail