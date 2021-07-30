*** Settings ***

Library             SeleniumLibrary
Resource            Keywords_AdminLogin.robot
Test Setup          Begin Web Test
Test Teardown       End Web Test

*** Test Cases ***

Add Update & Delete Contracts
    Go To Dashboard && Add All Top Contracts
    Sign PoA


