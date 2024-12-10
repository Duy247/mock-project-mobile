*** Settings ***                                                                            
Library           AppiumLibrary
Variables          ../../locator/main/main_loc.py

*** Variables ***
${APPIUM_URL}    http://127.0.0.1:4723
${PLATFORM_NAME}    Android
${PLATFORM_VERSION}    9
${DEVICE_NAME}    32006e3ac01f9573
${ANDROID_AUTOMATION_NAME}    UiAutomator2

*** Keywords ***
Open Contact App
    Open Application    ${APPIUM_URL}    platformName=${PLATFORM_NAME}    platformVersion=${PLATFORM_VERSION}    deviceName=${DEVICE_NAME}    
    ...    automationName=${ANDROID_AUTOMATION_NAME}    
    ...    appPackage=${CONTACT_APP_PACKAGE}    appActivity=${CONTACT_APP_ACTIVITY}   

Click First Contact
    Wait Until Page Contains Element    xpath=${first_contact}
    Click Element    xpath=${first_contact}
    
Verify Contact Deleted
    Page Should Not Contain Element    xpath=${first_contact}