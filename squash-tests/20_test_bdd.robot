*** Settings ***
Documentation    test bdd
Metadata         ID                           20
Metadata         Automation priority          1
Metadata         Test case importance         Low
Resource         squash_resources.resource
Test Setup       Test Setup
Test Teardown    Test Teardown


*** Test Cases ***
test bdd
    [Documentation]    test bdd


*** Keywords ***
Test Setup
    [Documentation]    test setup
    ...                You can define the ${TEST_SETUP} variable with a keyword for setting up all your tests.
    ...                You can define the ${TEST_20_SETUP} variable with a keyword for setting up this specific test.
    ...                If both are defined, ${TEST_20_SETUP} will be run after ${TEST_SETUP}.

    ${TEST_SETUP_VALUE} =       Get Variable Value    ${TEST_SETUP}
    ${TEST_20_SETUP_VALUE} =    Get Variable Value    ${TEST_20_SETUP}
    IF    $TEST_SETUP_VALUE is not None
        Run Keyword    ${TEST_SETUP}
    END
    IF    $TEST_20_SETUP_VALUE is not None
        Run Keyword    ${TEST_20_SETUP}
    END

Test Teardown
    [Documentation]    test teardown
    ...                You can define the ${TEST_TEARDOWN} variable with a keyword for tearing down all your tests.
    ...                You can define the ${TEST_20_TEARDOWN} variable with a keyword for tearing down this specific test.
    ...                If both are defined, ${TEST_TEARDOWN} will be run after ${TEST_20_TEARDOWN}.

    ${TEST_20_TEARDOWN_VALUE} =    Get Variable Value    ${TEST_20_TEARDOWN}
    ${TEST_TEARDOWN_VALUE} =       Get Variable Value    ${TEST_TEARDOWN}
    IF    $TEST_20_TEARDOWN_VALUE is not None
        Run Keyword    ${TEST_20_TEARDOWN}
    END
    IF    $TEST_TEARDOWN_VALUE is not None
        Run Keyword    ${TEST_TEARDOWN}
    END
*** END ***
