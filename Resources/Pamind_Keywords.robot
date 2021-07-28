*** Settings ***
Library             SeleniumLibrary

*** Variables ***

${BROWSER}          chrome
${URL}              https://admin-staging.pamind.se
${URL_PROFILE}      https://app-staging.pamind.se/dashboard/profil
${PERSON_NR}        ${KEYx}
${KEY1}             19881116-2778 #Account without data
${KEY2}             19980423-0101 #Account with data
${KEY3}             19860608-1241 #No account
${KEY4}             19700529-2318 #BankID alredy in progress
${EMAIL}            ${MAILx}
${MAIL1}            john.linder@arasaka.org
${MAIL2}            glados@aperture.org
${MAIL3}            samus@nintendo.com
${MAIL4}            jarvis@starksupport.com
${PHONE}            ${PHONEx}
${PHONE1}           0709219982
${PHONE2}           0701001011
${PHONE3}           0701001101
${PHONE4}           0709704133
${NAME}             ${NAMEx}
${NAME1}            Johnny Silverhand
${NAME2}            GLaD OS
${NAME3}            Samus Aran
${NAME4}            Tony Stark


*** Keywords ***
Begin Web Test
    Open browser        about:blank     ${BROWSER}
    Go to               ${URL}

Access Web Page
    wait until page contains    Logga in / Skapa konto
    ${TITLE}                    Get Title
    Should Be Equal             ${TITLE}    Påmind

BankID Login
    click element               xpath://html/body/div[1]/div[2]/div[2]/div[2]/div/div[2]/div[2]/div/form/div[1]/div/div/input
    input text                  xpath://*[@id="personalNumberInput"]   ${PERSON_NR}
    click element               xpath://html/body/div[1]/div[2]/div[2]/div[2]/div/div[2]/div[2]/div/form/div[2]/button

Create Account
    wait until page contains    Hur når vi dig?
    click element               xapth://html/body/div[1]/div[2]/div[2]/div[2]/div/div[2]/div[2]/form/div[2]/div/div/div/input
    input text                  xpath:///*[@id="emailInput"]    ${EMAIL}
    click element               xpath://html/body/div[1]/div[2]/div[2]/div[2]/div/div[2]/div[2]/form/div[3]/div/div/div/input
    input text                  xpath:///*[@id="mobileNumberInput"]     ${PHONE}
    click element               xpath://html/body/div[1]/div[2]/div[2]/div[2]/div/div[2]/div[2]/form/div[4]/label/span[1]/span[1]/input
    click button                xpath:///*[@id="root"]/div[2]/div[2]/div[2]/div/div[2]/div[2]/form/button

Answer Feedback Ticket
    wait until page contains    Vad är viktigast för dig?
    click element               xpath://html/body/div[3]/div[3]/div/div/div[2]/div/div/div[2]/div[3]/div/span[2]
    page should not contain     xpath://html/body/div[3]/div[3]/div/div/div[2]/div/div/div[2]/div[7]/div/div/div/input
    click button                xpath://html/body/div[3]/div[3]/div/div/div[2]/div/div/button[2]/span[1]

Confirm Account Details
    go to url                   ${URL_PROFILE}
    wait until page contains    Profil
    ${NAME_ACTUAL}              get text    xpath://html/body/div[1]/div[2]/div/div[2]/div[2]/div/div[2]/div/div[2]/div[2]/div/div[2]
    should be equal             ${NAME_ACTUAL}      ${NAME}
    ${EMAIL_ACTUAL}             get text    xpath://html/body/div[1]/div[2]/div/div[2]/div[2]/div/div[2]/div/div[3]/div[2]/div/div[2]
    should be equal             ${EMAIL_ACTUAL}     ${EMAIL}
    ${PHONE_ACTUAL}             get text    xpath://html/body/div[1]/div[2]/div/div[2]/div[2]/div/div[2]/div/div[4]/div[2]/div/div[2]
    should be equal             ${PHONE_ACTUAL}     ${PHONE}

Skip
    page should contain         Hoppa över
    click element               xpath://html/body/div[3]/div[3]/div/header/div/div[2]/button/span[1]

Add All Top Contracts
    page should contain         Välkommen till Påmind
    click button                xpath:///*[@id="E2E_GetStarted"]
    page should contain         Mobil
    click element               xpath://html/body/div[3]/div[3]/div/div/div[2]/div/div[1]/div[2]/div/div[1]/div/div[2]/div[1]/div/div[2]/div[2]/span/span[1]/input
    click element               xpath://html/body/div[3]/div[3]/div/div/div[2]/div/div[1]/div[3]/div/div[2]/button

End Web Test
    Close browser
