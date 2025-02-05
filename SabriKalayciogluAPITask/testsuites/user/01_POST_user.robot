*** Settings ***
Resource            ../../resources/automationKeywords.robot

Suite Setup         Scenario Setup    ${TESTDATA_FILENAME}
Suite Teardown      Scenario Teardown
Test Teardown       Run Keyword If Test Failed    TestCase Teardown    ${REQUEST_PAYLOAD}    ${RESPONSE_PAYLOAD}    ${RESPONSE_STATUS}


*** Variables ***
${RESOURCE}             user
${TESTDATA_FILENAME}    ${RESOURCE}.csv


*** Test Cases ***
TC_POST_user_01
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
    Set Global Variable    ${USER_01_ID}    ${ID}
    ${USERNAME}    Set Variable    USER${SECS}
    Update value to JSON    ${REQUEST_PAYLOAD}    $.username    ${USERNAME}
    Set Global Variable    ${USER_01_USERNAME}    ${USERNAME}
    ${FIRSTNAME}    Set Variable    FIRSTNAME
    Update value to JSON    ${REQUEST_PAYLOAD}    $.firstName    ${FIRSTNAME}
    Set Global Variable    ${USER_01_FIRSTNAME}    ${FIRSTNAME}
    ${LASTNAME}    Set Variable    LASTNAME
    Update value to JSON    ${REQUEST_PAYLOAD}    $.lastName    ${LASTNAME}
    Set Global Variable    ${USER_01_LASTNAME}    ${LASTNAME}
    ${EMAIL}    Set Variable    abc@def.com
    Update value to JSON    ${REQUEST_PAYLOAD}    $.email    ${EMAIL}
    Set Global Variable    ${USER_01_EMAIL}    ${EMAIL}
    ${PASSWORD}    Set Variable    PASS${SECS}
    Update value to JSON    ${REQUEST_PAYLOAD}    $.password    ${PASSWORD}
    Set Global Variable    ${USER_01_PASSWORD}    ${PASSWORD}
    ${PHONE}    Set Variable    0123456789
    Update value to JSON    ${REQUEST_PAYLOAD}    $.phone    ${PHONE}
    Set Global Variable    ${USER_01_PHONE}    ${PHONE}
    ${USERSTATUS}    Convert To Integer    1
    Update value to JSON    ${REQUEST_PAYLOAD}    $.userStatus    ${USERSTATUS}
    Set Global Variable    ${USER_01_USERSTATUS}    ${USERSTATUS}
    ### Headers
    ${REQUEST_HEADERS}    Create Dictionary
    ${REQUEST_HEADERS}    Add To Headers    ${REQUEST_HEADERS}    Accept    application/json
    ${REQUEST_HEADERS}    Add To Headers    ${REQUEST_HEADERS}    Content-Type    application/json
    ### Request
    ${RESPONSE}    Post
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

TC_POST_user_02
    ### Setup
    ${CASEDATA}    Test Setup
    ${REQUEST_PAYLOAD}    Set Variable    ${EMPTY}
    ${RESPONSE_PAYLOAD}    Set Variable    ${EMPTY}
    ${RESPONSE_STATUS}    Set Variable    ${EMPTY}
    ### Payload
    ${REQUEST_PAYLOAD}    Convert String to JSON    ${CASEDATA["Request Payload"]}
    ${SECS}    Get Time    epoch
    ${USERNAME}    Set Variable    USER${SECS}
    Update value to JSON    ${REQUEST_PAYLOAD}    $.username    ${USERNAME}
    Set Global Variable    ${USER_02_USERNAME}    ${USERNAME}
    ### Headers
    ${REQUEST_HEADERS}    Create Dictionary
    ${REQUEST_HEADERS}    Add To Headers    ${REQUEST_HEADERS}    Accept    application/json
    ${REQUEST_HEADERS}    Add To Headers    ${REQUEST_HEADERS}    Content-Type    application/json
    ### Request
    ${RESPONSE}    Post
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
    ${ID}    Get value from Json    ${RESPONSE}    $.body.id
    Run Keyword And Warn On Failure
    ...    Should Not Be Equal As Strings
    ...    "${None}"
    ...    "${ID}"
    ...    \nERROR: ID is missing in response payload

