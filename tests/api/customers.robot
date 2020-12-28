*** Settings ***
Documentation   Customers testing using the service layer
Resource        ../../resources/services.robot

*** Test Cases ***
New Customer
    Create Session      zp-api      ${base_api_url}

    &{headers}          Create Dictionary     Content-Type=application/json     Authorization=Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2MDkxODE4MDgsImV4cCI6MTYwOTI2ODIwOCwic3ViIjoiYzBiODRmN2UtYzFlNi00ZjI1LTkzNDAtYjA2N2Y1ZTA1YzgwIn0.GDONVaJL_yB1vmg4ftFjE77Yh7nvuV1NYJNngKD8Gug
    &{payload}          Create Dictionary     name=Eloá Porto       cpf=929.977.566-42     address=Rua Flamboyant, 174      phone_number=(31) 9.8435-1538

    Delete Request      zp-api      /customers/${payload['cpf']}       headers=${headers}       

    ${resp}=            Post Request     zp-api        /customers       data=${payload}         headers=${headers}

    Status Should Be    200              ${resp}
