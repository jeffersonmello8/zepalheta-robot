***Settings***
Documentation   Login

Resource        ../resources/base.robot

#Perform before any test case
Test Setup      Start Session

#Perform after any test case
Test Teardown   Finish Session


***Test Cases***
Sucessful Login
    Acess login page
    Submit my credentials   admin@zepalheta.com.br  pwd123
    I must see the logged area
