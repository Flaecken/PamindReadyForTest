*** Settings ***
Library         SeleniumLibrary

*** Variables ***
${BROWSER}          chrome
${URL}              https://admin-staging.pamind.se
${URL_PROFILE}      https://app-staging.pamind.se/dashboard/profil
${CONTRACTS}        https://app-staging.pamind.se/dashboard/contracts
${USER}             jolin@pamind.se
${PASS}             jolin
${NAME}             Jolin Franzke
${EMAIL}            test@pamind.se
${PHONE}            0703867320

*** Keywords ***
Begin Web Test
    set selenium speed  0
    Open browser        about:blank     ${BROWSER}
    Go to               ${URL}

Access Web Page
    wait until page contains            Logga in
    ${TITLE}                            Get Title
    Should Be Equal                     ${TITLE}    Påmind Adminwebb 2.0

Login Using Admin Credentials
    click element                       xpath://*[@id="email"]
    input text                          xpath://*[@id="email"]      ${USER}
    click element                       xpath://*[@id="password"]
    input text                          xpath://*[@id="password"]   ${PASS}
    click element                       xpath://*[@id="root"]/div/div/div/form/div[3]/button
    wait until page contains            Sök

Search And Access Specified User
    wait until page contains element    xpath://html/body/div/div/div/div/main/div[3]/form/div/div/div/div/div
    input text                          xpath://html/body/div/div/div/div/main/div[3]/form/div/div/div/div/div/input      ${PHONE}
    click element                       xpath://html/body/div/div/div/div/main/div[3]/form/div/div/button
    wait until page contains            Kunder
    page should contain                 ${PHONE}
    click element                       xpath://html/body/div/div/div/div/main/div[3]/div[2]/div[2]/table/tbody/tr
    wait until page contains            ${NAME}

Sign In And Confirm Account Details
    wait until page contains element    xpath://html/body/div/div/div/div/main/div[3]/div[1]/div[3]/button[2]
    click element                       xpath://html/body/div/div/div/div/main/div[3]/div[1]/div[3]/button[2]
    wait until page contains            Påmind
    switch window
    go to                               ${URL_PROFILE}
    wait until page contains            Profil
    ${NAME_ACTUAL}                      get text    xpath://html/body/div[1]/div[2]/div/div[2]/div[2]/div/div[2]/div/div[2]/div[2]/div/div[2]
    should be equal                     ${NAME_ACTUAL}      ${NAME}
    ${EMAIL_ACTUAL}                     get text    xpath://html/body/div[1]/div[2]/div/div[2]/div[2]/div/div[2]/div/div[3]/div[2]/div/div[2]
    should be equal                     ${EMAIL_ACTUAL}     ${EMAIL}
    ${PHONE_ACTUAL}                     get text    xpath://html/body/div[1]/div[2]/div/div[2]/div[2]/div/div[2]/div/div[4]/div[2]/div/div[2]
    should be equal                     ${PHONE_ACTUAL}     ${PHONE}

Skip
    page should contain         Hoppa över
    click element               xpath://html/body/div[3]/div[3]/div/header/div/div[2]/button/span[1]

Go To Dashboard && Add One Contract
    click element                       xpath://html/body/div[1]/div[2]/div/header/div/div[2]/div/div[1]/a/div
    page should contain                 Välkommen till Påmind
    click button                        xpath://html/body/div[1]/div[2]/div/div[2]/div[2]/div/div[2]/div/button
    wait until page contains            Mobil
    click element                       xpath://html/body/div[3]/div[3]/div/div/div[2]/div/div[1]/div[2]/div/div[1]/div/div[2]/div[1]
    click button                        xpath://html/body/div[3]/div[3]/div/div/div[2]/div/div[1]/div[3]/div/div[2]/button
    Skip
    Skip
    Skip
    Skip
    Skip
    Skip
    wait until page contains            Wohoo!
    page should contain                 1 avtal
    click button                        xpath://html/body/div[4]/div[3]/div/div/div[2]/div/div/div[2]/button

