*** Settings ***
Library    AppiumLibrary
Resource    ../Contact/screen/main/main.robot
Resource    ../Contact/screen/contact/contact.robot
Resource    ../Message/screen/main/main.robot  
Resource    ../Message/screen/message/message.robot


*** Test Cases ***
[TC_03] Delete Contact And Delete Conversation
    [STEP_01] Open Contact App
    [STEP_02] Select The Contact
    [STEP_03] Select Delete Contact
    [STEP_04] Open Message App
    [STEP_05] Delete Conversation

*** Keywords ***
[STEP_01] Open Contact App
    Go To Contact App

[STEP_02] Select The Contact
    Click First Contact

[STEP_03] Select Delete Contact
    Click More Option Contact
    Click Delete Contact Option
    Click Confirm Delete Button
    Verify Contact Deleted

[STEP_04] Open Message App
    Go To Message App

[STEP_05] Delete Conversation
    Click Created Message
    Click Conversation Setting
    Choose Delete Message
    Click Delete Button
    Click Confirm Delete Message
    Verify Message Deleted
