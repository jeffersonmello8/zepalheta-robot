***Settings***
Documentation   Login

Resource        ../resources/kws.robot

Test Template   Attemped Login

***Keywords***
Attemped Login
    [Arguments]                 ${email}    ${password}     ${message_expected}
    Acess login page     
    Submit my credentials       ${email}    ${password}
    I must received an alert    ${message_expected}

***Test Cases***
Incorrect Password              admin@zepalheta.com.br      abc123      Ocorreu um erro ao fazer login, cheque as credenciais.
Blank Password                  admin@zepalheta.com.br      ${EMPTY}    O campo senha é obrigatório!
Blank Email                     ${EMPTY}                    123456      O campo email é obrigatório!
Email and Password in Blank     ${EMPTY}                    ${EMPTY}    Os campos email e senha não foram preenchidos!
