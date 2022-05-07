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
${outlookURL}    https://login.live.com/login.srf?wa=wsignin1.0&rpsnv=13&ct=1651883057&rver=7.0.6737.0&wp=MBI_SSL&wreply=https%3a%2f%2foutlook.live.com%2fowa%2f%3fnlp%3d1%26RpsCsrfState%3deedc2709-b1e2-d876-2112-6fcbdf7ce74c&id=292841&aadredir=1&CBCXT=out&lw=1&fl=dob%2cflname%2cwld&cobrandid=90015
${outlook_user}    codechallengeadc@outlook.com
${outlook_password}    P@ssword$1234

*** Test Cases ***
Open LibreView and Select County and Language
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    # Basically just need to find the name of the CSS element from inspect element
    Wait Until Page Contains Element    id:truste-consent-button    timeout=100
    Click Element    id:truste-consent-button
    Wait Until Page Contains Element   id:country-select
    Select From List By Label    id:country-select    ${country}
    Wait Until Page Contains Element   id:language-select
    Select From List By Label    id:language-select    ${language}
    Wait Until Page Contains Element    id:submit-button
    Click Button    id:submit-button
    Wait Until Page Contains Element    id:loginForm-email-input
    Input Text    id:loginForm-email-input    codechallengeadc@outlook.com
    Input Password    id:loginForm-password-input    P@ssword$12
    Click Element    id:loginForm-submit-button
    Wait Until Page Contains Element    id:twoFactor-step1-next-button
    Click Element    id:twoFactor-step1-next-button
    Sleep    10s


# Need to consicelty say WHY robot framework won't work for this part
Run Python Script

    ${2fa}=    Get Access Code    ${outlook_user}    ${outlook_password}

    Log To Console    ${2fa}