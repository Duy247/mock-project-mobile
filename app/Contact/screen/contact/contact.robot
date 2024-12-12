*** Settings ***                                                                            
Library           AppiumLibrary
Variables          ../../locator/contact/contact_loc.py

*** Keywords ***
Click More Option Contact
    Wait Until Page Contains Element    ${more_option}    timeout=10s
    Click Element    ${more_option}

Click Delete Contact Option
    Wait Until Page Contains Element    ${delete_contact_option}    timeout=10s
    Click Element    ${delete_contact_option}

Click Confirm Delete Button
    Wait Until Page Contains Element    ${confirm_contact_delete_button}    timeout=10s
    Click Element    ${confirm_contact_delete_button}