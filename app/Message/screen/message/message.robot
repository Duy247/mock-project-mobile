*** Settings ***                                                
Library    AppiumLibrary
Variables    ../../locator/message/message_loc.py

*** Keywords ***
Input Recipient 0123456
    Wait Until Element Is Visible    xpath=${recipient_field}
    Input Text    xpath=${recipient_field}    0123456
    Wait Until Element Is Visible    xpath=${contact_search_result}
    Click Element    xpath=${contact_search_result}

Verify Recipient Named A1
    Page Should Contain Text    A1

Input Text For Message
    [Arguments]    ${message}
    Wait Until Element Is Visible    xpath=${message_field}
    Input Text    xpath=${message_field}    ${message}

Click Send Button
    Wait Until Element Is Visible    xpath=${send_button}
    Click Element    xpath=${send_button}

Verify Message Sent
    Wait Until Element Is Visible    xpath=${hello_message}    timeout=10s

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

