*** Settings ***                                                
Library    AppiumLibrary
Variables    ../../locator/main/main_message_loc.py
Library    ../../locator/main/main_message_dynamic_loc.py

*** Variables ***
${APPIUM_URL}    http://127.0.0.1:4723
${PLATFORM_NAME}    Android
${PLATFORM_VERSION}    9
${DEVICE_NAME}    32006e3ac01f9573
${ANDROID_AUTOMATION_NAME}    UiAutomator2

*** Keywords ***
Go To Message App
    Open Application    ${APPIUM_URL}    platformName=${PLATFORM_NAME}    platformVersion=${PLATFORM_VERSION}    deviceName=${DEVICE_NAME}    
    ...    automationName=${ANDROID_AUTOMATION_NAME}    
    ...    appPackage=${message_app_package}    appActivity=${message_app_activity}   

Verify Message App Opened
    Wait Until Page Contains    Messages
    
Create New Conversation
    Wait Until Element Is Visible    xpath=${create_new_message}
    Click Element    xpath=${create_new_message}

Click Created Message By Number
    [Arguments]    ${num}
    Set Global Variable    ${NUMBER}    ${num}
    ${created_message_by_number} =    Get Message By Number    ${num}
    Wait Until Element Is Visible    xpath=${created_message_by_number}    timeout=10s
    Click Element    xpath=${created_message_by_number}

Verify Message Deleted
    ${created_message_by_number} =    Get Message By Number    ${NUMBER}
    Sleep    5s
    Page Should Not Contain Element    xpath=${created_message_by_number}