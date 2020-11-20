***Settings***
Documentation   Login

Resource    ../resources/kws.robot

***Test Cases***
Administrator Login
    Acess login page
    Submit my credentials   admin@zepalheta.com.br  pwd123
    I must see the logged area

Incorrect Password
    [tags]  inv_login
    Acess login page
    Submit my credentials       admin@zepalheta.com.br  abc123
    I must received an alert    Ocorreu um erro ao fazer login, cheque as credenciais.

Blank Password
    [tags]  inv_login
    Acess login page
    Submit my credentials       admin@zepalheta.com.br  ${EMPTY}
    I must received an alert    O campo senha é obrigatório!

Blank Email
    [tags]  inv_login
    Acess login page
    Submit my credentials       ${EMPTY}    123456
    I must received an alert    O campo email é obrigatório!

Email and Password in Blank
    [tags]  inv_login
    Acess login page
    Submit my credentials       ${EMPTY}    ${EMPTY} 
    I must received an alert    Os campos email e senha não foram preenchidos!
