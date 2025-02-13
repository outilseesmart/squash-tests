Squash standard logo
Requirements
Test cases
Executions
Reporting
Automation
Action words
Administration
Help
Project filter
VS
Network Monitoring Platform > Account
Account_001
Test case reference
Approved
High
No execution
1
1
7
Test steps
Add a test step
Given
I am on the AccountCreation page
When
I fill AccountCreation fields with gender <gender> firstName <first> lastName <last> password <password> email <mail> birthDate <birth> acceptPartnerOffers <offers> acceptPrivacyPolicy <privacy> acceptNewsletter <news> acceptGdpr <gpdr> and submit
And
I go to the Home page
And
I sign out
Then
I can successfully sign in with email <mail> password <password>
And
The displayed name is <display>
And
My personal information is gender <gender> firstName <first> lastName <last> email <mail> birthDate <birth> acceptPartnerOffers <offers> acceptPrivacyPolicy no acceptNewsletter <news> acceptGdpr no
Drag and drop files to add them, or browse.
Requirement repository
Test Case repository
 *** Settings ***
Documentation    Account_001
Metadata         ID                           23
Metadata         Automation priority          42
Metadata         Test case importance         High
Resource         squash_resources.resource
Library          squash_tf.TFParamService
Test Setup       Test Setup
Test Teardown    Test Teardown


*** Test Cases ***
Account_001
    [Documentation]    Account_001

    &{dataset} =    Retrieve Dataset

    Given I am on the AccountCreation page
    When I fill AccountCreation fields with gender "${dataset}[gender]" firstName "${dataset}[first]" lastName "${dataset}[last]" password "${dataset}[password]" email "${dataset}[mail]" birthDate "${dataset}[birth]" acceptPartnerOffers "${dataset}[offers]" acceptPrivacyPolicy "${dataset}[privacy]" acceptNewsletter "${dataset}[news]" acceptGdpr "${dataset}[gpdr]" and submit
    And I go to the Home page
    And I sign out
    Then I can successfully sign in with email "${dataset}[mail]" password "${dataset}[password]"
    And The displayed name is "${dataset}[display]"
    And My personal information is gender "${dataset}[gender]" firstName "${dataset}[first]" lastName "${dataset}[last]" email "${dataset}[mail]" birthDate "${dataset}[birth]" acceptPartnerOffers "${dataset}[offers]" acceptPrivacyPolicy "no" acceptNewsletter "${dataset}[news]" acceptGdpr "no"


*** Keywords ***
Test Setup
    [Documentation]    test setup
    ...                You can define the ${TEST_SETUP} variable with a keyword for setting up all your tests.
    ...                You can define the ${TEST_23_SETUP} variable with a keyword for setting up this specific test.
    ...                If both are defined, ${TEST_23_SETUP} will be run after ${TEST_SETUP}.

    ${TEST_SETUP_VALUE} =       Get Variable Value    ${TEST_SETUP}
    ${TEST_23_SETUP_VALUE} =    Get Variable Value    ${TEST_23_SETUP}
    IF    $TEST_SETUP_VALUE is not None
        Run Keyword    ${TEST_SETUP}
    END
    IF    $TEST_23_SETUP_VALUE is not None
        Run Keyword    ${TEST_23_SETUP}
    END

Test Teardown
    [Documentation]    test teardown
    ...                You can define the ${TEST_TEARDOWN} variable with a keyword for tearing down all your tests.
    ...                You can define the ${TEST_23_TEARDOWN} variable with a keyword for tearing down this specific test.
    ...                If both are defined, ${TEST_TEARDOWN} will be run after ${TEST_23_TEARDOWN}.

    ${TEST_23_TEARDOWN_VALUE} =    Get Variable Value    ${TEST_23_TEARDOWN}
    ${TEST_TEARDOWN_VALUE} =       Get Variable Value    ${TEST_TEARDOWN}
    IF    $TEST_23_TEARDOWN_VALUE is not None
        Run Keyword    ${TEST_23_TEARDOWN}
    END
    IF    $TEST_TEARDOWN_VALUE is not None
        Run Keyword    ${TEST_TEARDOWN}
    END

Retrieve Dataset
    [Documentation]    Retrieves Squash TM's datasets and stores them in a dictionary.
    ...
    ...                For instance, datasets containing 3 parameters "city", "country" and "currency"
    ...                have been defined in Squash TM.
    ...
    ...                First, this keyword retrieves parameter values from Squash TM
    ...                and stores them into variables, using the keyword 'Get Test Param':
    ...                ${city} =    Get Test Param    DS_city
    ...
    ...                Then, this keyword stores the parameters into the &{dataset} dictionary
    ...                with each parameter name as key, and each parameter value as value:
    ...                &{dataset} =    Create Dictionary    city=${city}    country=${country}    currency=${currency}

    ${gender} =      Get Test Param    DS_gender
    ${first} =       Get Test Param    DS_first
    ${last} =        Get Test Param    DS_last
    ${password} =    Get Test Param    DS_password
    ${mail} =        Get Test Param    DS_mail
    ${birth} =       Get Test Param    DS_birth
    ${offers} =      Get Test Param    DS_offers
    ${privacy} =     Get Test Param    DS_privacy
    ${news} =        Get Test Param    DS_news
    ${gpdr} =        Get Test Param    DS_gpdr
    ${display} =     Get Test Param    DS_display

    &{dataset} =    Create Dictionary    gender=${gender}    first=${first}    last=${last}          password=${password}
    ...                                  mail=${mail}        birth=${birth}    offers=${offers}      privacy=${privacy}
    ...                                  news=${news}        gpdr=${gpdr}      display=${display}

    RETURN    &{dataset}
 
