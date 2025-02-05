*** Settings ***
Resource            ../../resources/automationKeywords.robot

Suite Setup         Scenario Setup    ${TESTDATA_FILENAME}
Suite Teardown      Scenario Teardown
Test Teardown       Run Keyword If Test Failed    TestCase Teardown    ${REQUEST_PAYLOAD}    ${RESPONSE_PAYLOAD}    ${RESPONSE_STATUS}


*** Variables ***
${RESOURCE}             user
${TESTDATA_FILENAME}    ${RESOURCE}.csv


*** Test Cases ***
TC_PUT_user_01
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
    ${USERNAME}    Set Variable    ${USER_02_USERNAME}
    Update value to JSON    ${REQUEST_PAYLOAD}    $.username    ${USERNAME}
    ${FIRSTNAME}    Set Variable    NEW.FIRSTNAME
    Update value to JSON    ${REQUEST_PAYLOAD}    $.firstName    ${FIRSTNAME}
    ${LASTNAME}    Set Variable    NEW.LASTNAME
    Update value to JSON    ${REQUEST_PAYLOAD}    $.lastName    ${LASTNAME}
    ${EMAIL}    Set Variable    abc@xyz.com
    Update value to JSON    ${REQUEST_PAYLOAD}    $.email    ${EMAIL}
    ${PASSWORD}    Set Variable    NEW.PASS${SECS}
    Update value to JSON    ${REQUEST_PAYLOAD}    $.password    ${PASSWORD}
    ${PHONE}    Set Variable    +0123456789
    Update value to JSON    ${REQUEST_PAYLOAD}    $.phone    ${PHONE}
    ${USERSTATUS}    Convert To Integer    -1
    Update value to JSON    ${REQUEST_PAYLOAD}    $.userStatus    ${USERSTATUS}
    ### Headers
    ${REQUEST_HEADERS}    Create Dictionary
    ${REQUEST_HEADERS}    Add To Headers    ${REQUEST_HEADERS}    Accept    application/json
    ${REQUEST_HEADERS}    Add To Headers    ${REQUEST_HEADERS}    Content-Type    application/json
    ### Request
    ${RESPONSE}    Put
    ...    ${BASE_URL}/${RESOURCE}/${USERNAME}
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
    ${PAYLOAD_VALUE}    Get value from Json    ${RESPONSE}    $.body.username
    Run Keyword And Warn On Failure
    ...    Should Be Equal As Strings
    ...    "${USERNAME}"
    ...    "${PAYLOAD_VALUE}"
    ...    \nWARNING: Field validation failure
    ${PAYLOAD_VALUE}    Get value from Json    ${RESPONSE}    $.body.firstName
    Run Keyword And Warn On Failure
    ...    Should Be Equal As Strings
    ...    "${FIRSTNAME}"
    ...    "${PAYLOAD_VALUE}"
    ...    \nWARNING: Field validation failure
    ${PAYLOAD_VALUE}    Get value from Json    ${RESPONSE}    $.body.lastName
    Run Keyword And Warn On Failure
    ...    Should Be Equal As Strings
    ...    "${LASTNAME}"
    ...    "${PAYLOAD_VALUE}"
    ...    \nWARNING: Field validation failure
    ${PAYLOAD_VALUE}    Get value from Json    ${RESPONSE}    $.body.email
    Run Keyword And Warn On Failure
    ...    Should Be Equal As Strings
    ...    "${EMAIL}"
    ...    "${PAYLOAD_VALUE}"
    ...    \nWARNING: Field validation failure
    ${PAYLOAD_VALUE}    Get value from Json    ${RESPONSE}    $.body.password
    Run Keyword And Warn On Failure
    ...    Should Be Equal As Strings
    ...    "${PASSWORD}"
    ...    "${PAYLOAD_VALUE}"
    ...    \nWARNING: Field validation failure
    ${PAYLOAD_VALUE}    Get value from Json    ${RESPONSE}    $.body.phone
    Run Keyword And Warn On Failure
    ...    Should Be Equal As Strings
    ...    "${PHONE}"
    ...    "${PAYLOAD_VALUE}"
    ...    \nWARNING: Field validation failure
    ${PAYLOAD_VALUE}    Get value from Json    ${RESPONSE}    $.body.userStatus
    Run Keyword And Warn On Failure
    ...    Should Be Equal As Strings
    ...    "${USERSTATUS}"
    ...    "${PAYLOAD_VALUE}"
    ...    \nWARNING: Field validation failure

