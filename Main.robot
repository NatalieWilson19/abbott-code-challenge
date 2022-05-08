*** Settings ***
Documentation  Abbott Coding Challenge
Library  SeleniumLibrary
Library    ./PageObject/Locators/Locators.py
Library    ./PageObject/TestData/Testdata.py
Resource  ./PageObject/KeywordDefinitions/SelectCountyLang.robot
Resource  ./PageObject/KeywordDefinitions/EnterLoginCred.robot
Resource  ./PageObject/KeywordDefinitions/2FactorAuth.robot
Resource  ./PageObject/KeywordDefinitions/ManageData.robot


*** Variables ***
${browser}    chrome
${url}    https://www.libreview.com/
${country}    United States
${language}    English
${user}    codechallengeadc@outlook.com
${libre_password}    P@ssword$12
${outlook_password}    P@ssword$1234

*** Test Cases ***
Login to LibreView and Verify Button
    [Documentation]    Logins into LibreView, Fetchs a 2fa code from email, and verifies the webpage contains the “Press to Begin Upload” Button
    Open LibreView    ${url}    ${browser}
    Select County and Language    ${country}    ${language}
    Submit Page
    Input Email and Password
    Run Python Script and Input 2fa
    Go To Upload Device and Verify Button
    Close Browser