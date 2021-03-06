*** Settings ***
Documentation       Temporary bypass of the BankID issue, can only be used with admin credentials for admin 2.
Library             SeleniumLibrary
Resource            ../Resources/Keywords_AdminLogin.robot
Test Setup          Begin Web Test
Test Teardown       End Web Test

*** Test Cases ***

#Clear
    #repeat keyword      7 times     Delete Contracts

Påmind Admin Login
    [Tags]              PAL
    [Documentation]     Logging into Påmind Admin 2.0...
    Go To Dashboard && Add One Contract
    Teardown

# Access Påmind App Through Admin 2
#    [Tags]              APA
#    [Documentation]     Logging in as a specified customer through admin 2...
#    Search And Access Specified User
#    Sign In And Confirm Account Details