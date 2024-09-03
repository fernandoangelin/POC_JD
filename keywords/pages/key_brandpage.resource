*** Settings ***
Documentation    This file contains the keywords for brandpage actions

Resource    ../../variables/pages/var_brandpage.resource


*** Keywords ***
Brand Page Should Be Visible
    [Documentation]    This keyword verifies if the brand page is visible
    Wait Until Element Is Visible    ${PRODUCT_LIST_BANNER}
    Wait Until Element Is Visible    ${PRODUCT_LIST}
    Element Should Be Visible    ${BRAND_TITLE}
    Element Should Be Visible    ${PRODUCT_LIST}

Brand Title Should Contain Text
    [Documentation]   This keyword verifies if the brand page title has the expected text
    [Arguments]    ${expected_text}

    ${actual_text}    Get Text    ${BRAND_TITLE}

    Should Contain    ${actual_text}    ${expected_text}
    ...    The text *${expected_text}* in title does not match with *${actual_text}*.

Click On The First Product Available
    [Documentation]    This keyword selects the first product available in the brand page
    ...                and clicks on it

    @{product_list}    Get Webelements    ${PRODUCTS_AVAILABLE}

    Scroll Element Into View    ${product_list}[0]

    Click Element    ${product_list}[0]