TC_POST_user_03
    ### Setup
    ${CASEDATA}    Test Setup
    ${REQUEST_PAYLOAD}    Set Variable    ${EMPTY}
    ${RESPONSE_PAYLOAD}    Set Variable    ${EMPTY}
    ${RESPONSE_STATUS}    Set Variable    ${EMPTY}
    ### Payload
    ${REQUEST_PAYLOAD}    Convert String to JSON    ${CASEDATA["Request Payload"]}
    ${SECS}    Get Time    epoch
    ${USERNAME}    Set Variable    USER${SECS}
    Update value to JSON    ${REQUEST_PAYLOAD}    $.username    ${USERNAME}
    ### Headers
    ${REQUEST_HEADERS}    Create Dictionary
    ${REQUEST_HEADERS}    Add To Headers    ${REQUEST_HEADERS}    Accept    application/json
    ${REQUEST_HEADERS}    Add To Headers    ${REQUEST_HEADERS}    Content-Type    application/json
    ### Request
    ${RESPONSE}    Post
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

TC_POST_user_04
    ### Setup
    ${CASEDATA}    Test Setup
    ${REQUEST_PAYLOAD}    Set Variable    ${EMPTY}
    ${RESPONSE_PAYLOAD}    Set Variable    ${EMPTY}
    ${RESPONSE_STATUS}    Set Variable    ${EMPTY}
    ### Payload
    ${REQUEST_PAYLOAD}    Convert String to JSON    ${CASEDATA["Request Payload"]}
    ${SECS}    Get Time    epoch
    ${USERNAME}    Set Variable    USER${SECS}
    Update value to JSON    ${REQUEST_PAYLOAD}    $.username    ${USERNAME}
    ### Headers
    ${REQUEST_HEADERS}    Create Dictionary
    ${REQUEST_HEADERS}    Add To Headers    ${REQUEST_HEADERS}    Accept    application/json
    ${REQUEST_HEADERS}    Add To Headers    ${REQUEST_HEADERS}    Content-Type    application/json
    ### Request
    ${RESPONSE}    Post
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

TC_POST_user_05
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
    ${RESPONSE}    Post    ${BASE_URL}/${RESOURCE}    validate=True    headers=${REQUEST_HEADERS}
    ${RESPONSE_PAYLOAD}    Get value from JSON    ${RESPONSE}    $.body
    ${RESPONSE_STATUS}    Get value from Json    ${RESPONSE}    $.status
    ### Validate
    Should Be Equal As Strings
    ...    "${CASEDATA["ExpectedHTTPResponseStatusCode"]}"
    ...    "${RESPONSE_STATUS}"
    ...    \nERROR: Status Code is missing or incorrect

