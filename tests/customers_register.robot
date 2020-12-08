***Settings***
Documentation   Customers Registration

Resource        ../resources/base.robot

Test Setup      Login Session
Test Teardown   Finish Session

***Test Cases***
New Customer
    Given that access the customer registration form
    # When include this client:
    # ...     Jefferson Melo      04656265306     Rua Nunes Valente, 2005     85999999999
    # Then must see the notification:     Cliente cadastrado com sucesso!


***Keywords***
Given that access the customer registration form
    Wait Until Element Is Visible   ${NAV_CUSTOMERS}    5
    Click Element                   ${NAV_CUSTOMERS}
    Wait Until Element Is Visible   ${CUSTOMERS_FORM}   5
    Click Element                   ${CUSTOMERS_FORM}