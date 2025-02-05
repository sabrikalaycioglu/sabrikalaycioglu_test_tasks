*** Settings ***
Resource            ../../resources/automationKeywords.robot

Suite Setup         Scenario Setup    ${TESTDATA_FILENAME}
Suite Teardown      Scenario Teardown
Test Teardown       Run Keyword If Test Failed    TestCase Teardown    ${REQUEST_PAYLOAD}    ${RESPONSE_PAYLOAD}    ${RESPONSE_STATUS}


*** Variables ***
${RESOURCE}             user
${TESTDATA_FILENAME}    ${RESOURCE}.csv


*** Test Cases ***
TC_GET_user_01
    ### Setup
    ${CASEDATA}    Test Setup
    ${REQUEST_PAYLOAD}    Set Variable    ${EMPTY}
    ${RESPONSE_PAYLOAD}    Set Variable    ${EMPTY}
    ${RESPONSE_STATUS}    Set Variable    ${EMPTY}
    ### Headers
    ${REQUEST_HEADERS}    Create Dictionary
    ${REQUEST_HEADERS}    Add To Headers    ${REQUEST_HEADERS}    Accept    application/json
    ### Request
    ${RESPONSE}    Get    ${BASE_URL}/${RESOURCE}/${USER_01_USERNAME}    validate=True    headers=${REQUEST_HEADERS}
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
    ...    "${USER_01_ID}"
    ...    "${PAYLOAD_VALUE}"
    ...    \nWARNING: Field validation failure
    ${PAYLOAD_VALUE}    Get value from Json    ${RESPONSE}    $.body.username
    Run Keyword And Warn On Failure
    ...    Should Be Equal As Strings
    ...    "${USER_01_USERNAME}"
    ...    "${PAYLOAD_VALUE}"
    ...    \nWARNING: Field validation failure
    ${PAYLOAD_VALUE}    Get value from Json    ${RESPONSE}    $.body.firstName
    Run Keyword And Warn On Failure
    ...    Should Be Equal As Strings
    ...    "${USER_01_FIRSTNAME}"
    ...    "${PAYLOAD_VALUE}"
    ...    \nWARNING: Field validation failure
    ${PAYLOAD_VALUE}    Get value from Json    ${RESPONSE}    $.body.lastName
    Run Keyword And Warn On Failure
    ...    Should Be Equal As Strings
    ...    "${USER_01_LASTNAME}"
    ...    "${PAYLOAD_VALUE}"
    ...    \nWARNING: Field validation failure
    ${PAYLOAD_VALUE}    Get value from Json    ${RESPONSE}    $.body.email
    Run Keyword And Warn On Failure
    ...    Should Be Equal As Strings
    ...    "${USER_01_EMAIL}"
    ...    "${PAYLOAD_VALUE}"
    ...    \nWARNING: Field validation failure
    ${PAYLOAD_VALUE}    Get value from Json    ${RESPONSE}    $.body.password
    Run Keyword And Warn On Failure
    ...    Should Be Equal As Strings
    ...    "${USER_01_PASSWORD}"
    ...    "${PAYLOAD_VALUE}"
    ...    \nWARNING: Field validation failure
    ${PAYLOAD_VALUE}    Get value from Json    ${RESPONSE}    $.body.phone
    Run Keyword And Warn On Failure
    ...    Should Be Equal As Strings
    ...    "${USER_01_PHONE}"
    ...    "${PAYLOAD_VALUE}"
    ...    \nWARNING: Field validation failure
    ${PAYLOAD_VALUE}    Get value from Json    ${RESPONSE}    $.body.userStatus
    Run Keyword And Warn On Failure
    ...    Should Be Equal As Strings
    ...    "${USER_01_USERSTATUS}"
    ...    "${PAYLOAD_VALUE}"
    ...    \nWARNING: Field validation failure

TC_GET_user_02
    ### Setup
    ${CASEDATA}    Test Setup
    ${REQUEST_PAYLOAD}    Set Variable    ${EMPTY}
    ${RESPONSE_PAYLOAD}    Set Variable    ${EMPTY}
    ${RESPONSE_STATUS}    Set Variable    ${EMPTY}
    ### Headers
    ${REQUEST_HEADERS}    Create Dictionary
    ${REQUEST_HEADERS}    Add To Headers    ${REQUEST_HEADERS}    Accept    application/json
    ### Request
    ${NON_EXISTING_USERNAME}    Generate UUID
    ${RESPONSE}    Get
    ...    ${BASE_URL}/${RESOURCE}/${NON_EXISTING_USERNAME}
    ...    validate=True
    ...    headers=${REQUEST_HEADERS}
    ${RESPONSE_PAYLOAD}    Get value from JSON    ${RESPONSE}    $.body
    ${RESPONSE_STATUS}    Get value from Json    ${RESPONSE}    $.status
    ### Validate
    Should Be Equal As Strings
    ...    "${CASEDATA["ExpectedHTTPResponseStatusCode"]}"
    ...    "${RESPONSE_STATUS}"
    ...    \nERROR: Status Code is missing or incorrect

