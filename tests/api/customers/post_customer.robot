*** Settings ***
Documentation   Customers testing using the service layer
Resource        ../../resources/services.robot
Resource        ../../resources/base.robot

*** Test Cases ***
New Customer
    ${payload}          Get Json            customers/eloa.json

    Delete Costumer     ${payload['cpf']}    

    ${resp}=            Post Costumer  ${payload}

    Status Should Be    200              ${resp}

New Customer (Without name)
    ${payload}          Get Json            customers/without_name.json      

    ${resp}=            Post Costumer  ${payload}

    Should Be Equal     ${resp.json()['message']}            "name" is required
    Should Be Equal     ${resp.json()['statusCode']}         ${400}

New Customer (Without cpf)
    ${payload}          Get Json            customers/without_cpf.json 

    ${resp}=            Post Costumer  ${payload}

    Should Be Equal     ${resp.json()['message']}            "cpf" is required
    Should Be Equal     ${resp.json()['statusCode']}         ${400}

New Customer (Without address)
    ${payload}          Get Json            customers/without_address.json 

    ${resp}=            Post Costumer  ${payload}

    Should Be Equal     ${resp.json()['message']}            "address" is required
    Should Be Equal     ${resp.json()['statusCode']}         ${400}


New Customer (Without phone)
    ${payload}          Get Json            customers/without_phone.json    

    ${resp}=            Post Costumer  ${payload}

    Should Be Equal     ${resp.json()['message']}            "phone_number" is required
    Should Be Equal     ${resp.json()['statusCode']}         ${400}