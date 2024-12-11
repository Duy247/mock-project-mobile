*** Settings ***
Library    AppiumLibrary
Resource    ../Message/screen/main/main.robot  
Resource    ../Message/screen/message/message.robot


*** Test Cases ***
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


