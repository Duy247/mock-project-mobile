*** Settings ***
Library    AppiumLibrary
Resource    ../app/Contact/screen/main/main_contact.robot
Resource    ../app/Contact/screen/contact/contact.robot
Resource    ../app/Contact/screen/add_contact/add_contact.robot
Resource    ../app/Message/screen/main/main_message.robot  
Resource    ../app//Message/screen/message/message.robot

*** Variables ***   
${CONTACT_NAME}    Lam Oanh
${CONTACT_NUM}    0123456
${SEND_MESSAGE}    Hello Oanh

*** Test Cases ***
[TC_01] Create New Contact
    # [STEP_01] Open Contact App
    Go To Contact App
    Verify Contact App Opened

    # [STEP_02] Add New Contact
    Click Add Contact
    Click Save To Phone

    # [STEP 03] Input Name "A1" and Phone "0123456"
    Input Name    ${CONTACT_NAME}
    Input Phone    ${CONTACT_NUM}

    # [STEP 04] Select Save
    Click Save
    Verify Contact Added    ${CONTACT_NAME}    ${CONTACT_NUM}

[TC_02] Create Conversation
    # [STEP_01] Open Message App
    Go To Message App
    Verify Message App Opened
    
    # [STEP_02] New Conversation
    Create New Conversation
    
    # [STEP_03] Select Created Contact
    Input Recipient Number    ${CONTACT_NUM}
    Verify Recipient Named    ${CONTACT_NAME}
    
    # [STEP_04] Input Message
    Input Text For Message    ${SEND_MESSAGE}
    
    # [STEP_05] Send Message
    Click Send Button
    Verify Message Sent

[TC_03] Delete Contact And Delete Conversation
    # [STEP_01] Open Contact App
    Go To Contact App
    Verify Contact App Opened
    
    # [STEP_02] Select The Contact
    Click Created Contact    ${CONTACT_NAME}
    
    # [STEP_03] Select Delete Contact
    Click More Option Contact
    Click Delete Contact Option
    Click Confirm Delete Button
    Verify Contact Deleted    
    
    # [STEP_04] Open Message App
    Go To Message App
    Verify Message App Opened
    
    # [STEP_05] Delete Conversation
    Click Created Message By Number    ${CONTACT_NUM}
    Click Conversation Setting
    Choose Delete Message
    Click Delete Button
    Click Confirm Delete Message
    Verify Message Deleted

