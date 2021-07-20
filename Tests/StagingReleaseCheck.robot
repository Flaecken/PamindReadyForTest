*** Settings ***
Documentation       Test-suite for complete run of https://pamind.atlassian.net/wiki/spaces/PA/pages/825425921/Release+check+list
### NOTE - BankID-check will still need manual checking since our test-ID's are used as a bypass feature ###
Library             SeleniumLibrary
Resource            Pamind_Keywords.robot
Test Setup          Begin Web Test
Test Teardown       End Web Test

*** Test Cases ***
Access Web Page
    [Tags]                      AWP
    [Documentation]             - Accessing Web Page...

Create Account
    [Tags]                      CA
    [Documentation]             - Creating Account...

Answer Feedback Ticket
    [Tags]                      AFT
    [Documentation]             - Answering Feedback Ticket...

Confirm Correct Account Details
    [Tags]                      CCAD
    [Documentation]             - Confirming Correct Account...


