*** Settings ***
Library           AppiumLibrary
Resource          ../Contact/screen/main/main.robot
Resource          ../Contact/screen/contact/contact.robot

*** Variables ***

*** Test Cases ***
[TC_03] Delete Contact And Delete Conversation
    [STEP_01] Open Contact App
    [STEP_02] Select The Contact
    [STEP_03] Select Delete Contact

*** Keywords ***
[STEP_01] Open Contact App
    Open Contact App

[STEP_02] Select The Contact
    Click First Contact

[STEP_03] Select Delete Contact
    Click More Option
    Click Delete Contact Option
    Click Confirm Delete Button
    Verify Contact Deleted