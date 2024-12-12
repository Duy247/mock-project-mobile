*** Settings ***
Library    JSONLibrary
Library    robot.utils

*** Keywords ***
Load Variable Data
    ${ABS_PATH} =     Abspath    test_data/test_data.json
    ${DATA}    Load Json From File    ${ABS_PATH}
    Set Suite Variable    ${CONTACT_NAME}    ${DATA}[name]
    Set Suite Variable    ${CONTACT_NUM}    ${DATA}[number]
    Set Suite Variable    ${SEND_MESSAGE}    ${DATA}[message]