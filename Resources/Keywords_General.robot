*** Settings ***

*** Variables ***

${BROWSER}          chrome
${URL}              https://app-staging.pamind.se/login
${PERSON_NR}        9803250720

*** Keywords ***
Begin Web Test
    Open browser        about:blank     ${BROWSER}

End Web Test
    Close browser