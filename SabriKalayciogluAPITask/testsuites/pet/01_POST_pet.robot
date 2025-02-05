*** Settings ***
Resource            ../../resources/automationKeywords.robot
Library             RequestsLibrary

Suite Setup         Scenario Setup    ${TESTDATA_FILENAME}
Suite Teardown      Scenario Teardown
Test Teardown       Run Keyword If Test Failed    TestCase Teardown    ${REQUEST_PAYLOAD}    ${RESPONSE_PAYLOAD}    ${RESPONSE_STATUS}


*** Variables ***
${RESOURCE}             pet
${TESTDATA_FILENAME}    ${RESOURCE}.csv


*** Test Cases ***
TC_POST_pet_01
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
    Set Global Variable    ${PET_01_ID}    ${ID}
    ${NAME}    Set Variable    NAME${SECS}
    Update value to JSON    ${REQUEST_PAYLOAD}    $.name    ${NAME}
    Set Global Variable    ${PET_01_NAME}    ${NAME}
    ${CATEGORY_ID}    Convert To Integer    100
    Update value to JSON    ${REQUEST_PAYLOAD}    $.category.id    ${CATEGORY_ID}
    Set Global Variable    ${PET_01_CATEGORY_ID}    ${CATEGORY_ID}
    ${CATEGORY_NAME}    Set Variable    CATEGORY.NAME
    Update value to JSON    ${REQUEST_PAYLOAD}    $.category.name    ${CATEGORY_NAME}
    Set Global Variable    ${PET_01_CATEGORY_NAME}    ${CATEGORY_NAME}
    ${PHOTOURLS}    Set Variable    https://abc/001
    Update value to JSON    ${REQUEST_PAYLOAD}    $.photoUrls[0]    ${PHOTOURLS}
    Set Global Variable    ${PET_01_PHOTOURLS}    ${PHOTOURLS}
    ${TAGS_ID}    Convert To Integer    200
    Update value to JSON    ${REQUEST_PAYLOAD}    $.tags[0].id    ${TAGS_ID}
    Set Global Variable    ${PET_01_TAGS_ID}    ${TAGS_ID}
    ${TAGS_NAME}    Set Variable    TAGS.NAME
    Update value to JSON    ${REQUEST_PAYLOAD}    $.tags[0].name    ${TAGS_NAME}
    Set Global Variable    ${PET_01_TAGS_NAME}    ${TAGS_NAME}
    ${STATUS}    Set Variable    available
    Update value to JSON    ${REQUEST_PAYLOAD}    $.status    ${STATUS}
    Set Global Variable    ${PET_01_STATUS}    ${STATUS}
    ### Headers
    ${REQUEST_HEADERS}    Create Dictionary
    ${REQUEST_HEADERS}    Add To Headers    ${REQUEST_HEADERS}    Accept    application/json
    ${REQUEST_HEADERS}    Add To Headers    ${REQUEST_HEADERS}    Content-Type    application/json
    ### Request
    ${RESPONSE}    REST.Post
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

TC_POST_pet_02
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
    ${RESPONSE}    REST.Post
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
    Set Global Variable    ${PET_02_ID}    ${ID}

TC_POST_pet_03
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
    ${RESPONSE}    REST.Post
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

TC_POST_pet_04
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
    ${RESPONSE}    REST.Post
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

TC_POST_pet_05
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
    ${RESPONSE}    REST.Post
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

TC_POST_pet_06
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
    ${RESPONSE}    REST.Post
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

TC_POST_pet_07
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
    ${RESPONSE}    REST.Post    ${BASE_URL}/${RESOURCE}    validate=True    headers=${REQUEST_HEADERS}
    ${RESPONSE_PAYLOAD}    Get value from JSON    ${RESPONSE}    $.body
    ${RESPONSE_STATUS}    Get value from Json    ${RESPONSE}    $.status
    ### Validate
    Should Be Equal As Strings
    ...    "${CASEDATA["ExpectedHTTPResponseStatusCode"]}"
    ...    "${RESPONSE_STATUS}"
    ...    \nERROR: Status Code is missing or incorrect

TC_POST_pet_08
    ### Setup
    ${CASEDATA}    Test Setup
    ${REQUEST_PAYLOAD}    Set Variable    ${EMPTY}
    ${RESPONSE_PAYLOAD}    Set Variable    ${EMPTY}
    ${RESPONSE_STATUS}    Set Variable    ${EMPTY}
    ### Formdata
    Create Session    mysession    ${BASE_URL}    verify=True
    ${files}    Create Dictionary    name=NEW.NAME    status=pending
    ### Request
    ${RESPONSE}    POST On Session
    ...    mysession
    ...    ${BASE_URL}/pet/${PET_02_ID}
    ...    files=${files}
    ...    expected_status=any
    ${RESPONSE_PAYLOAD}    Set Variable    ${RESPONSE.text}
    ${RESPONSE_STATUS}    Set Variable    ${RESPONSE.status_code}
    ${RESPONSE_STATUS}    Convert To String    ${RESPONSE_STATUS}
    ### Validate
    Should Be Equal As Strings
    ...    "${RESPONSE_STATUS}"
    ...    "${CASEDATA["ExpectedHTTPResponseStatusCode"]}"
    ...    \nERROR: Status Code is missing or incorrect

