*** Settings ***                                                
Library    AppiumLibrary
Variables    ../../locator/message/message_loc.py

*** Keywords ***
Input Recipient Number
    [Arguments]    ${recipient_num}
    Wait Until Element Is Visible    ${recipient_field}
    Input Text    ${recipient_field}    ${recipient_num}
    Wait Until Element Is Visible    ${contact_search_result}
    Click Element    ${contact_search_result}

Verify Recipient Named
    [Arguments]    ${recipient_name}
    Page Should Contain Text    ${recipient_name}

Input Text For Message
    [Arguments]    ${message}
    Set Global Variable    ${MESSAGE_SENT}    ${message}
    Wait Until Element Is Visible    ${message_field}
    Input Text    ${message_field}    ${message}

Click Send Button
    Wait Until Element Is Visible    ${send_button}
    Click Element    ${send_button}

Verify Message Sent
    Wait Until Page Contains    ${MESSAGE_SENT}

Click Conversation Setting
    Wait Until Element Is Visible    ${conversation_setting}    timeout=10s
    Click Element    ${conversation_setting}

Choose Delete Message
    Wait Until Element Is Visible    ${delete_message}    timeout=10s
    Click Element    ${delete_message}

Click Delete Button
    Wait Until Element Is Visible    ${delete_button}    timeout=10s
    Click Element    ${delete_button}

Click Confirm Delete Message
    Wait Until Element Is Visible    ${confirm_message_delete_button}    timeout=10s
    Click Element    ${confirm_message_delete_button}

