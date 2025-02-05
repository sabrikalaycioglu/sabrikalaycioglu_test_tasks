*** Settings ***
Resource            ../../resources/automationKeywords.robot

Suite Setup         Scenario Setup    ${TESTDATA_FILENAME}
Suite Teardown      Scenario Teardown
Test Teardown       Run Keyword If Test Failed    TestCase Teardown    ${REQUEST_PAYLOAD}    ${RESPONSE_PAYLOAD}    ${RESPONSE_STATUS}


*** Variables ***
${RESOURCE}             store
${TESTDATA_FILENAME}    ${RESOURCE}.csv


*** Test Cases ***
TC_GET_store_01
    ### Setup
    ${CASEDATA}    Test Setup
    ${REQUEST_PAYLOAD}    Set Variable    ${EMPTY}
    ${RESPONSE_PAYLOAD}    Set Variable    ${EMPTY}
    ${RESPONSE_STATUS}    Set Variable    ${EMPTY}
    ### Headers
    ${REQUEST_HEADERS}    Create Dictionary
    ${REQUEST_HEADERS}    Add To Headers    ${REQUEST_HEADERS}    Accept    application/json
    ### Request
    ${RESPONSE}    Get    ${BASE_URL}/${RESOURCE}/order/${ORDER_01_ID}    validate=True    headers=${REQUEST_HEADERS}
    ${RESPONSE_PAYLOAD}    Get value from JSON    ${RESPONSE}    $.body
    ${RESPONSE_STATUS}    Get value from Json    ${RESPONSE}    $.status
    ### Validate
    Should Be Equal As Strings
    ...    "${CASEDATA["ExpectedHTTPResponseStatusCode"]}"
    ...    "${RESPONSE_STATUS}"
    ...    \nERROR: Status Code is missing or incorrect
    ${PAYLOAD_VALUE}    Get value from Json    ${RESPONSE}    $.body.id
    Run Keyword And Warn On Failure
    ...    Should Be Equal As Strings
    ...    "${ORDER_01_ID}"
    ...    "${PAYLOAD_VALUE}"
    ...    \nWARNING: Field validation failure
    ${PAYLOAD_VALUE}    Get value from Json    ${RESPONSE}    $.body.petId
    Run Keyword And Warn On Failure
    ...    Should Be Equal As Strings
    ...    "${ORDER_01_PETID}"
    ...    "${PAYLOAD_VALUE}"
    ...    \nWARNING: Field validation failure
    ${PAYLOAD_VALUE}    Get value from Json    ${RESPONSE}    $.body.quantity
    Run Keyword And Warn On Failure
    ...    Should Be Equal As Strings
    ...    "${ORDER_01_QUANTITY}"
    ...    "${PAYLOAD_VALUE}"
    ...    \nWARNING: Field validation failure
    ${PAYLOAD_VALUE}    Get value from Json    ${RESPONSE}    $.body.shipDate
    ${PAYLOAD_VALUE}    Get Substring    ${PAYLOAD_VALUE}    0    23
    Run Keyword And Warn On Failure
    ...    Should Be Equal As Strings
    ...    "${ORDER_01_SHIPDATE}"
    ...    "${PAYLOAD_VALUE}"
    ...    \nWARNING: Field validation failure
    ${PAYLOAD_VALUE}    Get value from Json    ${RESPONSE}    $.body.status
    Run Keyword And Warn On Failure
    ...    Should Be Equal As Strings
    ...    "${ORDER_01_STATUS}"
    ...    "${PAYLOAD_VALUE}"
    ...    \nWARNING: Field validation failure
    ${PAYLOAD_VALUE}    Get value from Json    ${RESPONSE}    $.body.complete
    Run Keyword And Warn On Failure
    ...    Should Be Equal
    ...    "${ORDER_01_COMPLETE}"
    ...    "${PAYLOAD_VALUE}"
    ...    \nWARNING: Field validation failure

TC_GET_store_02
    ### Setup
    ${CASEDATA}    Test Setup
    ${REQUEST_PAYLOAD}    Set Variable    ${EMPTY}
    ${RESPONSE_PAYLOAD}    Set Variable    ${EMPTY}
    ${RESPONSE_STATUS}    Set Variable    ${EMPTY}
    ### Headers
    ${REQUEST_HEADERS}    Create Dictionary
    ${REQUEST_HEADERS}    Add To Headers    ${REQUEST_HEADERS}    Accept    application/json
    ### Request
    ${NON_EXISTING_ID}    Generate UUID
    ${RESPONSE}    Get
    ...    ${BASE_URL}/${RESOURCE}/order/${NON_EXISTING_ID}
    ...    validate=True
    ...    headers=${REQUEST_HEADERS}
    ${RESPONSE_PAYLOAD}    Get value from JSON    ${RESPONSE}    $.body
    ${RESPONSE_STATUS}    Get value from Json    ${RESPONSE}    $.status
    ### Validate
    Should Be Equal As Strings
    ...    "${CASEDATA["ExpectedHTTPResponseStatusCode"]}"
    ...    "${RESPONSE_STATUS}"
    ...    \nERROR: Status Code is missing or incorrect

TC_GET_store_03
    ### Setup
    ${CASEDATA}    Test Setup
    ${REQUEST_PAYLOAD}    Set Variable    ${EMPTY}
    ${RESPONSE_PAYLOAD}    Set Variable    ${EMPTY}
    ${RESPONSE_STATUS}    Set Variable    ${EMPTY}
    ### Headers
    ${REQUEST_HEADERS}    Create Dictionary
    ${REQUEST_HEADERS}    Add To Headers    ${REQUEST_HEADERS}    Accept    application/json
    ### Request
    ${RESPONSE}    Get    ${BASE_URL}/${RESOURCE}/inventory    validate=True    headers=${REQUEST_HEADERS}
    ${RESPONSE_PAYLOAD}    Get value from JSON    ${RESPONSE}    $.body
    ${RESPONSE_STATUS}    Get value from Json    ${RESPONSE}    $.status
    ### Validate
    Should Be Equal As Strings
    ...    "${CASEDATA["ExpectedHTTPResponseStatusCode"]}"
    ...    "${RESPONSE_STATUS}"
    ...    \nERROR: Status Code is missing or incorrect
