*** Settings ***                                                                            
Library           AppiumLibrary
Variables          ../../locator/contact/contact_loc.py

*** Keywords ***
Click More Option
    Wait Until Page Contains Element    xpath=${more_option}
    Click Element    xpath=${more_option}

Click Delete Contact Option
    Wait Until Page Contains Element    xpath=${delete_contact_option}
    Click Element    xpath=${delete_contact_option}

Click Confirm Delete Button
    Wait Until Page Contains Element    xpath=${confirm_delete_button}
    Click Element    xpath=${confirm_delete_button}