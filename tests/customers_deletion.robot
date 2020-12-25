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
    And this customer should not be displayed in the list
