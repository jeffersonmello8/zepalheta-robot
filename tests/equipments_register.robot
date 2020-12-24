***Settings***
Documentation   Equipments Registration

Resource        ../resources/base.robot

Suite Setup      Login Session
Suite Teardown   Finish Session

***Keywords***
Fields Validation
    [Arguments]     ${name}     ${price}    ${message_expected}
    Given that access the equipments registration form
    And that I have the following equipment:
    ...             ${name}     ${price}
    When include this equipment 
    Then must see the messages of validation    ${message_expected}

***Test Cases***
New Equipment
    [Tags]  smoke
    Given that access the equipments registration form
    And that I have the following equipment:
    ...     Guitarra Jimi Hendrix   150 
    When include this equipment
    Then must see the notification:     Equipo cadastrado com sucesso!

Duplicate Equipment
    [Tags]  smoke
    Given that access the equipments registration form
    And that I have the following equipment:
    ...     Teclado Musical         350 
    But this equipment already exists in the system
    When include this equipment
    Then must see the error notification:    Erro na criação de um equipo

All Mandatory Fields
    [Tags]  smoke
    Given that access the equipments registration form
    And that I have the following equipment:
    ...     ${EMPTY}  ${EMPTY} 
    When include this equipment
    Then must see the messages of validation for all fields in equipments registration form

Without Name 
    [Template]  Fields Validation
    ${EMPTY}            250         Nome do equipo é obrigatório

Without Price 
    [Template]  Fields Validation
    Pandeiro do Babau   ${EMPTY}    Diária do equipo é obrigatória

    



