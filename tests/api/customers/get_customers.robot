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

Get Unique Customer
    ${customer}         Get Json              customers/gabriela.json

    Delete Costumer     ${customer['cpf']}

    ${resp}             Post Costumer         ${customer}
    ${customer_id}      Convert To String     ${resp.json()['id']}

    ${resp}             Get Unique Costumer   ${customer_id}  

    Status Should Be    200                   ${resp}
    Should Be Equal     ${customer['cpf']}    ${resp.json()['cpf']}
    Should Be Equal     ${customer['name']}   ${resp.json()['name']}

Get Customer Not Found
    ${resp}             Get Unique Costumer             baa7a52965b99778f38ef37f235e9053

    Status Should Be    404                             ${resp} 
    Should Be Equal     ${resp.json()['message']}       Customer not found  
