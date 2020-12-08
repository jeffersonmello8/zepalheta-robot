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
    Wait Until Element Is Visible   css:a[href="/customers"]    5
    Click Element                   css:a[href="/customers"]
    Wait Until Element Is Visible   css:a[href$=register]       5
    Click Element                   css:a[href$=register]