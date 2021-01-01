***Settings***
Documentation   Login

Resource        ../../resources/base.robot

#Perform before any test case
Test Setup       Start Session

#Perform after any test case
Test Teardown    Finish TestCase

#Perform after test suite
Suite Teardown   Finish Session

***Test Cases***
Sucessful Login
    [Tags]  smoke
    Acess login page
    Submit my credentials   ${admin_user}  ${admin_pass}
    I must see the logged area
