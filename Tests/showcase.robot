*** Settings ***

Documentation       Test-suite information goes here
Library             SeleniumLibrary
Resource            Pamind_Keywords.robot
Test Setup          Begin Web Test
Test Teardown       End Web Test

*** Test Cases ***

Test 01
    [Documentation]             Access web page
    [Tags]                      Test_01
    set selenium speed          0.4
    go to                       ${URL}
    wait until page contains    Logga in / Skapa konto
    click element               xpath://html/body/div[1]/div[2]/div[2]/div[2]/div/div[2]/div[2]/div/form/div[1]/div/div/input
    input text                  xpath://*[@id="personalNumberInput"]   ${PERSON_NR}
    click element               xpath://html/body/div[1]/div[2]/div[2]/div[2]/div/div[2]/div[2]/div/form/div[2]/button
    wait until page contains    Loggar in...




