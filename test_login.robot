*** Settings ***
Library    SeleniumLibrary

*** Variables ***
\${URL}          https://networkmonitoringpreprod.sicame.io/Identity/Account/Login
\${BROWSER}      Chrome
\${USERNAME}     vsaravanan@sicamegroup.com
\${PASSWORD}     Sicametest@123

*** Test Cases ***
Verify Successful Login
    Open Browser    \${URL}    Chrome    options=add_argument("--headless=new")
    Input Text    id=Input_Email   \${USERNAME}
    Input Text    id=Input_Password    \${PASSWORD}
    Click Button    id=login-submit
    Title Should Be    PoC Madagascar - Sicame network monitoring
    Close Browser