TC_GET_user_03
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
    ...    ${BASE_URL}/${RESOURCE}/login?username=${USER_01_USERNAME},password=${USER_01_PASSWORD}
    ...    validate=True
    ...    headers=${REQUEST_HEADERS}
    ${RESPONSE_PAYLOAD}    Get value from JSON    ${RESPONSE}    $.body
    ${RESPONSE_STATUS}    Get value from Json    ${RESPONSE}    $.status
    ### Validate
    Should Be Equal As Strings
    ...    "${CASEDATA["ExpectedHTTPResponseStatusCode"]}"
    ...    "${RESPONSE_STATUS}"
    ...    \nERROR: Status Code is missing or incorrect

TC_GET_user_04
    ### Setup
    ${CASEDATA}    Test Setup
    ${REQUEST_PAYLOAD}    Set Variable    ${EMPTY}
    ${RESPONSE_PAYLOAD}    Set Variable    ${EMPTY}
    ${RESPONSE_STATUS}    Set Variable    ${EMPTY}
    ### Headers
    ${REQUEST_HEADERS}    Create Dictionary
    ${REQUEST_HEADERS}    Add To Headers    ${REQUEST_HEADERS}    Accept    application/json
    ### Request
    ${NON_EXISTING_USERNAME}    Generate UUID
    ${RESPONSE}    Get
    ...    ${BASE_URL}/${RESOURCE}/login?username=${NON_EXISTING_USERNAME},password=12345
    ...    validate=True
    ...    headers=${REQUEST_HEADERS}
    ${RESPONSE_PAYLOAD}    Get value from JSON    ${RESPONSE}    $.body
    ${RESPONSE_STATUS}    Get value from Json    ${RESPONSE}    $.status
    ### Validate
    Should Be Equal As Strings
    ...    "${CASEDATA["ExpectedHTTPResponseStatusCode"]}"
    ...    "${RESPONSE_STATUS}"
    ...    \nERROR: Status Code is missing or incorrect

TC_GET_user_05
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
    ...    ${BASE_URL}/${RESOURCE}/login?username=${USER_01_USERNAME},password=12345
    ...    validate=True
    ...    headers=${REQUEST_HEADERS}
    ${RESPONSE_PAYLOAD}    Get value from JSON    ${RESPONSE}    $.body
    ${RESPONSE_STATUS}    Get value from Json    ${RESPONSE}    $.status
    ### Validate
    Should Be Equal As Strings
    ...    "${CASEDATA["ExpectedHTTPResponseStatusCode"]}"
    ...    "${RESPONSE_STATUS}"
    ...    \nERROR: Status Code is missing or incorrect

TC_GET_user_06
    ### Setup
    ${CASEDATA}    Test Setup
    ${REQUEST_PAYLOAD}    Set Variable    ${EMPTY}
    ${RESPONSE_PAYLOAD}    Set Variable    ${EMPTY}
    ${RESPONSE_STATUS}    Set Variable    ${EMPTY}
    ### Headers
    ${REQUEST_HEADERS}    Create Dictionary
    ${REQUEST_HEADERS}    Add To Headers    ${REQUEST_HEADERS}    Accept    application/json
    ### Request
    ${RESPONSE}    Get    ${BASE_URL}/${RESOURCE}/login?password=12345    validate=True    headers=${REQUEST_HEADERS}
    ${RESPONSE_PAYLOAD}    Get value from JSON    ${RESPONSE}    $.body
    ${RESPONSE_STATUS}    Get value from Json    ${RESPONSE}    $.status
    ### Validate
    Should Be Equal As Strings
    ...    "${CASEDATA["ExpectedHTTPResponseStatusCode"]}"
    ...    "${RESPONSE_STATUS}"
    ...    \nERROR: Status Code is missing or incorrect

TC_GET_user_07
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
    ...    ${BASE_URL}/${RESOURCE}/login?username=${USER_01_USERNAME}
    ...    validate=True
    ...    headers=${REQUEST_HEADERS}
    ${RESPONSE_PAYLOAD}    Get value from JSON    ${RESPONSE}    $.body
    ${RESPONSE_STATUS}    Get value from Json    ${RESPONSE}    $.status
    ### Validate
    Should Be Equal As Strings
    ...    "${CASEDATA["ExpectedHTTPResponseStatusCode"]}"
    ...    "${RESPONSE_STATUS}"
    ...    \nERROR: Status Code is missing or incorrect

TC_GET_user_08
    ### Setup
    ${CASEDATA}    Test Setup
    ${REQUEST_PAYLOAD}    Set Variable    ${EMPTY}
    ${RESPONSE_PAYLOAD}    Set Variable    ${EMPTY}
    ${RESPONSE_STATUS}    Set Variable    ${EMPTY}
    ### Headers
    ${REQUEST_HEADERS}    Create Dictionary
    ${REQUEST_HEADERS}    Add To Headers    ${REQUEST_HEADERS}    Accept    application/json
    ### Request
    ${RESPONSE}    Get    ${BASE_URL}/${RESOURCE}/logout    validate=True    headers=${REQUEST_HEADERS}
    ${RESPONSE_PAYLOAD}    Get value from JSON    ${RESPONSE}    $.body
    ${RESPONSE_STATUS}    Get value from Json    ${RESPONSE}    $.status
    ### Validate
    Should Be Equal As Strings
    ...    "${CASEDATA["ExpectedHTTPResponseStatusCode"]}"
    ...    "${RESPONSE_STATUS}"
    ...    \nERROR: Status Code is missing or incorrect
