***Settings***
Documentation       Representation the equipments page with its actions and elements

***Variables*** 
${EQUIPMENTS_FORM}          css:a[href="/equipos/register"]
${LABEL_NAME_EQUIPMENT}     css:label[for=equipo-name]
${LABEL_PRICE_EQUIPMENT}    css:label[for=daily_price]

***Keywords***
Register New Equipment 
    [Arguments]     ${name}     ${price}  

    Input Text      id:equipo-name             ${name}     
    Input Text      id:daily_price             ${price}  

    Click Element   xpath://button[text()='CADASTRAR']
