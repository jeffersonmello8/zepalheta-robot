***Settings***
Documentation         Service layer

Library               Collections
Library               RequestsLibrary

*** Variables ***
${base_api_url}       http://zepalheta-api:3333  

***Keywords***
##Helpers
Get Session Token
    ${resp}            New Session         ${admin_user}       ${admin_pass}

    ${token}           Convert To String   Bearer ${resp.json()['token']}

    [return]           ${token}

#POST /customers
New Session
    [Arguments]         ${email}         ${password}
    Create Session      zp-api           ${base_api_url}

    &{header}           Create Dictionary     Content-Type=application/json
    ${payload}          Create Dictionary     email=${email}    password=${password}

    ${resp}=            Post Request     zp-api        /sessions       data=${payload}         headers=${header}

    [Return]            ${resp}
    
Post Costumer
    [Arguments]         ${payload}

    Create Session      zp-api      ${base_api_url}

    ${token}=           Get Session Token

    &{headers}=         Create Dictionary     Content-Type=application/json     Authorization=${token}

    ${resp}=            Post Request     zp-api        /customers       data=${payload}         headers=${headers}

    [Return]            ${resp}

#DELETE /customers
Delete Costumer
    [Arguments]         ${cpf}

    Create Session      zp-api      ${base_api_url}

    ${token}=           Get Session Token

    &{headers}=         Create Dictionary     Content-Type=application/json     Authorization=${token}

    Delete Request      zp-api      /customers/${cpf}      headers=${headers}  
