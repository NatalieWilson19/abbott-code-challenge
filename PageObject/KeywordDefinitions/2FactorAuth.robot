*** Settings ***
Documentation     Abbott Coding Challenge
Library           SeleniumLibrary
Library    ../../fetch2fa.py
Library    Process
Variables    ../Locators/Locators.py
Variables    ../TestData/Testdata.py
*** Keywords ***
Run Python Script and Input 2fa
    # Need to Sleep for a few seconds because it takes a few seconds for the email to appear
    # Otherwise, we get the second most recent access code
    Sleep    10s
    ${2fa}=    Get Access Code    ${user}    ${outlook_password}
    Input Password    ${AuthCode}    ${2fa}
    Sleep    2s
    Click Element    ${NextButton}