***Keywords***

#Login
Acess login page
    Go To           ${base_url} 

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

And that I have the following client:
    [Arguments]             ${name}     ${cpf}      ${address}       ${phone_number}
    
    Remove Customer By Cpf  ${cpf}

    Set Test Variable       ${name}
    Set Test Variable       ${cpf}
    Set Test Variable       ${address}
    Set Test Variable       ${phone_number}

When include this client
    Register New Customer   ${name}     ${cpf}      ${address}       ${phone_number}

Then must see the notification:
    [Arguments]     ${expect_notice}

    Wait Until Element Contains     ${TOASTER_SUCESS}     ${expect_notice}    5

Then must see the messages of validation for all fields
    Wait Until Element Contains     ${LABEL_NAME}           Nome é obrigatório          5
    Wait Until Element Contains     ${LABEL_CPF}            CPF é obrigatório           5
    Wait Until Element Contains     ${LABEL_ADDRESS}        Endereço é obrigatório      5
    Wait Until Element Contains     ${LABEL_PHONE}          Telefone é obrigatório      5

Then must see the messages of validation
    [Arguments]     ${expect_message}
    
    Wait Until Page Contains     ${expect_message}         5
