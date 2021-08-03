*** Settings ***

Library             SeleniumLibrary
Library             BuiltIn
Resource            ../Resources/Keywords_AdminLogin.robot
Test Setup          Begin Web Test
Test Teardown       End Web Test

*** Test Cases ***

Clean Start
    repeat keyword      7 times     Delete Contracts

Add Update & Delete Contracts
    Go To Dashboard && Add All Top Contracts
    Sign PoA




