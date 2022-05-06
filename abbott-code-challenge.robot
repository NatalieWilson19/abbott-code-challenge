*** Settings ***
Documentation     Testing the Selenium Library
Library           SeleniumLibrary


*** Test Cases ***

Selenium Test Case
    Open Browser    https://www.libreview.com/    chrome
    # Robots framework automatically closes browser when code is finished executing,
    # so I added a temp sleep so it stays open
    Sleep    10s 