*** Settings ***
Resource            ../../resources/automationKeywords.robot

Suite Setup         Scenario Setup    ${TESTDATA_FILENAME}
Suite Teardown      Scenario Teardown
Test Teardown       Run Keyword If Test Failed    TestCase Teardown    ${REQUEST_PAYLOAD}    ${RESPONSE_PAYLOAD}    ${RESPONSE_STATUS}


*** Variables ***
${RESOURCE}             pet
${TESTDATA_FILENAME}    ${RESOURCE}.csv


*** Test Cases ***
TC_PUT_pet_01
    ### Setup
    ${CASEDATA}    Test Setup
    ${REQUEST_PAYLOAD}    Set Variable    ${EMPTY}
    ${RESPONSE_PAYLOAD}    Set Variable    ${EMPTY}
    ${RESPONSE_STATUS}    Set Variable    ${EMPTY}
    ### Payload
    ${REQUEST_PAYLOAD}    Convert String to JSON    ${CASEDATA["Request Payload"]}
    ${SECS}    Get Time    epoch
    ${ID}    Convert To Integer    ${PET_02_ID}
    Update value to JSON    ${REQUEST_PAYLOAD}    $.id    ${ID}
    ${NAME}    Set Variable    NAME${SECS}
    Update value to JSON    ${REQUEST_PAYLOAD}    $.name    ${NAME}
    ${CATEGORY_ID}    Convert To Integer    101
    Update value to JSON    ${REQUEST_PAYLOAD}    $.category.id    ${CATEGORY_ID}
    ${CATEGORY_NAME}    Set Variable    NEW.CATEGORY.NAME
    Update value to JSON    ${REQUEST_PAYLOAD}    $.category.name    ${CATEGORY_NAME}
    ${PHOTOURLS}    Set Variable    https://abc/002
    Update value to JSON    ${REQUEST_PAYLOAD}    $.photoUrls[0]    ${PHOTOURLS}
    ${TAGS_ID}    Convert To Integer    201
    Update value to JSON    ${REQUEST_PAYLOAD}    $.tags[0].id    ${TAGS_ID}
    ${TAGS_NAME}    Set Variable    NEW.TAGS.NAME
    Update value to JSON    ${REQUEST_PAYLOAD}    $.tags[0].name    ${TAGS_NAME}
    ${STATUS}    Set Variable    pending
    Update value to JSON    ${REQUEST_PAYLOAD}    $.status    ${STATUS}
    ### Headers
    ${REQUEST_HEADERS}    Create Dictionary
    ${REQUEST_HEADERS}    Add To Headers    ${REQUEST_HEADERS}    Accept    application/json
    ${REQUEST_HEADERS}    Add To Headers    ${REQUEST_HEADERS}    Content-Type    application/json
    ### Request
    ${RESPONSE}    Put
    ...    ${BASE_URL}/${RESOURCE}
    ...    body=${REQUEST_PAYLOAD}
    ...    validate=True
    ...    headers=${REQUEST_HEADERS}
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
    ...    "${ID}"
    ...    "${PAYLOAD_VALUE}"
    ...    \nWARNING: Field validation failure
    ${PAYLOAD_VALUE}    Get value from Json    ${RESPONSE}    $.body.name
    Run Keyword And Warn On Failure
    ...    Should Be Equal As Strings
    ...    "${NAME}"
    ...    "${PAYLOAD_VALUE}"
    ...    \nWARNING: Field validation failure
    ${PAYLOAD_VALUE}    Get value from Json    ${RESPONSE}    $.body.category.id
    Run Keyword And Warn On Failure
    ...    Should Be Equal As Strings
    ...    "${CATEGORY_ID}"
    ...    "${PAYLOAD_VALUE}"
    ...    \nWARNING: Field validation failure
    ${PAYLOAD_VALUE}    Get value from Json    ${RESPONSE}    $.body.category.name
    Run Keyword And Warn On Failure
    ...    Should Be Equal As Strings
    ...    "${CATEGORY_NAME}"
    ...    "${PAYLOAD_VALUE}"
    ...    \nWARNING: Field validation failure
    ${PAYLOAD_VALUE}    Get value from Json    ${RESPONSE}    $.body.photoUrls[0]
    Run Keyword And Warn On Failure
    ...    Should Be Equal As Strings
    ...    "${PHOTOURLS}"
    ...    "${PAYLOAD_VALUE}"
    ...    \nWARNING: Field validation failure
    ${PAYLOAD_VALUE}    Get value from Json    ${RESPONSE}    $.body.tags[0].id
    Run Keyword And Warn On Failure
    ...    Should Be Equal As Strings
    ...    "${TAGS_ID}"
    ...    "${PAYLOAD_VALUE}"
    ...    \nWARNING: Field validation failure
    ${PAYLOAD_VALUE}    Get value from Json    ${RESPONSE}    $.body.tags[0].name
    Run Keyword And Warn On Failure
    ...    Should Be Equal As Strings
    ...    "${TAGS_NAME}"
    ...    "${PAYLOAD_VALUE}"
    ...    \nWARNING: Field validation failure
    ${PAYLOAD_VALUE}    Get value from Json    ${RESPONSE}    $.body.status
    Run Keyword And Warn On Failure
    ...    Should Be Equal As Strings
    ...    "${STATUS}"
    ...    "${PAYLOAD_VALUE}"
    ...    \nWARNING: Field validation failure

