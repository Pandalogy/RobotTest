*** Settings ***
Library    SeleniumLibrary
Suite Setup    Log    Test Suite setup in progress
Suite Teardown    Log    Test Suite teardown in progress
Test Setup    Log    Test setup in progress
Test Teardown    Log    Test teardown in progress
Default Tags    sanity


*** Variables ***
${URL}    https://opensource-demo.orangehrmlive.com
@{CREDENTIALS}    Admin    admin123
&{LOGINDATA}    username=Admin    password=admin123
${LogoutButton}    xpath://*[@id="app"]/div[1]/div[1]/header/div[1]/div[2]/ul/li/ul/li[4]/a
${ProfileDropDown}    xpath://*[@id="app"]/div[1]/div[1]/header/div[1]/div[2]/ul/li/span/img
${LoginButton}    xpath://*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/form/div[3]/button

*** Keywords ***
LoginKW
    Input Text    name=username     ${CREDENTIALS}[0]
    Sleep    1
    Input Text    name=password     ${LOGINDATA}[password]
    Sleep    1
    #Input Keys   name=password     ENTERS
    Click Button    ${LoginButton}

*** Test Cases ***
TestCase1
    [Tags]    smoke
    Log    Hello World...

TestCase2
    Log    2nd testcase
    Set Tags    regression
    Log    2nd testcase regression
    Remove Tags    regression

TestCase3
    Log    3rd testcase

FirstSeleniumTest
    #Create Webdriver    chrome    excutable path=C:\Users\noah.chen\OneDrive\WebDriver\chromedriver-win32\chromedriver-win32\chromedriver.exe
    Open Browser    https://google.com    chrome
    Set Browser Implicit Wait    5
    Input Text    name=q     Automation Framework
    Sleep    1
    Press Keys    name=q    ENTER
    Sleep    1
    #Click Button    name=btnK
    Sleep    4
    Close Browser
    Log    Test Done...
    Log    Test Done What not...

SampleLoginTest
    [Documentation]    This is a sample login test
    Open Browser    ${URL}    chrome
    Set Browser Implicit Wait    5
    LoginKW
    Sleep    1    
    Click Element    ${ProfileDropDown}
    Sleep    1
    Click Element    ${LogoutButton}
    Sleep    4
    Close Browser
    Log    Test Done..
    Log    Test was executed by %{username} on %{os}