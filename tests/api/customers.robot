*** Settings ***
Documentation   Customers testing using the service layer
Resource        ../../resources/services.robot
Resource        ../../resources/base.robot

*** Test Cases ***
New Customer
    &{payload}=         Create Dictionary     name=Eloá Porto       cpf=929.977.566-42     address=Rua Flamboyant, 174      phone_number=(31) 9.8435-1538

    Delete Costumer     ${payload['cpf']}    

    ${resp}=            Post Costumer  ${payload}

    Status Should Be    200              ${resp}


New Customer (Without name)
    &{payload}=         Create Dictionary     cpf=929.977.566-42     address=Rua Flamboyant, 174      phone_number=(31) 9.8435-1538       

    ${resp}=            Post Costumer  ${payload}

    Should Be Equal     ${resp.json()['message']}            "name" is required
    Should Be Equal     ${resp.json()['statusCode']}         ${400}

New Customer (Without cpf)
    &{payload}=         Create Dictionary     name=Eloá Porto        address=Rua Flamboyant, 174      phone_number=(31) 9.8435-1538

    ${resp}=            Post Costumer  ${payload}

    Should Be Equal     ${resp.json()['message']}            "cpf" is required
    Should Be Equal     ${resp.json()['statusCode']}         ${400}

New Customer (Without address)
    &{payload}=         Create Dictionary     name=Eloá Porto        cpf=929.977.566-42               phone_number=(31) 9.8435-1538

    ${resp}=            Post Costumer  ${payload}

    Should Be Equal     ${resp.json()['message']}            "address" is required
    Should Be Equal     ${resp.json()['statusCode']}         ${400}


New Customer (Without phone)
    &{payload}=         Create Dictionary     name=Eloá Porto        cpf=929.977.566-42               address=Rua Flamboyant, 174     

    ${resp}=            Post Costumer  ${payload}

    Should Be Equal     ${resp.json()['message']}            "phone_number" is required
    Should Be Equal     ${resp.json()['statusCode']}         ${400}