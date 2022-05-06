*** Settings ***
Documentation     Testing the Selenium Library
Library           SeleniumLibrary

*** Variables ***
${browser}    chrome
${url}    https://www.libreview.com/
${country}    United States
${language}    English
*** Test Cases ***
Open Browser Test Case
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    # Basically just need to find the name of the CSS element from inspect element
    Wait Until Page Contains Element    id:truste-consent-button
    Click Element    id:truste-consent-button
    Wait Until Page Contains Element   id:country-select
    Select From List By Label    id:country-select    ${country}

    Wait Until Page Contains Element   id:language-select
    Select From List By Label    id:language-select    ${language}
    Click Button    id:submit-button
    Sleep    5s