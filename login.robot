***Settings***
Documentation   Login

Library     SeleniumLibrary

***Test Cases***
Administrator Login
    Acess login page
    Submit my credentials   admin@zepalheta.com.br  pwd123
    I must see the logged area

***Keywords***
Acess login page
    Open Browser    http://zepalheta-web:3000/  firefox
    Maximize Browser Window

Submit my credentials
    [Arguments]     ${email}    ${password}

    Input Text      id:txtEmail                     ${email}
    Input Text      css:input[placeholder=Senha]    ${password}
    Click Element   css:button[id*=Login]

I must see the logged area
    Wait Until Page Contains   Aluguéis  5
    Close Browser

     