TC_PUT_pet_02
    ### Setup
    ${CASEDATA}    Test Setup
    ${REQUEST_PAYLOAD}    Set Variable    ${EMPTY}
    ${RESPONSE_PAYLOAD}    Set Variable    ${EMPTY}
    ${RESPONSE_STATUS}    Set Variable    ${EMPTY}
    ### Payload
    ${REQUEST_PAYLOAD}    Convert String to JSON    ${CASEDATA["Request Payload"]}
    ${SECS}    Get Time    epoch
    ${ID}    Convert To Integer    ${SECS}
    Update value to JSON    ${REQUEST_PAYLOAD}    $.id    ${ID}
    ${NAME}    Set Variable    NAME${SECS}
    Update value to JSON    ${REQUEST_PAYLOAD}    $.name    ${NAME}
    ${CATEGORY_ID}    Convert To Integer    101
    Update value to JSON    ${REQUEST_PAYLOAD}    $.category.id    ${CATEGORY_ID}
    ${CATEGORY_NAME}    Set Variable    NEW.CATEGORY.NAME
    Update value to JSON    ${REQUEST_PAYLOAD}    $.category.name    ${CATEGORY_NAME}
    ${PHOTOURLS}    Set Variable    https://abc/002
    Update value to JSON    ${REQUEST_PAYLOAD}    $.photoUrls[0]    ${PHOTOURLS}
    ${TAGS_ID}    Convert To Integer    201
    Update value to JSON    ${REQUEST_PAYLOAD}    $.tags[0].id    ${TAGS_ID}
    ${TAGS_NAME}    Set Variable    NEW.TAGS.NAME
    Update value to JSON    ${REQUEST_PAYLOAD}    $.tags[0].name    ${TAGS_NAME}
    ${STATUS}    Set Variable    pending
    Update value to JSON    ${REQUEST_PAYLOAD}    $.status    ${STATUS}
    ### Headers
    ${REQUEST_HEADERS}    Create Dictionary
    ${REQUEST_HEADERS}    Add To Headers    ${REQUEST_HEADERS}    Accept    application/json
    ${REQUEST_HEADERS}    Add To Headers    ${REQUEST_HEADERS}    Content-Type    application/json
    ### Request
    ${RESPONSE}    Put
    ...    ${BASE_URL}/${RESOURCE}
    ...    body=${REQUEST_PAYLOAD}
    ...    validate=True
    ...    headers=${REQUEST_HEADERS}
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
    ...    "${ID}"
    ...    "${PAYLOAD_VALUE}"
    ...    \nWARNING: Field validation failure
    ${PAYLOAD_VALUE}    Get value from Json    ${RESPONSE}    $.body.name
    Run Keyword And Warn On Failure
    ...    Should Be Equal As Strings
    ...    "${NAME}"
    ...    "${PAYLOAD_VALUE}"
    ...    \nWARNING: Field validation failure
    ${PAYLOAD_VALUE}    Get value from Json    ${RESPONSE}    $.body.category.id
    Run Keyword And Warn On Failure
    ...    Should Be Equal As Strings
    ...    "${CATEGORY_ID}"
    ...    "${PAYLOAD_VALUE}"
    ...    \nWARNING: Field validation failure
    ${PAYLOAD_VALUE}    Get value from Json    ${RESPONSE}    $.body.category.name
    Run Keyword And Warn On Failure
    ...    Should Be Equal As Strings
    ...    "${CATEGORY_NAME}"
    ...    "${PAYLOAD_VALUE}"
    ...    \nWARNING: Field validation failure
    ${PAYLOAD_VALUE}    Get value from Json    ${RESPONSE}    $.body.photoUrls[0]
    Run Keyword And Warn On Failure
    ...    Should Be Equal As Strings
    ...    "${PHOTOURLS}"
    ...    "${PAYLOAD_VALUE}"
    ...    \nWARNING: Field validation failure
    ${PAYLOAD_VALUE}    Get value from Json    ${RESPONSE}    $.body.tags[0].id
    Run Keyword And Warn On Failure
    ...    Should Be Equal As Strings
    ...    "${TAGS_ID}"
    ...    "${PAYLOAD_VALUE}"
    ...    \nWARNING: Field validation failure
    ${PAYLOAD_VALUE}    Get value from Json    ${RESPONSE}    $.body.tags[0].name
    Run Keyword And Warn On Failure
    ...    Should Be Equal As Strings
    ...    "${TAGS_NAME}"
    ...    "${PAYLOAD_VALUE}"
    ...    \nWARNING: Field validation failure
    ${PAYLOAD_VALUE}    Get value from Json    ${RESPONSE}    $.body.status
    Run Keyword And Warn On Failure
    ...    Should Be Equal As Strings
    ...    "${STATUS}"
    ...    "${PAYLOAD_VALUE}"
    ...    \nWARNING: Field validation failure

