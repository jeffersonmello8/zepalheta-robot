***Keywords***

#Login
Acess login page
    Go To           http://zepalheta-web:3000/

Submit my credentials
    [Arguments]     ${email}    ${password}

    Login With      ${email}    ${password}

I must see the logged area
    Wait Until Page Contains   Aluguéis  5

I must received an alert
    [Arguments]     ${expect_message}

    Wait Until Element Contains    ${TOASTER_ERROR}    ${expect_message} 

## Customers
Given that access the customer registration form
    Wait Until Element Is Visible   ${NAV_CUSTOMERS}    5
    Click Element                   ${NAV_CUSTOMERS}
    Wait Until Element Is Visible   ${CUSTOMERS_FORM}   5
    Click Element                   ${CUSTOMERS_FORM}

When include this client:
    [Arguments]             ${name}     ${cpf}      ${address}       ${phone_number}
    
    Register New Customer   ${name}     ${cpf}      ${address}       ${phone_number}

Then must see the notification:
    [Arguments]     ${expect_notice}

    Wait Until Element Contains     ${TOASTER_SUCESS}     ${expect_notice}    5