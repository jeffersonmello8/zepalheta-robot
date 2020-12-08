***Keywords***
Acess login page
    Go To           http://zepalheta-web:3000/

Submit my credentials
    [Arguments]     ${email}    ${password}

    Login With      ${email}    ${password}

I must see the logged area
    Wait Until Page Contains   Aluguéis  5

I must received an alert
    [Arguments]     ${expect_message}

    Wait Until Element Contains    css:div[type=error] p   ${expect_message} 
