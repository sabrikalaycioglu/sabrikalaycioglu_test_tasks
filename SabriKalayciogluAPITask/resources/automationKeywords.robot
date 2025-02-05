*** Settings ***
Documentation       This file contains common Automation utility keywords.

Library             String
Library             REST
Library             RPA.JSON
Resource            ../variables/variables.robot
Library             ../libraries/utils.py


*** Keywords ***
Scenario Setup
    [Documentation]
    ...    Setup scenario items.\n
    [Arguments]    ${CSVFILE}
    BuiltIn.Set Log Level    TRACE
    ${TESTDATA}    Readcsv Data Dict    ${TESTCASES_PATH}    ${CSVFILE}
    Set Suite Variable    ${TESTDATA}

Scenario Teardown
    [Documentation]
    ...    Scenario teardown.\n
    No Operation

Test Setup
    [Documentation]
    ...    Read CSV data and prepare test case.\n
    ${CASEDATA}    Get CSV Data By Test Id    ${TESTDATA}    ${TESTNAME}
    Set Test Documentation
    ...    Test Description:${CASEDATA["Description"]} \n\n Expected Result:${CASEDATA["ExpectedHTTPResponseStatusCode"]} \n\n
    RETURN    ${CASEDATA}

Test Teardown
    [Documentation]
    ...    Test teardown.\n
    No Operation

TestCase Teardown
    [Documentation]
    ...    TestCase teardown.\n
    [Tags]    teardown
    [Arguments]    ${REQUEST_PAYLOAD}    ${RESPONSE_PAYLOAD}    ${RESPONSE_STATUS}
    Log to Console    \nREQUEST PAYLOAD${SPACE}${SPACE}:${SPACE}${REQUEST_PAYLOAD}
    Log to Console    RESPONSE PAYLOAD${SPACE}:${SPACE}${RESPONSE_PAYLOAD}
    Log to Console    RESPONSE STATUS${SPACE}${SPACE}:${SPACE}${RESPONSE_STATUS}

Add To Headers
    [Documentation]
    ...    Adds key=value to header.\n
    [Arguments]    ${HEADERS}    ${KEY}    ${VALUE}
    ${VALUE}    Convert To String    ${VALUE}
    ${HEADER_TO_ADD}    Create Dictionary    ${KEY}=${VALUE}
    ${HEADERS}    Add to JSON    ${HEADERS}    $    ${HEADER_TO_ADD}
    RETURN    ${HEADERS}
