*** Settings ***
Documentation     Abbott Coding Challenge
Library           SeleniumLibrary
Variables    ../Locators/Locators.py
Variables    ../TestData/Testdata.py

*** Keywords ***
Open LibreView
    [Arguments]    ${url}    ${browser}
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
Select County and Language
    [Arguments]    ${country}    ${language}
    Wait Until Page Contains Element    ${ConsetToCookiesButton}    timeout=100
    Click Element    ${ConsetToCookiesButton}
    Wait Until Page Contains Element   ${SelectCounty}
    Select From List By Label    ${SelectCounty}    ${country}
    Wait Until Page Contains Element   ${SelectLanguage}
    Select From List By Label    ${SelectLanguage}    ${language}

Submit Page
    Wait Until Page Contains Element    ${SubmitButton}
    Click Button    ${SubmitButton}