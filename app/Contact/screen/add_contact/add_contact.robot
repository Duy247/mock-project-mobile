*** Settings ***
Library    AppiumLibrary
Variables    ../../locator/add_contact/add_contact_loc.py

*** Keywords ***
Input Name
    [Arguments]    ${name}
    Wait Until Element Is Visible    ${name_input}   timeout=10s
    Input Text    ${name_input}    ${name}
    
Input Phone
    [Arguments]    ${phone_num}
    Wait Until Element Is Visible    ${phone_holder}   timeout=10s
    Click Element    ${phone_holder}
    Wait Until Element Is Visible    ${phone_input}   timeout=10s
    Input Text    ${phone_input}    ${phone_num}

Click Save
    Wait Until Element Is Visible    ${save_button}   timeout=10s
    Click Element    ${save_button}

Verify Contact Added
    [Arguments]    ${name_check}    ${phone_check}
    ${contact_name_loc}    Set Variable    //*[contains(@resource-id,'header') and @text='${name_check}']
    ${contact_phone_loc}    Set Variable    //*[contains(@resource-id,'display_number') and @text='${phone_check}']
    Wait Until Element Is Visible    ${contact_name_loc}
    Wait Until Element Is Visible    ${contact_phone_loc}
