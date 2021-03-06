***Settings***
Documentation   Customers Registration

Resource         ../../resources/base.robot

Suite Setup      Login Session
Suite Teardown   Finish Session
Test Teardown    Finish TestCase

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
    [Tags]  smoke
    Given that access the customer registration form
    And that I have the following client:
    ...     Jefferson Melo      02349724085     Rua Nunes Valente, 2005     (85)9.9999-9999
    When include this client
    Then must see the notification:     Cliente cadastrado com sucesso!
    And this customer should be displayed in the list

Duplicate Customer
    [Tags]  smoke
    Given that access the customer registration form
    And that I have the following client:
    ...     Rafaela Isadora     55986264037     Rua Gazeta, 837             (11)9.9392-3657
    But this customer already exists in the system
    When include this client
    Then must see the error notification:     Este CPF já existe no sistema!

All Mandatory Fields
    Given that access the customer registration form
    And that I have the following client:
    ...     ${EMPTY}  ${EMPTY}  ${EMPTY}  ${EMPTY}
    When include this client
    Then must see the messages of validation for all fields 

Without Name
    [Template]  Fields Validation
    ${EMPTY}          07507993078     Rua Nunes Valente, 2005    (85)9.9999-9999      Nome é obrigatório

Without CPF
    [Template]  Fields Validation
    Adenor Bacchi     ${EMPTY}        Rua Nunes Valente, 2006    (85)9.9999-9998      CPF é obrigatório

Without Address     
    [Template]  Fields Validation
    Paolo Guerrero    31147843058     ${EMPTY}                   (85)9.9999-9997      Endereço é obrigatório

Without Phone       
    [Template]  Fields Validation
    Cássio Ramos      52654952070     Rua Nunes Valente, 2007    ${EMPTY}             Telefone é obrigatório 

Invalid Phone       
    [Template]  Fields Validation
    Emerson Sheik     52654952070     Rua Nunes Valente, 2007    (85)9.9999-999       Telefone inválido

