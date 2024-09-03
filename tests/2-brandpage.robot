*** Settings ***
Documentation    This file contains the test suite for the Search feature

Resource    ../keywords/key_setup_browser.resource
Resource    ../keywords/key_setup_device.resource
Resource    ../keywords/key_setup_env.resource
Resource    ../keywords/pages/key_homepage.resource
Resource    ../keywords/pages/key_brandpage.resource

Test Setup    Run Keywords
...           Set Environment    AND
...           Set Device    AND
...           Set And Open Browser

Test Teardown    Close Environment


*** Test Cases ***
Search For A Specific Item
    [Documentation]    This tests verifies if the search for an item.
    ...                Also, verifies if the brand page is displayed.
    [Tags]    test2    regression
    Click Accept All Cookies Button
    Search For A Specific Brand    ${DEFAULT_BRAND}
    Sleep    2s
    Brand Page Should Be Visible
    Brand Title Should Contain Text    ${DEFAULT_BRAND}
    Capture Page Screenshot    # Screenshot just to see the final screen