TC_PUT_user_02
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
    ${USERNAME}    Generate UUID
    Update value to JSON    ${REQUEST_PAYLOAD}    $.username    ${USERNAME}
    ${FIRSTNAME}    Set Variable    NEW.FIRSTNAME
    Update value to JSON    ${REQUEST_PAYLOAD}    $.firstName    ${FIRSTNAME}
    ${LASTNAME}    Set Variable    NEW.LASTNAME
    Update value to JSON    ${REQUEST_PAYLOAD}    $.lastName    ${LASTNAME}
    ${EMAIL}    Set Variable    abc@xyz.com
    Update value to JSON    ${REQUEST_PAYLOAD}    $.email    ${EMAIL}
    ${PASSWORD}    Set Variable    NEW.PASS${SECS}
    Update value to JSON    ${REQUEST_PAYLOAD}    $.password    ${PASSWORD}
    ${PHONE}    Set Variable    +0123456789
    Update value to JSON    ${REQUEST_PAYLOAD}    $.phone    ${PHONE}
    ${USERSTATUS}    Convert To Integer    -1
    Update value to JSON    ${REQUEST_PAYLOAD}    $.userStatus    ${USERSTATUS}
    ### Headers
    ${REQUEST_HEADERS}    Create Dictionary
    ${REQUEST_HEADERS}    Add To Headers    ${REQUEST_HEADERS}    Accept    application/json
    ${REQUEST_HEADERS}    Add To Headers    ${REQUEST_HEADERS}    Content-Type    application/json
    ### Request
    ${RESPONSE}    Put
    ...    ${BASE_URL}/${RESOURCE}/${USERNAME}
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
    ${PAYLOAD_VALUE}    Get value from Json    ${RESPONSE}    $.body.username
    Run Keyword And Warn On Failure
    ...    Should Be Equal As Strings
    ...    "${USERNAME}"
    ...    "${PAYLOAD_VALUE}"
    ...    \nWARNING: Field validation failure
    ${PAYLOAD_VALUE}    Get value from Json    ${RESPONSE}    $.body.firstName
    Run Keyword And Warn On Failure
    ...    Should Be Equal As Strings
    ...    "${FIRSTNAME}"
    ...    "${PAYLOAD_VALUE}"
    ...    \nWARNING: Field validation failure
    ${PAYLOAD_VALUE}    Get value from Json    ${RESPONSE}    $.body.lastName
    Run Keyword And Warn On Failure
    ...    Should Be Equal As Strings
    ...    "${LASTNAME}"
    ...    "${PAYLOAD_VALUE}"
    ...    \nWARNING: Field validation failure
    ${PAYLOAD_VALUE}    Get value from Json    ${RESPONSE}    $.body.email
    Run Keyword And Warn On Failure
    ...    Should Be Equal As Strings
    ...    "${EMAIL}"
    ...    "${PAYLOAD_VALUE}"
    ...    \nWARNING: Field validation failure
    ${PAYLOAD_VALUE}    Get value from Json    ${RESPONSE}    $.body.password
    Run Keyword And Warn On Failure
    ...    Should Be Equal As Strings
    ...    "${PASSWORD}"
    ...    "${PAYLOAD_VALUE}"
    ...    \nWARNING: Field validation failure
    ${PAYLOAD_VALUE}    Get value from Json    ${RESPONSE}    $.body.phone
    Run Keyword And Warn On Failure
    ...    Should Be Equal As Strings
    ...    "${PHONE}"
    ...    "${PAYLOAD_VALUE}"
    ...    \nWARNING: Field validation failure
    ${PAYLOAD_VALUE}    Get value from Json    ${RESPONSE}    $.body.userStatus
    Run Keyword And Warn On Failure
    ...    Should Be Equal As Strings
    ...    "${USERSTATUS}"
    ...    "${PAYLOAD_VALUE}"
    ...    \nWARNING: Field validation failure

TC_PUT_user_03
    ### Setup
    ${CASEDATA}    Test Setup
    ${REQUEST_PAYLOAD}    Set Variable    ${EMPTY}
    ${RESPONSE_PAYLOAD}    Set Variable    ${EMPTY}
    ${RESPONSE_STATUS}    Set Variable    ${EMPTY}
    ### Payload
    ${REQUEST_PAYLOAD}    Convert String to JSON    ${CASEDATA["Request Payload"]}
    ${USERNAME}    Set Variable    ${USER_01_USERNAME}
    Update value to JSON    ${REQUEST_PAYLOAD}    $.username    ${USERNAME}
    ### Headers
    ${REQUEST_HEADERS}    Create Dictionary
    ${REQUEST_HEADERS}    Add To Headers    ${REQUEST_HEADERS}    Accept    application/json
    ${REQUEST_HEADERS}    Add To Headers    ${REQUEST_HEADERS}    Content-Type    application/json
    ### Request
    ${RESPONSE}    Put
    ...    ${BASE_URL}/${RESOURCE}/${USERNAME}
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

TC_PUT_user_04
    ### Setup
    ${CASEDATA}    Test Setup
    ${REQUEST_PAYLOAD}    Set Variable    ${EMPTY}
    ${RESPONSE_PAYLOAD}    Set Variable    ${EMPTY}
    ${RESPONSE_STATUS}    Set Variable    ${EMPTY}
    ### Payload
    ${REQUEST_PAYLOAD}    Convert String to JSON    ${CASEDATA["Request Payload"]}
    ${USERNAME}    Set Variable    ${USER_01_USERNAME}
    Update value to JSON    ${REQUEST_PAYLOAD}    $.username    ${USERNAME}
    ### Headers
    ${REQUEST_HEADERS}    Create Dictionary
    ${REQUEST_HEADERS}    Add To Headers    ${REQUEST_HEADERS}    Accept    application/json
    ${REQUEST_HEADERS}    Add To Headers    ${REQUEST_HEADERS}    Content-Type    application/json
    ### Request
    ${RESPONSE}    Put
    ...    ${BASE_URL}/${RESOURCE}/${USERNAME}
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

TC_PUT_user_05
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
    ${RESPONSE}    Put    ${BASE_URL}/${RESOURCE}/${USER_01_USERNAME}    validate=True    headers=${REQUEST_HEADERS}
    ${RESPONSE_PAYLOAD}    Get value from JSON    ${RESPONSE}    $.body
    ${RESPONSE_STATUS}    Get value from Json    ${RESPONSE}    $.status
    ### Validate
    Should Be Equal As Strings
    ...    "${CASEDATA["ExpectedHTTPResponseStatusCode"]}"
    ...    "${RESPONSE_STATUS}"
    ...    \nERROR: Status Code is missing or incorrect
