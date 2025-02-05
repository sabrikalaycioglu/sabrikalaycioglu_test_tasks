*** Settings ***
Resource            ../../resources/automationKeywords.robot

Suite Setup         Scenario Setup    ${TESTDATA_FILENAME}
Suite Teardown      Scenario Teardown
Test Teardown       Run Keyword If Test Failed    TestCase Teardown    ${REQUEST_PAYLOAD}    ${RESPONSE_PAYLOAD}    ${RESPONSE_STATUS}


*** Variables ***
${RESOURCE}             store
${TESTDATA_FILENAME}    ${RESOURCE}.csv


*** Test Cases ***
TC_POST_store_01
    ### Setup
    ${CASEDATA}    Test Setup
    ${REQUEST_PAYLOAD}    Set Variable    ${EMPTY}
    ${RESPONSE_PAYLOAD}    Set Variable    ${EMPTY}
    ${RESPONSE_STATUS}    Set Variable    ${EMPTY}
    ### Payload
    ${REQUEST_PAYLOAD}    Convert String to JSON    ${CASEDATA["Request Payload"]}
    ${SECS}    Get Time    epoch
    ${ID}    Set Variable    ${SECS}
    Update value to JSON    ${REQUEST_PAYLOAD}    $.id    ${ID}
    Set Global Variable    ${ORDER_01_ID}    ${ID}
    ${PETID}    Convert To Integer    100
    Update value to JSON    ${REQUEST_PAYLOAD}    $.petId    ${PETID}
    Set Global Variable    ${ORDER_01_PETID}    ${PETID}
    ${QUANTITY}    Convert To Integer    5
    Update value to JSON    ${REQUEST_PAYLOAD}    $.quantity    ${QUANTITY}
    Set Global Variable    ${ORDER_01_QUANTITY}    ${QUANTITY}
    ${SHIPDATE}    Set Variable    2025-02-03T19:45:05.865Z
    Update value to JSON    ${REQUEST_PAYLOAD}    $.shipDate    ${SHIPDATE}
    ${SHIPDATE}    Get Substring    ${SHIPDATE}    0    23
    Set Global Variable    ${ORDER_01_SHIPDATE}    ${SHIPDATE}
    ${STATUS}    Set Variable    placed
    Update value to JSON    ${REQUEST_PAYLOAD}    $.status    ${STATUS}
    Set Global Variable    ${ORDER_01_STATUS}    ${STATUS}
    ${COMPLETE}    Set Variable    ${True}
    Update value to JSON    ${REQUEST_PAYLOAD}    $.complete    ${COMPLETE}
    Set Global Variable    ${ORDER_01_COMPLETE}    ${COMPLETE}
    ### Headers
    ${REQUEST_HEADERS}    Create Dictionary
    ${REQUEST_HEADERS}    Add To Headers    ${REQUEST_HEADERS}    Accept    application/json
    ${REQUEST_HEADERS}    Add To Headers    ${REQUEST_HEADERS}    Content-Type    application/json
    ### Request
    ${RESPONSE}    Post
    ...    ${BASE_URL}/${RESOURCE}/order
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
    ${PAYLOAD_VALUE}    Get value from Json    ${RESPONSE}    $.body.petId
    Run Keyword And Warn On Failure
    ...    Should Be Equal As Strings
    ...    "${PETID}"
    ...    "${PAYLOAD_VALUE}"
    ...    \nWARNING: Field validation failure
    ${PAYLOAD_VALUE}    Get value from Json    ${RESPONSE}    $.body.quantity
    Run Keyword And Warn On Failure
    ...    Should Be Equal As Strings
    ...    "${QUANTITY}"
    ...    "${PAYLOAD_VALUE}"
    ...    \nWARNING: Field validation failure
    ${PAYLOAD_VALUE}    Get value from Json    ${RESPONSE}    $.body.shipDate
    ${PAYLOAD_VALUE}    Get Substring    ${PAYLOAD_VALUE}    0    23
    Run Keyword And Warn On Failure
    ...    Should Be Equal As Strings
    ...    "${SHIPDATE}"
    ...    "${PAYLOAD_VALUE}"
    ...    \nWARNING: Field validation failure
    ${PAYLOAD_VALUE}    Get value from Json    ${RESPONSE}    $.body.status
    Run Keyword And Warn On Failure
    ...    Should Be Equal As Strings
    ...    "${STATUS}"
    ...    "${PAYLOAD_VALUE}"
    ...    \nWARNING: Field validation failure
    ${PAYLOAD_VALUE}    Get value from Json    ${RESPONSE}    $.body.complete
    Run Keyword And Warn On Failure
    ...    Should Be Equal
    ...    "${COMPLETE}"
    ...    "${PAYLOAD_VALUE}"
    ...    \nWARNING: Field validation failure

TC_POST_store_02
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
    ${RESPONSE}    Post
    ...    ${BASE_URL}/${RESOURCE}/order
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
    ${ID}    Get value from Json    ${RESPONSE}    $.body.id
    Run Keyword And Warn On Failure
    ...    Should Not Be Equal As Strings
    ...    "${None}"
    ...    "${ID}"
    ...    \nERROR: ID is missing in response payload
    Set Global Variable    ${ORDER_02_ID}    ${ID}

TC_POST_store_03
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
    ${RESPONSE}    Post
    ...    ${BASE_URL}/${RESOURCE}/order
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

TC_POST_store_04
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
    ${RESPONSE}    Post
    ...    ${BASE_URL}/${RESOURCE}/order
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

TC_POST_store_05
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
    ${RESPONSE}    Post
    ...    ${BASE_URL}/${RESOURCE}/order
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

TC_POST_store_06
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
    ${RESPONSE}    Post
    ...    ${BASE_URL}/${RESOURCE}/order
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

TC_POST_store_07
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
    ${RESPONSE}    Post    ${BASE_URL}/${RESOURCE}/order    validate=True    headers=${REQUEST_HEADERS}
    ${RESPONSE_PAYLOAD}    Get value from JSON    ${RESPONSE}    $.body
    ${RESPONSE_STATUS}    Get value from Json    ${RESPONSE}    $.status
    ### Validate
    Should Be Equal As Strings
    ...    "${CASEDATA["ExpectedHTTPResponseStatusCode"]}"
    ...    "${RESPONSE_STATUS}"
    ...    \nERROR: Status Code is missing or incorrect
