*** Settings ***
Library    AppiumLibrary
Variables    ../../locator/add_contact/add_contact_loc.py

*** Keywords ***
Input Name A1
    Wait Until Element Is Visible    xpath=${name_input}   timeout=10s
    Input Text    xpath=${name_input}    A1

Input Phone 0123456
    Wait Until Element Is Visible    xpath=${phone_holder}   timeout=10s
    Click Element    ${phone_holder}
    Wait Until Element Is Visible    xpath=${phone_input}   timeout=10s
    Input Text    xpath=${phone_input}    0123456

Click Save
    Wait Until Element Is Visible    xpath=${save_button}   timeout=10s
    Click Element    xpath=${save_button}

Verify Contact Added
    Wait Until Element Is Visible    xpath=${contact_name}
    Wait Until Element Is Visible    xpath=${contact_phone}
