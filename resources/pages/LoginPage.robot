***Settings***
Documentation       Representation the login page with its actions and elements

***Keywords***
Login With
    [Arguments]     ${email}    ${password}

    Input Text      id:txtEmail                     ${email}
    Input Text      css:input[placeholder=Senha]    ${password}
    Click Element   css:button[id*=Login]