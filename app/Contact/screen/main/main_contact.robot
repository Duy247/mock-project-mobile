*** Settings ***                                                                            
Library    AppiumLibrary
Variables    ../../locator/main/main_contact_loc.py

*** Variables ***
${APPIUM_URL}    http://127.0.0.1:4723
${PLATFORM_NAME}    Android
${PLATFORM_VERSION}    9
${DEVICE_NAME}    32006e3ac01f9573
${ANDROID_AUTOMATION_NAME}    UiAutomator2
${CONTACT_APP_PACKAGE}    com.samsung.android.contacts
${CONTACT_APP_ACTIVITY}    .contactslist.PeopleActivity

*** Keywords ***
Go To Contact App
    Open Application    ${APPIUM_URL}    platformName=${PLATFORM_NAME}    platformVersion=${PLATFORM_VERSION}    deviceName=${DEVICE_NAME}    
    ...    automationName=${ANDROID_AUTOMATION_NAME}    
    ...    appPackage=${CONTACT_APP_PACKAGE}     appActivity=${CONTACT_APP_ACTIVITY}   

Verify Contact App Opened
    Wait Until Page Contains    contact

Click Add Contact
    Wait Until Element Is Visible    ${add_contact_button}    timeout=10s
    Click Element    ${add_contact_button}

Click Save To Phone
    Wait Until Element Is Visible    ${save_to_phone}    timeout=10s
    Click Element    ${save_to_phone}
    Wait Until Element Is Visible    ${set_save_button}    timeout=10s
    Click Element    ${set_save_button}

Click Created Contact
    [Arguments]    ${contact}
    Set Global Variable    ${CONTACT_NAME}    ${contact}
    ${created_contact}    Set Variable    //*[@content-desc='${contact}']   
    Wait Until Element Is Visible    ${created_contact}    timeout=10s
    Click Element    ${created_contact}
    
Verify Contact Deleted
    ${created_contact}    Set Variable    //*[@content-desc='${CONTACT_NAME}']
    Page Should Not Contain Element    ${created_contact}