TC_POST_pet_09
    ### Setup
    ${CASEDATA}    Test Setup
    ${REQUEST_PAYLOAD}    Set Variable    ${EMPTY}
    ${RESPONSE_PAYLOAD}    Set Variable    ${EMPTY}
    ${RESPONSE_STATUS}    Set Variable    ${EMPTY}
    ### Formdata
    Create Session    mysession    ${BASE_URL}    verify=True
    ${files}    Create Dictionary    name=NEW.NAME    status=pending
    ### Request
    ${NON_EXISTING_ID}    Generate UUID
    ${RESPONSE}    POST On Session
    ...    mysession
    ...    ${BASE_URL}/pet/${NON_EXISTING_ID}
    ...    files=${files}
    ...    expected_status=any
    ${RESPONSE_PAYLOAD}    Set Variable    ${RESPONSE.text}
    ${RESPONSE_STATUS}    Set Variable    ${RESPONSE.status_code}
    ${RESPONSE_STATUS}    Convert To String    ${RESPONSE_STATUS}
    ### Validate
    Should Be Equal As Strings
    ...    "${RESPONSE_STATUS}"
    ...    "${CASEDATA["ExpectedHTTPResponseStatusCode"]}"
    ...    \nERROR: Status Code is missing or incorrect

TC_POST_pet_10
    ### Setup
    ${CASEDATA}    Test Setup
    ${REQUEST_PAYLOAD}    Set Variable    ${EMPTY}
    ${RESPONSE_PAYLOAD}    Set Variable    ${EMPTY}
    ${RESPONSE_STATUS}    Set Variable    ${EMPTY}
    ### Formdata
    Create Session    mysession    ${BASE_URL}    verify=True
    ${files}    Create Dictionary    name=NEW.NAME    status=invalidStatus
    ### Request
    ${RESPONSE}    POST On Session
    ...    mysession
    ...    ${BASE_URL}/pet/${PET_02_ID}
    ...    files=${files}
    ...    expected_status=any
    ${RESPONSE_PAYLOAD}    Set Variable    ${RESPONSE.text}
    ${RESPONSE_STATUS}    Set Variable    ${RESPONSE.status_code}
    ${RESPONSE_STATUS}    Convert To String    ${RESPONSE_STATUS}
    ### Validate
    Should Be Equal As Strings
    ...    "${RESPONSE_STATUS}"
    ...    "${CASEDATA["ExpectedHTTPResponseStatusCode"]}"
    ...    \nERROR: Status Code is missing or incorrect

TC_POST_pet_11
    ### Setup
    ${CASEDATA}    Test Setup
    ${REQUEST_PAYLOAD}    Set Variable    ${EMPTY}
    ${RESPONSE_PAYLOAD}    Set Variable    ${EMPTY}
    ${RESPONSE_STATUS}    Set Variable    ${EMPTY}
    ### Formdata
    Create Session    mysession    ${BASE_URL}    verify=True
    ${file}    Get File For Streaming Upload    ${EXECDIR}/puppy.jpg
    ${files}    Create Dictionary    file=${file}    additionalMetadata=abcde
    ### Request
    ${RESPONSE}    POST On Session
    ...    mysession
    ...    ${BASE_URL}/pet/${PET_02_ID}/uploadImage
    ...    files=${files}
    ...    expected_status=any
    ${RESPONSE_PAYLOAD}    Set Variable    ${RESPONSE.text}
    ${RESPONSE_STATUS}    Set Variable    ${RESPONSE.status_code}
    ${RESPONSE_STATUS}    Convert To String    ${RESPONSE_STATUS}
    ### Validate
    Should Be Equal As Strings
    ...    "${RESPONSE_STATUS}"
    ...    "${CASEDATA["ExpectedHTTPResponseStatusCode"]}"
    ...    \nERROR: Status Code is missing or incorrect

TC_POST_pet_12
    ### Setup
    ${CASEDATA}    Test Setup
    ${REQUEST_PAYLOAD}    Set Variable    ${EMPTY}
    ${RESPONSE_PAYLOAD}    Set Variable    ${EMPTY}
    ${RESPONSE_STATUS}    Set Variable    ${EMPTY}
    ### Formdata
    Create Session    mysession    ${BASE_URL}    verify=True
    ${file}    Get File For Streaming Upload    ${EXECDIR}/puppy.jpg
    ${files}    Create Dictionary    file=${file}    additionalMetadata=abcde
    ### Request
    ${NON_EXISTING_ID}    Generate UUID
    ${RESPONSE}    POST On Session
    ...    mysession
    ...    ${BASE_URL}/pet/${NON_EXISTING_ID}/uploadImage
    ...    files=${files}
    ...    expected_status=any
    ${RESPONSE_PAYLOAD}    Set Variable    ${RESPONSE.text}
    ${RESPONSE_STATUS}    Set Variable    ${RESPONSE.status_code}
    ${RESPONSE_STATUS}    Convert To String    ${RESPONSE_STATUS}
    ### Validate
    Should Be Equal As Strings
    ...    "${RESPONSE_STATUS}"
    ...    "${CASEDATA["ExpectedHTTPResponseStatusCode"]}"
    ...    \nERROR: Status Code is missing or incorrect
