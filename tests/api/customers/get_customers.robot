*** Settings ***
Documentation   Customers testing using the service layer
Resource        ../../../resources/services.robot
Resource        ../../../resources/base.robot

*** Test Cases ***
Get Customer List

    ${list_customers}   Get Json              customers/list_customers.json

    FOR     ${item}     IN      @{list_customers['data']}
            Post Costumer  ${item}
    END

    ${resp}=            Get Costumers

    Status Should Be    200                    ${resp}

    ${total}=           Get Length             ${resp.json()}
    Should Be True      ${total} > 0 
