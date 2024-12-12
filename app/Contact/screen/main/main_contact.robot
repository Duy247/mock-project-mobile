*** Settings ***                                                                            
Library    AppiumLibrary
Variables    ../../locator/main/main_contact_loc.py
Library    ../../locator/main/main_contact_dynamic_loc.py

*** Variables ***
${APPIUM_URL}    http://127.0.0.1:4723
${PLATFORM_NAME}    Android
${PLATFORM_VERSION}    9
${DEVICE_NAME}    32006e3ac01f9573
${ANDROID_AUTOMATION_NAME}    UiAutomator2

*** Keywords ***
Go To Contact App
    Open Application    ${APPIUM_URL}    platformName=${PLATFORM_NAME}    platformVersion=${PLATFORM_VERSION}    deviceName=${DEVICE_NAME}    
    ...    automationName=${ANDROID_AUTOMATION_NAME}    
    ...    appPackage=${contact_app_package}    appActivity=${contact_app_activity}   

Verify Contact App Opened
    Wait Until Page Contains    contact

Click Add Contact
    Wait Until Element Is Visible    xpath=${add_contact_button}    timeout=10s
    Click Element    xpath=${add_contact_button}

Click Save To Phone
    Wait Until Element Is Visible    xpath=${save_to_phone}    timeout=10s
    Click Element    xpath=${save_to_phone}
    Wait Until Element Is Visible    xpath=${set_save_button}    timeout=10s
    Click Element    xpath=${set_save_button}

Click Created Contact
    [Arguments]    ${contact}
    Set Global Variable    ${CONTACT_NAME}    ${contact}
    ${created_contact} =    Get Created Contact    ${contact}    
    Wait Until Element Is Visible    xpath=${created_contact}    timeout=10s
    Click Element    xpath=${created_contact}
    
Verify Contact Deleted
    ${created_contact} =    Get Created Contact    ${CONTACT_NAME} 
    Page Should Not Contain Element    xpath=${created_contact}

