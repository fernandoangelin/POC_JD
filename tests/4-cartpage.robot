*** Settings ***
Documentation    This file contains the test suite for the Search feature

Resource    ../keywords/key_setup_browser.resource
Resource    ../keywords/key_setup_device.resource
Resource    ../keywords/key_setup_env.resource
Resource    ../keywords/pages/key_homepage.resource
Resource    ../keywords/pages/key_brandpage.resource
Resource    ../keywords/pages/key_pdp.resource
Resource    ../keywords/pages/key_cartpage.resource

Test Setup    Run Keywords
...           Set Environment    AND
...           Set Device    AND
...           Set And Open Browser

Test Teardown    Close Environment


*** Test Cases ***
Add A Product From Brand Page To The Cart
    [Documentation]    This test verifies if a product is correct added to the cart.
    ...                Also, it checks if the cart is correctly loaded.
    [Tags]    test4    regression
    Click Accept All Cookies Button
    Search For A Specific Brand    ${DEFAULT_BRAND}
    Brand Page Should Be Visible
    Click On The First Product Available
    Sleep    1s
    Select Product Size
    Click On Add To Cart Button
    Sleep    2s
    Cart Page Should Be Visible
    Capture Page Screenshot    # Screenshot just to see the final screen