Go To Dashboard && Add All Top Contracts
    click element                       xpath://html/body/div[1]/div[2]/div/header/div/div[2]/div/div[1]/a/div
    page should contain                 Välkommen till Påmind
    click button                        xpath://html/body/div[1]/div[2]/div/div[2]/div[2]/div/div[2]/div/button
    wait until page contains            Mobil
    click element                       xpath://html/body/div[3]/div[3]/div/div/div[2]/div/div[1]/div[2]/div/div[1]/div/div[2]/div[1]
    click button                        xpath://html/body/div[3]/div[3]/div/div/div[2]/div/div[1]/div[3]/div/div[2]/button
    wait until page contains            Elavtal
    click element                       xpath://html/body/div[3]/div[3]/div/div/div[2]/div/div[1]/div[2]/div/div[2]/div/div[2]/div[1]
    click button                        xpath://html/body/div[3]/div[3]/div/div/div[2]/div/div[1]/div[3]/div/div[2]/button
    wait until page contains            Bredband
    click element                       xpath://html/body/div[3]/div[3]/div/div/div[2]/div/div[1]/div[2]/div/div[3]/div/div[2]/div[1]
    click button                        xpath://html/body/div[3]/div[3]/div/div/div[2]/div/div[1]/div[3]/div/div[2]/button
    wait until page contains            Hemförsäkring
    click element                       xpath://html/body/div[3]/div[3]/div/div/div[2]/div/div[1]/div[2]/div/div[4]/div/div[2]/div[1]
    click button                        xpath://html/body/div[3]/div[3]/div/div/div[2]/div/div[1]/div[3]/div/div[2]/button
    wait until page contains            Bilförsäkring
    click element                       xpath://html/body/div[3]/div[3]/div/div/div[2]/div/div[1]/div[2]/div/div[5]/div/div[2]/div[1]
    click button                        xpath://html/body/div[3]/div[3]/div/div/div[2]/div/div[1]/div[3]/div/div[2]/button
    wait until page contains            Privatlån
    click element                       xpath://html/body/div[3]/div[3]/div/div/div[2]/div/div[1]/div[2]/div/div[6]/div/div[2]/div[1]
    click button                        xpath://html/body/div[3]/div[3]/div/div/div[2]/div/div[1]/div[3]/div/div[2]/button
    wait until page contains            Bolån
    click element                       xpath://html/body/div[3]/div[3]/div/div/div[2]/div/div[1]/div[2]/div/div[7]/div/div[2]/div[1]
    click button                        xpath://html/body/div[3]/div[3]/div/div/div[2]/div/div[1]/div[3]/div/div[2]/button
    wait until page contains            Wohoo!
    page should contain                 7 avtal
    click button                        xpath://html/body/div[4]/div[3]/div/div/div[2]/div/div/div[2]/button

Delete Account
    go to                               ${URL_PROFILE}
    wait until page contains            Profil
    click element                       xpath://html/body/div[1]/div[2]/div/div[1]/div[2]/header/div/div[2]/button/span[1]/svg
    click element                       xpath://html/body/div[4]/div[3]/li[2]/span[1]/span
    wait until page contains            Avregistrera mig som kund
    click button                        xpath://html/body/div[4]/div[3]/div/div[2]/div/button
    wait until page contains            Logga in

Teardown
    go to                               ${CONTRACTS}
    wait until page contains            Rekommenderat
    click element                       xpath://html/body/div/div[2]/div/div[2]/div[3]/div/div[2]/div/div[4]/div/div/div[1]
    wait until page contains            Avtal
    click element                       xpath://html/body/div[1]/div[2]/div/div[2]/div[2]/div/div[2]/div[1]/div/div[3]/div[2]/div[1]/div[1]/div[2]
    click element                       xpath://html/body/div[1]/div[2]/div/div[2]/div[2]/div/div[2]/div[1]/div/div[3]/div[2]/div[1]/div[1]/div[2]/div/div/li[1]/div
    wait until page contains            Ta bort avtal
    click button                        xpath://html/body/div[3]/div[3]/div/div[2]/div/button
    wait until page contains            Välkommen till Påmind

End Web Test
    close browser
