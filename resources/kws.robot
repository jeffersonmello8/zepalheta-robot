***Keywords***

## Login
Acess login page
    Go To           ${base_url} 

Submit my credentials
    [Arguments]     ${email}    ${password}

    Login With      ${email}    ${password}

I must see the logged area
    Wait Until Page Contains   Aluguéis  5

I must received an alert
    [Arguments]     ${expect_message}

    Wait Until Element Contains    ${TOASTER_ERROR_P}    ${expect_message} 

## Register Customers
Given that access the customer registration form
    Go To Customers

    Wait Until Element Is Visible   ${CUSTOMERS_FORM}   5
    Click Element                   ${CUSTOMERS_FORM}

And that I have the following client:
    [Arguments]             ${name}     ${cpf}      ${address}       ${phone_number}
    
    Remove Customer By Cpf  ${cpf}

    Set Test Variable       ${name}
    Set Test Variable       ${cpf}
    Set Test Variable       ${address}
    Set Test Variable       ${phone_number}

But this customer already exists in the system
    Insert Customer         ${name}     ${cpf}      ${address}       ${phone_number}

When include this client
    Register New Customer   ${name}     ${cpf}      ${address}       ${phone_number}

Then must see the notification:
    [Arguments]     ${expect_notice}

    Wait Until Element Contains     ${TOASTER_SUCESS}     ${expect_notice}    5

Then must see the error notification:
    [Arguments]     ${expect_notice}

    Wait Until Element Contains     ${TOASTER_ERROR}     ${expect_notice}    5

Then must see the messages of validation for all fields
    Wait Until Element Contains     ${LABEL_NAME}           Nome é obrigatório          5
    Wait Until Element Contains     ${LABEL_CPF}            CPF é obrigatório           5
    Wait Until Element Contains     ${LABEL_ADDRESS}        Endereço é obrigatório      5
    Wait Until Element Contains     ${LABEL_PHONE}          Telefone é obrigatório      5

Then must see the messages of validation
    [Arguments]     ${expect_message}
    
    Wait Until Page Contains     ${expect_message}         5

## Deletion Customers
Given that I have a unwelcome customer:
    [Arguments]     ${name}     ${cpf}      ${address}     ${phone_number}
    
    Remove Customer By Cpf  ${cpf}
    Insert Customer         ${name}     ${cpf}      ${address}       ${phone_number}

    Set Test Variable       ${cpf}

And access the customers list
    Go To Customers

When I remove this customer
    ${formatted_cpf}=           format_cpf      ${cpf}

    Go To Customers Details     ${formatted_cpf}
    Click Button Remove Customer

## Register Equipments
Given that access the equipments registration form
    Wait Until Element Is Visible   ${NAV_EQUIPMENTS}      5
    Click Element                   ${NAV_EQUIPMENTS} 
    Wait Until Element Is Visible   ${EQUIPMENTS_FORM}     5
    Click Element                   ${EQUIPMENTS_FORM}

And that I have the following equipment:
    [Arguments]                 ${name}     ${price}     
    
    Remove Equipments By Name   ${name}
    
    Set Test Variable           ${name}
    Set Test Variable           ${price}

When include this equipment
    Register New Equipment   ${name}     ${price} 

But this equipment already exists in the system
    Insert Equipment         ${name}     ${price}

Then must see the messages of validation for all fields in equipments registration form
    Wait Until Element Contains     ${LABEL_NAME_EQUIPMENT}           Nome do equipo é obrigatório          5
    Wait Until Element Contains     ${LABEL_PRICE_EQUIPMENT}          Diária do equipo é obrigatória        5