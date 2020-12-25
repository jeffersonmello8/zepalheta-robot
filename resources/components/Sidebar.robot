***Settings***
Documentation       Representation the Sidebar with its elements

***Variables***
${NAV_CUSTOMERS}    css:a[href="/customers"] 
${NAV_EQUIPMENTS}   css:a[href="/equipos"]

***Keywords***
Go To Customers
    Wait Until Element Is Visible       ${NAV_CUSTOMERS}        5
    Click Element                       ${NAV_CUSTOMERS}