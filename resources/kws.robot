***Keywords***
Acess login page
    Go To   http://zepalheta-web:3000/

Submit my credentials
    [Arguments]     ${email}    ${password}

    Input Text      id:txtEmail                     ${email}
    Input Text      css:input[placeholder=Senha]    ${password}
    Click Element   css:button[id*=Login]

I must see the logged area
    Wait Until Page Contains   Aluguéis  5

I must received an alert
    [Arguments]     ${expect_message}

    Wait Until Element Contains    css:div[type=error] p   ${expect_message} 
