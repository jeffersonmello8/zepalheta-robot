***Settings***
Documentation   Customers Registration

Resource        ../resources/base.robot

Test Setup      Login Session
Test Teardown   Finish Session

***Test Cases***
New Customer
    Given that access the customer registration form
    When include this client:
    ...     Jefferson Melo      02349724085     Rua Nunes Valente, 2005     85999999999
    Then must see the notification:     Cliente cadastrado com sucesso!
