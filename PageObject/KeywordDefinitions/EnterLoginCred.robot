*** Settings ***
Documentation     Abbott Coding Challenge
Library           SeleniumLibrary
Variables    ../Locators/Locators.py
Variables    ../TestData/Testdata.py

*** Keywords ***
Input Email and Password
    Wait Until Page Contains Element    ${EmailField}
    Input Text    ${EmailField}    ${user}
    Input Password    ${PasswordField}    ${libre_password}
    Click Element    ${SubmitLogin}
    Wait Until Page Contains Element    ${Send2FA}
    Click Element    ${Send2FA}