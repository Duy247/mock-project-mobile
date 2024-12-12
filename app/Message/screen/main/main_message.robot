*** Settings ***                                                
Library    AppiumLibrary
Variables    ../../locator/main/main_message_loc.py
Library    ../../utils/main/main_message_utils.py

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
    ${formatted_number} =    Format Number    ${num}    
    ${created_message_loc}    Set Variable    //*[@content-desc='${formatted_number}']
    Set Global Variable    ${CREATED_MESSAGE_LOC}    ${created_message_loc}
    Wait Until Element Is Visible    ${created_message_loc}    timeout=10s
    Click Element    ${created_message_loc}

Verify Message Deleted
    Sleep    5s
    Page Should Not Contain Element    ${CREATED_MESSAGE_LOC}