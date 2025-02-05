*** Settings ***
Resource            ../../resources/automationKeywords.robot

Suite Setup         Scenario Setup    ${TESTDATA_FILENAME}
Suite Teardown      Scenario Teardown
Test Teardown       Run Keyword If Test Failed    TestCase Teardown    ${REQUEST_PAYLOAD}    ${RESPONSE_PAYLOAD}    ${RESPONSE_STATUS}


*** Variables ***
${RESOURCE}             pet
${TESTDATA_FILENAME}    ${RESOURCE}.csv


*** Test Cases ***
TC_GET_pet_01
    ### Setup
    ${CASEDATA}    Test Setup
    ${REQUEST_PAYLOAD}    Set Variable    ${EMPTY}
    ${RESPONSE_PAYLOAD}    Set Variable    ${EMPTY}
    ${RESPONSE_STATUS}    Set Variable    ${EMPTY}
    ### Headers
    ${REQUEST_HEADERS}    Create Dictionary
    ${REQUEST_HEADERS}    Add To Headers    ${REQUEST_HEADERS}    Accept    application/json
    ### Request
    ${RESPONSE}    Get    ${BASE_URL}/${RESOURCE}/${PET_01_ID}    validate=True    headers=${REQUEST_HEADERS}
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
    ...    "${PET_01_ID}"
    ...    "${PAYLOAD_VALUE}"
    ...    \nWARNING: Field validation failure
    ${PAYLOAD_VALUE}    Get value from Json    ${RESPONSE}    $.body.name
    Run Keyword And Warn On Failure
    ...    Should Be Equal As Strings
    ...    "${PET_01_NAME}"
    ...    "${PAYLOAD_VALUE}"
    ...    \nWARNING: Field validation failure
    ${PAYLOAD_VALUE}    Get value from Json    ${RESPONSE}    $.body.category.id
    Run Keyword And Warn On Failure
    ...    Should Be Equal As Strings
    ...    "${PET_01_CATEGORY_ID}"
    ...    "${PAYLOAD_VALUE}"
    ...    \nWARNING: Field validation failure
    ${PAYLOAD_VALUE}    Get value from Json    ${RESPONSE}    $.body.category.name
    Run Keyword And Warn On Failure
    ...    Should Be Equal As Strings
    ...    "${PET_01_CATEGORY_NAME}"
    ...    "${PAYLOAD_VALUE}"
    ...    \nWARNING: Field validation failure
    ${PAYLOAD_VALUE}    Get value from Json    ${RESPONSE}    $.body.photoUrls[0]
    Run Keyword And Warn On Failure
    ...    Should Be Equal As Strings
    ...    "${PET_01_PHOTOURLS}"
    ...    "${PAYLOAD_VALUE}"
    ...    \nWARNING: Field validation failure
    ${PAYLOAD_VALUE}    Get value from Json    ${RESPONSE}    $.body.tags[0].id
    Run Keyword And Warn On Failure
    ...    Should Be Equal As Strings
    ...    "${PET_01_TAGS_ID}"
    ...    "${PAYLOAD_VALUE}"
    ...    \nWARNING: Field validation failure
    ${PAYLOAD_VALUE}    Get value from Json    ${RESPONSE}    $.body.tags[0].name
    Run Keyword And Warn On Failure
    ...    Should Be Equal As Strings
    ...    "${PET_01_TAGS_NAME}"
    ...    "${PAYLOAD_VALUE}"
    ...    \nWARNING: Field validation failure
    ${PAYLOAD_VALUE}    Get value from Json    ${RESPONSE}    $.body.status
    Run Keyword And Warn On Failure
    ...    Should Be Equal As Strings
    ...    "${PET_01_STATUS}"
    ...    "${PAYLOAD_VALUE}"
    ...    \nWARNING: Field validation failure

TC_GET_pet_02
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
    ${RESPONSE}    Get    ${BASE_URL}/${RESOURCE}/${NON_EXISTING_ID}    validate=True    headers=${REQUEST_HEADERS}
    ${RESPONSE_PAYLOAD}    Get value from JSON    ${RESPONSE}    $.body
    ${RESPONSE_STATUS}    Get value from Json    ${RESPONSE}    $.status
    ### Validate
    Should Be Equal As Strings
    ...    "${CASEDATA["ExpectedHTTPResponseStatusCode"]}"
    ...    "${RESPONSE_STATUS}"
    ...    \nERROR: Status Code is missing or incorrect

TC_GET_pet_03
    ### Setup
    ${CASEDATA}    Test Setup
    ${REQUEST_PAYLOAD}    Set Variable    ${EMPTY}
    ${RESPONSE_PAYLOAD}    Set Variable    ${EMPTY}
    ${RESPONSE_STATUS}    Set Variable    ${EMPTY}
    ### Headers
    ${REQUEST_HEADERS}    Create Dictionary
    ${REQUEST_HEADERS}    Add To Headers    ${REQUEST_HEADERS}    Accept    application/json
    ### Request
    ${RESPONSE}    Get
    ...    ${BASE_URL}/${RESOURCE}/findByStatus?status=pending
    ...    validate=True
    ...    headers=${REQUEST_HEADERS}
    ${RESPONSE_PAYLOAD}    Get value from JSON    ${RESPONSE}    $.body
    ${RESPONSE_STATUS}    Get value from Json    ${RESPONSE}    $.status
    ### Validate
    Should Be Equal As Strings
    ...    "${CASEDATA["ExpectedHTTPResponseStatusCode"]}"
    ...    "${RESPONSE_STATUS}"
    ...    \nERROR: Status Code is missing or incorrect
    ${PAYLOAD_VALUE}    Get value from Json    ${RESPONSE}    $.body[0].status
    Should Be Equal As Strings    "pending"    "${PAYLOAD_VALUE}"
    # TO-DO
    # check the status of all the pets in response !

TC_GET_pet_04
    ### Setup
    ${CASEDATA}    Test Setup
    ${REQUEST_PAYLOAD}    Set Variable    ${EMPTY}
    ${RESPONSE_PAYLOAD}    Set Variable    ${EMPTY}
    ${RESPONSE_STATUS}    Set Variable    ${EMPTY}
    ### Headers
    ${REQUEST_HEADERS}    Create Dictionary
    ${REQUEST_HEADERS}    Add To Headers    ${REQUEST_HEADERS}    Accept    application/json
    ### Request
    ${STATUS}    Generate UUID
    ${RESPONSE}    Get
    ...    ${BASE_URL}/${RESOURCE}/findByStatus?status=${STATUS}
    ...    validate=True
    ...    headers=${REQUEST_HEADERS}
    ${RESPONSE_PAYLOAD}    Get value from JSON    ${RESPONSE}    $.body
    ${RESPONSE_STATUS}    Get value from Json    ${RESPONSE}    $.status
    ### Validate
    Should Be Equal As Strings
    ...    "${CASEDATA["ExpectedHTTPResponseStatusCode"]}"
    ...    "${RESPONSE_STATUS}"
    ...    \nERROR: Status Code is missing or incorrect
    ${BODY}    Get value from JSON    ${RESPONSE}    $.body
    Should Be Equal As Strings    "[]"    "${BODY}"
