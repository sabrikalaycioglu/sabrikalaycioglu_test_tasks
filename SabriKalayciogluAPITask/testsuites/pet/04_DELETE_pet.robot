*** Settings ***
Resource            ../../resources/automationKeywords.robot

Suite Setup         Scenario Setup    ${TESTDATA_FILENAME}
Suite Teardown      Scenario Teardown
Test Teardown       Run Keyword If Test Failed    TestCase Teardown    ${REQUEST_PAYLOAD}    ${RESPONSE_PAYLOAD}    ${RESPONSE_STATUS}


*** Variables ***
${RESOURCE}             pet
${TESTDATA_FILENAME}    ${RESOURCE}.csv


*** Test Cases ***
TC_DELETE_pet_01
    ### Setup
    ${CASEDATA}    Test Setup
    ${REQUEST_PAYLOAD}    Set Variable    ${EMPTY}
    ${RESPONSE_PAYLOAD}    Set Variable    ${EMPTY}
    ${RESPONSE_STATUS}    Set Variable    ${EMPTY}
    ### Request
    ${RESPONSE}    Delete    ${BASE_URL}/${RESOURCE}/${PET_01_ID}    validate=True
    ${RESPONSE_STATUS}    Get value from Json    ${RESPONSE}    $.status
    ### Validate
    Should Be Equal As Strings
    ...    "${CASEDATA["ExpectedHTTPResponseStatusCode"]}"
    ...    "${RESPONSE_STATUS}"
    ...    \nERROR: Status Code is missing or incorrect

TC_DELETE_pet_02
    ### Setup
    ${CASEDATA}    Test Setup
    ${REQUEST_PAYLOAD}    Set Variable    ${EMPTY}
    ${RESPONSE_PAYLOAD}    Set Variable    ${EMPTY}
    ${RESPONSE_STATUS}    Set Variable    ${EMPTY}
    ### Request
    ${NON_EXISTING_ID}    Generate UUID
    ${RESPONSE}    Delete    ${BASE_URL}/${RESOURCE}/${NON_EXISTING_ID}    validate=True
    ${RESPONSE_STATUS}    Get value from Json    ${RESPONSE}    $.status
    ### Validate
    Should Be Equal As Strings
    ...    "${CASEDATA["ExpectedHTTPResponseStatusCode"]}"
    ...    "${RESPONSE_STATUS}"
    ...    \nERROR: Status Code is missing or incorrect
