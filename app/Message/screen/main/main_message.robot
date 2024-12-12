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
${MESSAGE_APP_PACKAGE}    com.samsung.android.messaging
${MESSAGE_APP_ACTIVITY}    com.android.mms.ui.ConversationComposer

*** Keywords ***
Go To Message App
    Open Application    ${APPIUM_URL}    platformName=${PLATFORM_NAME}    platformVersion=${PLATFORM_VERSION}    deviceName=${DEVICE_NAME}    
    ...    automationName=${ANDROID_AUTOMATION_NAME}    
    ...    appPackage=${MESSAGE_APP_PACKAGE}   appActivity=${MESSAGE_APP_ACTIVITY} 

Verify Message App Opened
    Wait Until Page Contains    Messages
    
Create New Conversation
    Wait Until Element Is Visible    ${create_new_message}
    Click Element    ${create_new_message}

Click Created Message By Number
    [Arguments]    ${num}
    Set Global Variable    ${NUMBER}    ${num}
    ${created_message_by_number} =    Get Message By Number    ${num}
    Wait Until Element Is Visible    ${created_message_by_number}    timeout=10s
    Click Element    ${created_message_by_number}

Verify Message Deleted
    ${created_message_by_number} =    Get Message By Number    ${NUMBER}
    Sleep    5s
    Page Should Not Contain Element    ${created_message_by_number}