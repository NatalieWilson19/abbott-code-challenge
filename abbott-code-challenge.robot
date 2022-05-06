*** Settings ***
Documentation     Testing the Selenium Library
Library           SeleniumLibrary

*** Variables ***
${browser}    chrome
${url}    https://www.libreview.com/

*** Test Cases ***

Open Browser Test Case
    Open Browser    ${url}    ${browser}
    # Robots framework automatically closes browser when code is finished executing,
    # so I added a temp sleep so it stays open
    # Basically just need to find the name of the CSS element from inspect element
    Wait Until Page Contains Element    css=.trustarc-primary-btn
    Click Element    css=.trustarc-primary-btn

