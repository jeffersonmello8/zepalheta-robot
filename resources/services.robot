***Settings***
Documentation         Service layer

Library               Collections
Library               RequestsLibrary

*** Variables ***
${base_api_url}       http://zepalheta-web:3333  

***Keywords***
New Session
    [Arguments]         ${email}         ${password}
    Create Session      zp-api           ${base_api_url}

    &{header}           Create Dictionary     Content-Type=application/json
    ${payload}          Create Dictionary     email=${email}    password=${password}

    ${resp}=            Post Request     zp-api        /sessions       data=${payload}         headers=${headers}

    [Return]            ${resp}