TC_PUT_pet_03
    ### Setup
    ${CASEDATA}    Test Setup
    ${REQUEST_PAYLOAD}    Set Variable    ${EMPTY}
    ${RESPONSE_PAYLOAD}    Set Variable    ${EMPTY}
    ${RESPONSE_STATUS}    Set Variable    ${EMPTY}
    ### Payload
    ${REQUEST_PAYLOAD}    Convert String to JSON    ${CASEDATA["Request Payload"]}
    ### Headers
    ${REQUEST_HEADERS}    Create Dictionary
    ${REQUEST_HEADERS}    Add To Headers    ${REQUEST_HEADERS}    Accept    application/json
    ${REQUEST_HEADERS}    Add To Headers    ${REQUEST_HEADERS}    Content-Type    application/json
    ### Request
    ${RESPONSE}    Put
    ...    ${BASE_URL}/${RESOURCE}
    ...    body=${REQUEST_PAYLOAD}
    ...    validate=True
    ...    headers=${REQUEST_HEADERS}
    ${RESPONSE_PAYLOAD}    Get value from JSON    ${RESPONSE}    $.body
    ${RESPONSE_STATUS}    Get value from Json    ${RESPONSE}    $.status
    ### Validate
    Should Be Equal As Strings
    ...    "${CASEDATA["ExpectedHTTPResponseStatusCode"]}"
    ...    "${RESPONSE_STATUS}"
    ...    \nERROR: Status Code is missing or incorrect

