*** Settings ***
Library    AppiumLibrary
Resource    ../Contact/screen/main/main.robot
Resource    ../Contact/screen/contact/contact.robot
Resource    ../Contact/screen/add_contact/add_contact.robot



*** Test Cases ***
[TC_01] Create New Contact
    [STEP_01] Open Contact App
    [STEP_02] Add New Contact
    [STEP 03] Input Name "A1" and Phone "0123456"
    [STEP 04] Select Save

*** Keywords ***
[STEP_01] Open Contact App
    Go To Contact App

[STEP_02] Add New Contact
    Click Add Contact
    Click Save To Phone

[STEP 03] Input Name "A1" and Phone "0123456"
    Input Name A1
    Input Phone 0123456

[STEP 04] Select Save
    Click Save
    Verify Contact Added