TC_POST_user_06
    ### Setup
    ${CASEDATA}    Test Setup
    ${REQUEST_PAYLOAD}    Set Variable    ${EMPTY}
    ${RESPONSE_PAYLOAD}    Set Variable    ${EMPTY}
    ${RESPONSE_STATUS}    Set Variable    ${EMPTY}
    ### Payload
    ${REQUEST_PAYLOAD}    Convert String to JSON    ${CASEDATA["Request Payload"]}
    ${SECS}    Get Time    epoch
    ${ID}    Set Variable    ${SECS}
    Update value to JSON    ${REQUEST_PAYLOAD}    $[0].id    ${ID}
    ${USERNAME}    Set Variable    USER${SECS}
    Update value to JSON    ${REQUEST_PAYLOAD}    $[0].username    ${USERNAME}
    ${FIRSTNAME}    Set Variable    FIRSTNAME
    Update value to JSON    ${REQUEST_PAYLOAD}    $[0].firstName    ${FIRSTNAME}
    ${LASTNAME}    Set Variable    LASTNAME
    Update value to JSON    ${REQUEST_PAYLOAD}    $[0].lastName    ${LASTNAME}
    ${EMAIL}    Set Variable    abc@def.com
    Update value to JSON    ${REQUEST_PAYLOAD}    $[0].email    ${EMAIL}
    ${PASSWORD}    Set Variable    PASS${SECS}
    Update value to JSON    ${REQUEST_PAYLOAD}    $[0].password    ${PASSWORD}
    ${PHONE}    Set Variable    0123456789
    Update value to JSON    ${REQUEST_PAYLOAD}    $[0].phone    ${PHONE}
    ${USERSTATUS}    Convert To Integer    1
    Update value to JSON    ${REQUEST_PAYLOAD}    $[0].userStatus    ${USERSTATUS}
    ### Headers
    ${REQUEST_HEADERS}    Create Dictionary
    ${REQUEST_HEADERS}    Add To Headers    ${REQUEST_HEADERS}    Accept    application/json
    ${REQUEST_HEADERS}    Add To Headers    ${REQUEST_HEADERS}    Content-Type    application/json
    ### Request
    ${RESPONSE}    Post
    ...    ${BASE_URL}/${RESOURCE}/createWithArray
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
    ${STR}    Convert JSON to String    ${RESPONSE_PAYLOAD}
    Run Keyword And Warn On Failure    Should Start With    ${STR}    [    \nWARNING: Response body is not an array
    ${FIRSTCHAR}    Get Substring    ${STR}[0]    0    1
    IF    "${FIRSTCHAR}" == "["
        ${PAYLOAD_VALUE}    Get value from Json    ${RESPONSE}    $.body[0].id
        Run Keyword And Warn On Failure
        ...    Should Be Equal As Strings
        ...    "${ID}"
        ...    "${PAYLOAD_VALUE}"
        ...    \nWARNING: Field validation failure
        ${PAYLOAD_VALUE}    Get value from Json    ${RESPONSE}    $.body[0].username
        Run Keyword And Warn On Failure
        ...    Should Be Equal As Strings
        ...    "${USERNAME}"
        ...    "${PAYLOAD_VALUE}"
        ...    \nWARNING: Field validation failure
        ${PAYLOAD_VALUE}    Get value from Json    ${RESPONSE}    $.body[0].firstName
        Run Keyword And Warn On Failure
        ...    Should Be Equal As Strings
        ...    "${FIRSTNAME}"
        ...    "${PAYLOAD_VALUE}"
        ...    \nWARNING: Field validation failure
        ${PAYLOAD_VALUE}    Get value from Json    ${RESPONSE}    $.body[0].lastName
        Run Keyword And Warn On Failure
        ...    Should Be Equal As Strings
        ...    "${LASTNAME}"
        ...    "${PAYLOAD_VALUE}"
        ...    \nWARNING: Field validation failure
        ${PAYLOAD_VALUE}    Get value from Json    ${RESPONSE}    $.body[0].email
        Run Keyword And Warn On Failure
        ...    Should Be Equal As Strings
        ...    "${EMAIL}"
        ...    "${PAYLOAD_VALUE}"
        ...    \nWARNING: Field validation failure
        ${PAYLOAD_VALUE}    Get value from Json    ${RESPONSE}    $.body[0].password
        Run Keyword And Warn On Failure
        ...    Should Be Equal As Strings
        ...    "${PASSWORD}"
        ...    "${PAYLOAD_VALUE}"
        ...    \nWARNING: Field validation failure
        ${PAYLOAD_VALUE}    Get value from Json    ${RESPONSE}    $.body[0].phone
        Run Keyword And Warn On Failure
        ...    Should Be Equal As Strings
        ...    "${PHONE}"
        ...    "${PAYLOAD_VALUE}"
        ...    \nWARNING: Field validation failure
        ${PAYLOAD_VALUE}    Get value from Json    ${RESPONSE}    $.body[0].userStatus
        Run Keyword And Warn On Failure
        ...    Should Be Equal As Strings
        ...    "${USERSTATUS}"
        ...    "${PAYLOAD_VALUE}"
        ...    \nWARNING: Field validation failure
    END

TC_POST_user_07
    ### Setup
    ${CASEDATA}    Test Setup
    ${REQUEST_PAYLOAD}    Set Variable    ${EMPTY}
    ${RESPONSE_PAYLOAD}    Set Variable    ${EMPTY}
    ${RESPONSE_STATUS}    Set Variable    ${EMPTY}
    ### Payload
    ${REQUEST_PAYLOAD}    Convert String to JSON    ${CASEDATA["Request Payload"]}
    ${SECS}    Get Time    epoch
    ${USERNAME}    Set Variable    USER1${SECS}
    Update value to JSON    ${REQUEST_PAYLOAD}    $[0].username    ${USERNAME}
    ${USERNAME}    Set Variable    USER2${SECS}
    Update value to JSON    ${REQUEST_PAYLOAD}    $[1].username    ${USERNAME}
    ### Headers
    ${REQUEST_HEADERS}    Create Dictionary
    ${REQUEST_HEADERS}    Add To Headers    ${REQUEST_HEADERS}    Accept    application/json
    ${REQUEST_HEADERS}    Add To Headers    ${REQUEST_HEADERS}    Content-Type    application/json
    ### Request
    ${RESPONSE}    Post
    ...    ${BASE_URL}/${RESOURCE}/createWithArray
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
    ${STR}    Convert JSON to String    ${RESPONSE_PAYLOAD}
    Run Keyword And Warn On Failure    Should Start With    ${STR}    [    \nWARNING: Response body is not an array
    ${FIRSTCHAR}    Get Substring    ${STR}[0]    0    1
    IF    "${FIRSTCHAR}" == "["
        ${ID}    Get value from Json    ${RESPONSE}    $.body[0].id
        Run Keyword And Warn On Failure
        ...    Should Not Be Equal As Strings
        ...    "${None}"
        ...    "${ID}"
        ...    \nERROR: ID is missing in response payload
        ${ID}    Get value from Json    ${RESPONSE}    $.body[1].id
        Run Keyword And Warn On Failure
        ...    Should Not Be Equal As Strings
        ...    "${None}"
        ...    "${ID}"
        ...    \nERROR: ID is missing in response payload
    END

TC_POST_user_08
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
    ${RESPONSE}    Post    ${BASE_URL}/${RESOURCE}/createWithArray    validate=True    headers=${REQUEST_HEADERS}
    ${RESPONSE_PAYLOAD}    Get value from JSON    ${RESPONSE}    $.body
    ${RESPONSE_STATUS}    Get value from Json    ${RESPONSE}    $.status
    ### Validate
    Should Be Equal As Strings
    ...    "${CASEDATA["ExpectedHTTPResponseStatusCode"]}"
    ...    "${RESPONSE_STATUS}"
    ...    \nERROR: Status Code is missing or incorrect

TC_POST_user_09
    ### Setup
    ${CASEDATA}    Test Setup
    ${REQUEST_PAYLOAD}    Set Variable    ${EMPTY}
    ${RESPONSE_PAYLOAD}    Set Variable    ${EMPTY}
    ${RESPONSE_STATUS}    Set Variable    ${EMPTY}
    ### Payload
    ${REQUEST_PAYLOAD}    Convert String to JSON    ${CASEDATA["Request Payload"]}
    ${SECS}    Get Time    epoch
    ${ID}    Set Variable    ${SECS}
    Update value to JSON    ${REQUEST_PAYLOAD}    $[0].id    ${ID}
    ${USERNAME}    Set Variable    USER${SECS}
    Update value to JSON    ${REQUEST_PAYLOAD}    $[0].username    ${USERNAME}
    ${FIRSTNAME}    Set Variable    FIRSTNAME
    Update value to JSON    ${REQUEST_PAYLOAD}    $[0].firstName    ${FIRSTNAME}
    ${LASTNAME}    Set Variable    LASTNAME
    Update value to JSON    ${REQUEST_PAYLOAD}    $[0].lastName    ${LASTNAME}
    ${EMAIL}    Set Variable    abc@def.com
    Update value to JSON    ${REQUEST_PAYLOAD}    $[0].email    ${EMAIL}
    ${PASSWORD}    Set Variable    PASS${SECS}
    Update value to JSON    ${REQUEST_PAYLOAD}    $[0].password    ${PASSWORD}
    ${PHONE}    Set Variable    0123456789
    Update value to JSON    ${REQUEST_PAYLOAD}    $[0].phone    ${PHONE}
    ${USERSTATUS}    Convert To Integer    1
    Update value to JSON    ${REQUEST_PAYLOAD}    $[0].userStatus    ${USERSTATUS}
    ### Headers
    ${REQUEST_HEADERS}    Create Dictionary
    ${REQUEST_HEADERS}    Add To Headers    ${REQUEST_HEADERS}    Accept    application/json
    ${REQUEST_HEADERS}    Add To Headers    ${REQUEST_HEADERS}    Content-Type    application/json
    ### Request
    ${RESPONSE}    Post
    ...    ${BASE_URL}/${RESOURCE}/createWithList
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
    ${STR}    Convert JSON to String    ${RESPONSE_PAYLOAD}
    Run Keyword And Warn On Failure    Should Start With    ${STR}    [    \nWARNING: Response body is not an array
    ${FIRSTCHAR}    Get Substring    ${STR}[0]    0    1
    IF    "${FIRSTCHAR}" == "["
        ${PAYLOAD_VALUE}    Get value from Json    ${RESPONSE}    $.body[0].id
        Run Keyword And Warn On Failure
        ...    Should Be Equal As Strings
        ...    "${ID}"
        ...    "${PAYLOAD_VALUE}"
        ...    \nWARNING: Field validation failure
        ${PAYLOAD_VALUE}    Get value from Json    ${RESPONSE}    $.body[0].username
        Run Keyword And Warn On Failure
        ...    Should Be Equal As Strings
        ...    "${USERNAME}"
        ...    "${PAYLOAD_VALUE}"
        ...    \nWARNING: Field validation failure
        ${PAYLOAD_VALUE}    Get value from Json    ${RESPONSE}    $.body[0].firstName
        Run Keyword And Warn On Failure
        ...    Should Be Equal As Strings
        ...    "${FIRSTNAME}"
        ...    "${PAYLOAD_VALUE}"
        ...    \nWARNING: Field validation failure
        ${PAYLOAD_VALUE}    Get value from Json    ${RESPONSE}    $.body[0].lastName
        Run Keyword And Warn On Failure
        ...    Should Be Equal As Strings
        ...    "${LASTNAME}"
        ...    "${PAYLOAD_VALUE}"
        ...    \nWARNING: Field validation failure
        ${PAYLOAD_VALUE}    Get value from Json    ${RESPONSE}    $.body[0].email
        Run Keyword And Warn On Failure
        ...    Should Be Equal As Strings
        ...    "${EMAIL}"
        ...    "${PAYLOAD_VALUE}"
        ...    \nWARNING: Field validation failure
        ${PAYLOAD_VALUE}    Get value from Json    ${RESPONSE}    $.body[0].password
        Run Keyword And Warn On Failure
        ...    Should Be Equal As Strings
        ...    "${PASSWORD}"
        ...    "${PAYLOAD_VALUE}"
        ...    \nWARNING: Field validation failure
        ${PAYLOAD_VALUE}    Get value from Json    ${RESPONSE}    $.body[0].phone
        Run Keyword And Warn On Failure
        ...    Should Be Equal As Strings
        ...    "${PHONE}"
        ...    "${PAYLOAD_VALUE}"
        ...    \nWARNING: Field validation failure
        ${PAYLOAD_VALUE}    Get value from Json    ${RESPONSE}    $.body[0].userStatus
        Run Keyword And Warn On Failure
        ...    Should Be Equal As Strings
        ...    "${USERSTATUS}"
        ...    "${PAYLOAD_VALUE}"
        ...    \nWARNING: Field validation failure
    END

TC_POST_user_10
    ### Setup
    ${CASEDATA}    Test Setup
    ${REQUEST_PAYLOAD}    Set Variable    ${EMPTY}
    ${RESPONSE_PAYLOAD}    Set Variable    ${EMPTY}
    ${RESPONSE_STATUS}    Set Variable    ${EMPTY}
    ### Payload
    ${REQUEST_PAYLOAD}    Convert String to JSON    ${CASEDATA["Request Payload"]}
    ${SECS}    Get Time    epoch
    ${USERNAME}    Set Variable    USER1${SECS}
    Update value to JSON    ${REQUEST_PAYLOAD}    $[0].username    ${USERNAME}
    ${USERNAME}    Set Variable    USER2${SECS}
    Update value to JSON    ${REQUEST_PAYLOAD}    $[1].username    ${USERNAME}
    ### Headers
    ${REQUEST_HEADERS}    Create Dictionary
    ${REQUEST_HEADERS}    Add To Headers    ${REQUEST_HEADERS}    Accept    application/json
    ${REQUEST_HEADERS}    Add To Headers    ${REQUEST_HEADERS}    Content-Type    application/json
    ### Request
    ${RESPONSE}    Post
    ...    ${BASE_URL}/${RESOURCE}/createWithList
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
    ${STR}    Convert JSON to String    ${RESPONSE_PAYLOAD}
    Run Keyword And Warn On Failure    Should Start With    ${STR}    [    \nWARNING: Response body is not an array
    ${FIRSTCHAR}    Get Substring    ${STR}[0]    0    1
    IF    "${FIRSTCHAR}" == "["
        ${ID}    Get value from Json    ${RESPONSE}    $.body[0].id
        Run Keyword And Warn On Failure
        ...    Should Not Be Equal As Strings
        ...    "${None}"
        ...    "${ID}"
        ...    \nERROR: ID is missing in response payload
        ${ID}    Get value from Json    ${RESPONSE}    $.body[1].id
        Run Keyword And Warn On Failure
        ...    Should Not Be Equal As Strings
        ...    "${None}"
        ...    "${ID}"
        ...    \nERROR: ID is missing in response payload
    END

TC_POST_user_11
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
    ${RESPONSE}    Post    ${BASE_URL}/${RESOURCE}/createWithList    validate=True    headers=${REQUEST_HEADERS}
    ${RESPONSE_PAYLOAD}    Get value from JSON    ${RESPONSE}    $.body
    ${RESPONSE_STATUS}    Get value from Json    ${RESPONSE}    $.status
    ### Validate
    Should Be Equal As Strings
    ...    "${CASEDATA["ExpectedHTTPResponseStatusCode"]}"
    ...    "${RESPONSE_STATUS}"
    ...    \nERROR: Status Code is missing or incorrect
