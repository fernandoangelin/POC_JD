*** Settings ***
Documentation    This file contains the test suite for the Search feature

Resource    ../keywords/key_setup_browser.resource
Resource    ../keywords/key_setup_device.resource
Resource    ../keywords/key_setup_env.resource
Resource    ../keywords/pages/key_homepage.resource
Resource    ../keywords/pages/key_brandpage.resource
Resource    ../keywords/pages/key_pdp.resource

Test Setup    Run Keywords
...           Set Environment    AND
...           Set Device    AND
...           Set And Open Browser

Test Teardown    Close Environment


*** Test Cases ***
Validate Product Page
    [Documentation]    This test verifies if the product page is correct displayed
    [Tags]    test3    regression
    Click Accept All Cookies Button
    Search For A Specific Brand    ${DEFAULT_BRAND}
    Brand Page Should Be Visible
    Click On The First Product Available
    Sleep    1s
    Product Page Should Be Visible
    Capture Page Screenshot    # Screenshot just to see the final screen
