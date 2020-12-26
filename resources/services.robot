***Settings***
Documentation         Service Layer

Library               Collections
Library               RequestsLibrary

***Keywords***
New Session
    [Arguments]         ${email}         ${password}
    Create Session      zp-api          http://zepalheta-web:3333

    &{headers}          Create Dictionary     Content-Type=application/json
    ${payload}          Create Dictionary     email=${email}    password=${password}

    ${resp}=            Post Request     zp-api        /sessions       data=${payload}         headers=${headers}

    [Return]            ${resp}