TC_PUT_pet_04
    ### Setup
    ${CASEDATA}    Test Setup
    ${REQUEST_PAYLOAD}    Set Variable    ${EMPTY}
    ${RESPONSE_PAYLOAD}    Set Variable    ${EMPTY}
    ${RESPONSE_STATUS}    Set Variable    ${EMPTY}
    ### Payload
    ${REQUEST_PAYLOAD}    Convert String to JSON    ${CASEDATA["Request Payload"]}
    ### Headers
    ${REQUEST_HEADERS}    Create Dictionary
    ${REQUEST_HEADERS}    Add To Headers    ${REQUEST_HEADERS}    Accept    application/json
    ${REQUEST_HEADERS}    Add To Headers    ${REQUEST_HEADERS}    Content-Type    application/json
    ### Request
    ${RESPONSE}    Put
    ...    ${BASE_URL}/${RESOURCE}
    ...    body=${REQUEST_PAYLOAD}
    ...    validate=True
    ...    headers=${REQUEST_HEADERS}
    ${RESPONSE_PAYLOAD}    Get value from JSON    ${RESPONSE}    $.body
    ${RESPONSE_STATUS}    Get value from Json    ${RESPONSE}    $.status
    ### Validate
    Should Be Equal As Strings
    ...    "${CASEDATA["ExpectedHTTPResponseStatusCode"]}"
    ...    "${RESPONSE_STATUS}"
    ...    \nERROR: Status Code is missing or incorrect

TC_PUT_pet_05
    ### Setup
    ${CASEDATA}    Test Setup
    ${REQUEST_PAYLOAD}    Set Variable    ${EMPTY}
    ${RESPONSE_PAYLOAD}    Set Variable    ${EMPTY}
    ${RESPONSE_STATUS}    Set Variable    ${EMPTY}
    ### Payload
    ${REQUEST_PAYLOAD}    Convert String to JSON    ${CASEDATA["Request Payload"]}
    ### Headers
    ${REQUEST_HEADERS}    Create Dictionary
    ${REQUEST_HEADERS}    Add To Headers    ${REQUEST_HEADERS}    Accept    application/json
    ${REQUEST_HEADERS}    Add To Headers    ${REQUEST_HEADERS}    Content-Type    application/json
    ### Request
    ${RESPONSE}    Put
    ...    ${BASE_URL}/${RESOURCE}
    ...    body=${REQUEST_PAYLOAD}
    ...    validate=True
    ...    headers=${REQUEST_HEADERS}
    ${RESPONSE_PAYLOAD}    Get value from JSON    ${RESPONSE}    $.body
    ${RESPONSE_STATUS}    Get value from Json    ${RESPONSE}    $.status
    ### Validate
    Should Be Equal As Strings
    ...    "${CASEDATA["ExpectedHTTPResponseStatusCode"]}"
    ...    "${RESPONSE_STATUS}"
    ...    \nERROR: Status Code is missing or incorrect

TC_PUT_pet_06
    ### Setup
    ${CASEDATA}    Test Setup
    ${REQUEST_PAYLOAD}    Set Variable    ${EMPTY}
    ${RESPONSE_PAYLOAD}    Set Variable    ${EMPTY}
    ${RESPONSE_STATUS}    Set Variable    ${EMPTY}
    ### Headers
    ${REQUEST_HEADERS}    Create Dictionary
    ${REQUEST_HEADERS}    Add To Headers    ${REQUEST_HEADERS}    Accept    application/json
    ${REQUEST_HEADERS}    Add To Headers    ${REQUEST_HEADERS}    Content-Type    application/json
    ### Request
    ${RESPONSE}    Put    ${BASE_URL}/${RESOURCE}    validate=True    headers=${REQUEST_HEADERS}
    ${RESPONSE_PAYLOAD}    Get value from JSON    ${RESPONSE}    $.body
    ${RESPONSE_STATUS}    Get value from Json    ${RESPONSE}    $.status
    ### Validate
    Should Be Equal As Strings
    ...    "${CASEDATA["ExpectedHTTPResponseStatusCode"]}"
    ...    "${RESPONSE_STATUS}"
    ...    \nERROR: Status Code is missing or incorrect
