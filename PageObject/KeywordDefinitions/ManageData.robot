*** Settings ***
Documentation     Abbott Coding Challenge
Library           SeleniumLibrary
Variables    ../Locators/Locators.py
Variables    ../TestData/Testdata.py
*** Keywords ***
Go To Upload Device and Verify Button
    Wait Until Page Contains Element    ${AddDevice}
    Click Element    ${AddDevice}
    Element Should Be Visible    ${PressToBeginUploadButton}