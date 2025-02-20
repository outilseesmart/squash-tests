*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}          https://networkmonitoringpreprod.sicame.io/Identity/Account/Login
${BROWSER}      Chrome
${USERNAME}     vsaravanan@sicamegroup.com
${PASSWORD}     Sicametest@123

*** Test Cases ***
Verify Successful Login
    Open Browser    ${URL}    ${BROWSER}
    Input Text    id=Input_Email   ${USERNAME}
    Input Text    id=Input_Password    ${PASSWORD}
    Click Button    id=login-submit
    Wait Until Element Is Visible    id=dashboard    10
    Capture Page Screenshot
    Close Browser
