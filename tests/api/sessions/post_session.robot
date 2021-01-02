***Settings***
Documentation           Login testing using the service layer
Resource                ../../resources/services.robot

***Test Cases***
Sucessful Login
    ${resp}=            New Session      admin@zepalheta.com.br     pwd123
    Status Should Be    200              ${resp}         

Incorrect Password
    ${resp}=            New Session      admin@zepalheta.com.br     pwd124
    Status Should Be    401              ${resp}           

User Not Found
    ${resp}=            New Session      eu@zepalheta.com.br        pwd123
    Status Should Be    401              ${resp} 

Empty Email
    ${resp}=            New Session      ${EMPTY}                   pwd123
    Status Should Be    400              ${resp} 

Empty Password
    ${resp}=            New Session      eu@zepalheta.com.br        ${EMPTY}
    Status Should Be    400              ${resp}   
