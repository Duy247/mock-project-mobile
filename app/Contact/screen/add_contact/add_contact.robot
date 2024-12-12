*** Settings ***
Library    AppiumLibrary
Variables    ../../locator/add_contact/add_contact_loc.py
Library    ../../locator/add_contact/add_contact_dynamic_loc.py

*** Keywords ***
Input Name
    [Arguments]    ${name}
    Wait Until Element Is Visible    xpath=${name_input}   timeout=10s
    Input Text    xpath=${name_input}    ${name}
    
Input Phone
    [Arguments]    ${phone_num}
    Wait Until Element Is Visible    xpath=${phone_holder}   timeout=10s
    Click Element    ${phone_holder}
    Wait Until Element Is Visible    xpath=${phone_input}   timeout=10s
    Input Text    xpath=${phone_input}    ${phone_num}

Click Save
    Wait Until Element Is Visible    xpath=${save_button}   timeout=10s
    Click Element    xpath=${save_button}

Verify Contact Added
    [Arguments]    ${name_check}    ${phone_check}
    ${contact_name} =    Get Contact Name    ${name_check}
    ${contact_phone} =    Get Contact Phone    ${phone_check}
    Wait Until Element Is Visible    xpath=${contact_name}
    Wait Until Element Is Visible    xpath=${contact_phone}
