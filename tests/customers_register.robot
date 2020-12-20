***Settings***
Documentation   Customers Registration

Resource        ../resources/base.robot

Suite Setup      Login Session
Suite Teardown   Finish Session

***Keywords***
Fields Validation
    [Arguments]     ${name}     ${cpf}      ${address}     ${phone_number}    ${message_expected}
    Given that access the customer registration form
    And that I have the following client:
    ...     ${name}  ${cpf}  ${address}  ${phone_number}
    When include this client 
    Then must see the messages of validation    ${message_expected}

***Test Cases***
New Customer
    Given that access the customer registration form
    And that I have the following client:
    ...     Jefferson Melo      02349724085     Rua Nunes Valente, 2005     85999999999
    When include this client
    Then must see the notification:     Cliente cadastrado com sucesso!

All Mandatory Fields
    Given that access the customer registration form
    And that I have the following client:
    ...     ${EMPTY}  ${EMPTY}  ${EMPTY}  ${EMPTY}
    When include this client
    Then must see the messages of validation for all fields 

Without Name
    [Template]  Fields Validation
    ${EMPTY}          07507993078     Rua Nunes Valente, 2005    85999999999      Nome é obrigatório

Without CPF
    [Template]  Fields Validation
    Adenor Bacchi     ${EMPTY}        Rua Nunes Valente, 2006    85999999998      CPF é obrigatório

Without Address     
    [Template]  Fields Validation
    Paolo Guerrero    31147843058     ${EMPTY}                   85999999997      Endereço é obrigatório

Without Phone       
    [Template]  Fields Validation
    Cássio Ramos      52654952070     Rua Nunes Valente, 2007    ${EMPTY}         Telefone é obrigatório 

Invalid Phone       
    [Template]  Fields Validation
    Emerson Sheik     52654952070     Rua Nunes Valente, 2007    8599865579       Telefone inválido

