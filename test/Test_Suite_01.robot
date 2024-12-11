*** Settings ***
Library    AppiumLibrary
Resource    ../Contact/screen/main/main.robot
Resource    ../Contact/screen/contact/contact.robot
Resource    ../Contact/screen/add_contact/add_contact.robot
Resource    ../Message/screen/main/main.robot  
Resource    ../Message/screen/message/message.robot

*** Test Cases ***
[TC_01] Create New Contact
    # [STEP_01] Open Contact App
    Go To Contact App
    # [STEP_02] Add New Contact
    Click Add Contact
    Click Save To Phone

    # [STEP 03] Input Name "A1" and Phone "0123456"
    Input Name A1
    Input Phone 0123456

    # [STEP 04] Select Save
    Click Save
    Verify Contact Added

[TC_02] Create Conversation
    # [STEP_01] Open Message App
    Go To Message App
    
    # [STEP_02] New Conversation
    Create New Conversation
    
    # [STEP_03] Select Created Contact
    Input Recipient 0123456
    
    # [STEP_04] Input Message
    Input Text For Message    Hello
    
    # [STEP_05] Send Message
    Click Send Button
    Verify Message Sent

[TC_03] Delete Contact And Delete Conversation
    # [STEP_01] Open Contact App
    Go To Contact App
    
    # [STEP_02] Select The Contact
    Click Created Contact
    
    # [STEP_03] Select Delete Contact
    Click More Option Contact
    Click Delete Contact Option
    Click Confirm Delete Button
    Verify Contact Deleted
    
    # [STEP_04] Open Message App
    Go To Message App
    
    # [STEP_05] Delete Conversation
    Click Created Message
    Click Conversation Setting
    Choose Delete Message
    Click Delete Button
    Click Confirm Delete Message
    Verify Message Deleted

