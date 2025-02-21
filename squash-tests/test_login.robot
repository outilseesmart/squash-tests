*** Settings ***
Library    SeleniumLibrary

*** Variables ***
*** %{https://networkmonitoringpreprod.sicame.io/Identity/Account/Login}***
*** Chrome ***
*** vsaravanan@sicamegroup.com ***
*** Sicametest@123 ***

${URL}          %{URL}                               
${BROWSER}      %{BROWSER}                          
${USERNAME}     %{USERNAME}                          
${PASSWORD}     %{PASSWORD}                          

*** Test Cases ***
Verify Successful Login
    Open Browser    ${URL}    ${BROWSER}
    Input Text    id=Input_Email   ${USERNAME}
    Input Text    id=Input_Password    ${PASSWORD}
    Click Button    id=login-submit
    Wait Until Element Is Visible    id=dashboard    10
    Capture Page Screenshot
    Close Browser
