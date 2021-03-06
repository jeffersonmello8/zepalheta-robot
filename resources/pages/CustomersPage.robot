***Settings***
Documentation       Representation the customers page with its actions and elements

***Variables*** 
${CUSTOMERS_FORM}   css:a[href$=register]
${LABEL_NAME}       css:label[for=name] 
${LABEL_CPF}        css:label[for=cpf]
${LABEL_ADDRESS}    css:label[for=address]
${LABEL_PHONE}      css:label[for=phone_number]


***Keywords***
Register New Customer 
    [Arguments]     ${name}     ${cpf}      ${address}       ${phone_number}

    Input Text      id:name             ${name}     
    Input Text      id:cpf              ${cpf}
    Input Text      id:address          ${address}
    Input Text      id:phone_number     ${phone_number}   

    Click Element   xpath://button[text()='CADASTRAR']

Go To Customers Details
    [Arguments]     ${formatted_cpf}

    ${element}=     Set Variable        //td[text()='${formatted_cpf}']

    Wait Until Element Is Visible       ${element}      5
    Click Element                       ${element}
    
Click Button Remove Customer
    ${button}=      Set Variable        //button[text()='APAGAR'] 
    
    Wait Until Element Is Visible       ${button}       5
    Click Element                       ${button}
