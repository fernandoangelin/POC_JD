*** Settings ***
Documentation    This file contains the test suite for the Search feature

Resource    ../keywords/key_setup_browser.resource
Resource    ../keywords/key_setup_device.resource
Resource    ../keywords/key_setup_env.resource
Resource    ../keywords/pages/key_homepage.resource

Test Setup    Run Keywords
...           Set Environment    AND
...           Set Device    AND
...           Set And Open Browser

Test Teardown    Close Environment


*** Test Cases ***
Accept All Cookies In Homepage
    [Documentation]    This test verifies if the cookies modal is displayed.
    ...                Also, it verifies if the cookies modal is not displayed after accepting it.
    [Tags]    test1    regression
    Cookies Modal Should Be Visible
    Capture Page Screenshot    # Screenshot just to see the before action
    Click Accept All Cookies Button
    Cookies Modal Should Not Be Visible
    Capture Page Screenshot    # Screenshot just to see the after action
