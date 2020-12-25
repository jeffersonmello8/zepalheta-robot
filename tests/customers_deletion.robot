***Settings***
Documentation   Customers Deletion

Resource        ../resources/base.robot

Suite Setup      Login Session
Suite Teardown   Finish Session

***Test Cases***
Customer Deletion
    Given that I have a unwelcome customer:
    ...     Caroline Costa      29035566602     Rua Cidade de Crateus,436       47999509124
    And access the customers list
    When I remove this customer 
    Then must see the notification:     Cliente removido com sucesso!

***Keywords***
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

