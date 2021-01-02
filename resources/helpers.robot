*** Settings ***
Library         OperatingSystem

*** Keywords ***
Get Json
    [Arguments]          ${file}
    ${json_file}         Get File              ${EXEC_DIR}/resources/fixtures/${file}
    ${payload}           Evaluate              json.loads($json_file)       json

    [Return]             ${payload}
