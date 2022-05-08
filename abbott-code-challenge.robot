*** Settings ***
Documentation     Abbott Coding Challenge
Library           SeleniumLibrary
Library    fetch2fa
Library    Process

*** Variables ***
${browser}    chrome
${url}    https://www.libreview.com/
${country}    United States
${language}    English
${user}    codechallengeadc@outlook.com
${libre_password}    P@ssword$12
${outlook_password}    P@ssword$1234

*** Test Cases ***
Open LibreView and Select County and Language
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Wait Until Page Contains Element    id:truste-consent-button    timeout=100
    Click Element    id:truste-consent-button
    Wait Until Page Contains Element   id:country-select
    Select From List By Label    id:country-select    ${country}
    Wait Until Page Contains Element   id:language-select
    Select From List By Label    id:language-select    ${language}
    Wait Until Page Contains Element    id:submit-button
    Click Button    id:submit-button
Input Email and Password
    Wait Until Page Contains Element    id:loginForm-email-input
    Input Text    id:loginForm-email-input    ${user}
    Input Password    id:loginForm-password-input    ${libre_password}
    Click Element    id:loginForm-submit-button
    Wait Until Page Contains Element    id:twoFactor-step1-next-button
    Click Element    id:twoFactor-step1-next-button

Run Python Script and Input 2fa
    # Need to Sleep for a few seconds because it takes a few seconds for the email to appear
    # Otherwise, we get the second most recent access code
    Sleep    15s
    ${2fa}=    Get Access Code    ${user}    ${outlook_password}
    Log To Console    ${2fa}
    Input Password    id:twoFactor-step2-code-input    ${2fa}
    Sleep    5s
    Click Element    id:twoFactor-step2-next-button

Go To Upload Device and Verify Button
    Wait Until Page Contains Element    id:main-header-meter-nav-link
    Click Element    id:main-header-meter-nav-link
    Element Should Be Visible    id:meterUpload-linkedUpload-pat-button
    Sleep    10s