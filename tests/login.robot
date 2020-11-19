***Settings***
Documentation   Login

Resource    ../resources/kws.robot

***Test Cases***
Administrator Login
    Acess login page
    Submit my credentials   admin@zepalheta.com.br  pwd123
    I must see the logged area

Incorrect Password
    [tags]  inv_pass
    Acess login page
    Submit my credentials       admin@zepalheta.com.br  abc123
    I must received an alert    Ocorreu um erro ao fazer login, cheque as credenciais.
