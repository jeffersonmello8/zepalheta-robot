***Settings***
Documentation   Login

Resource        ../../resources/base.robot

#Perform before any test case
Test Setup      Start Session

#Perform after any test case
Test Teardown   Finish Session


***Test Cases***
Sucessful Login
    [Tags]  Smoke
    Acess login page
    Submit my credentials   ${admin_user}  ${admin_pass}
    I must see the logged area
