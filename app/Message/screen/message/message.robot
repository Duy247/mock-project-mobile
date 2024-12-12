*** Settings ***                                                
Library    AppiumLibrary
Variables    ../../locator/message/message_loc.py

*** Keywords ***
Input Recipient Number
    [Arguments]    ${recipient_num}
    Wait Until Element Is Visible    xpath=${recipient_field}
    Input Text    xpath=${recipient_field}    ${recipient_num}
    Wait Until Element Is Visible    xpath=${contact_search_result}
    Click Element    xpath=${contact_search_result}

Verify Recipient Named
    [Arguments]    ${recipient_name}
    Page Should Contain Text    ${recipient_name}

Input Text For Message
    [Arguments]    ${message}
    Set Global Variable    ${MESSAGE_SENT}    ${message}
    Wait Until Element Is Visible    xpath=${message_field}
    Input Text    xpath=${message_field}    ${message}

Click Send Button
    Wait Until Element Is Visible    xpath=${send_button}
    Click Element    xpath=${send_button}

Verify Message Sent
    Wait Until Page Contains    ${MESSAGE_SENT}

Click Conversation Setting
    Wait Until Element Is Visible    xpath=${conversation_setting}    timeout=10s
    Click Element    xpath=${conversation_setting}

Choose Delete Message
    Wait Until Element Is Visible    xpath=${delete_message}    timeout=10s
    Click Element    xpath=${delete_message}

Click Delete Button
    Wait Until Element Is Visible    xpath=${delete_button}    timeout=10s
    Click Element    xpath=${delete_button}

Click Confirm Delete Message
    Wait Until Element Is Visible    xpath=${confirm_message_delete_button}    timeout=10s
    Click Element    xpath=${confirm_message_delete_button}

