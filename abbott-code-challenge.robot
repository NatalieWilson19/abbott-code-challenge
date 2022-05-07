*** Settings ***
Documentation     Abbott Coding Challenge
Library           SeleniumLibrary

*** Variables ***
${browser}    chrome
${url}    https://www.libreview.com/
${country}    United States
${language}    English
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
