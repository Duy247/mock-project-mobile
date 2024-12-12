*** Settings ***
Library    AppiumLibrary
Variables    ../../locator/add_contact/add_contact_loc.py
Library    ../../locator/add_contact/add_contact_dynamic_loc.py

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
    ${contact_name} =    Get Contact Name    ${name_check}
    ${contact_phone} =    Get Contact Phone    ${phone_check}
    Wait Until Element Is Visible    ${contact_name}
    Wait Until Element Is Visible    ${contact_phone}
