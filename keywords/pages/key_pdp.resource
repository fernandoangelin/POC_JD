*** Settings ***
Documentation    This file contains the keywords for pdp actions

Resource    ../../variables/pages/var_productpage.resource


*** Keywords ***
Product Page Should Be Visible
    [Documentation]    This keyword verifies if the pdp is visible

    Wait Until Element Is Visible    ${PRODUCT_IMAGE_GALERY}
    Element Should Be Visible    ${PRICE_INFO}
    Element Should Be Visible    ${PRODUCT_NAME}
    # Element Should Be Visible    ${PRODUCT_SIZE_LIST_SELECTOR}
    Element Should Be Visible    ${ADD_TO_CART_BUTTON}
    IF    "${DEVICE}" in ["Desktop"]
        Element Should Be Visible    ${QUANTITY_INPUT}
        Element Should Be Visible    ${QUANTITY_PLUS_ICON}
        Element Should Be Visible    ${QUANTITY_MINUS_ICON}
    END
    Element Should Be Visible    ${ADD_TO_WHISHLIST_ICON}

Select Product Size
    [Documentation]    This keyword selects the product size
    ...                By default, it selects the first available
    ...                Only if available
    ...                Some products does not have size options

    ${is_size_visible}    Run Keyword And Return Status    Element Should Be Visible    ${PRODUCT_SIZE_LIST_SELECTOR}

    IF    ${is_size_visible}
        @{size_list}    Get Webelements    ${PRODUCT_SIZE_LIST_SELECTOR}

        Scroll Element Into View    ${size_list}[0]

        Click Element    ${size_list}[0]
    END

Click On Add To Cart Button
    [Documentation]    This keyword waits and click on the Add to Cart Button

    Wait Until Element Is Visible    ${ADD_TO_CART_BUTTON}
    Click Button    ${ADD_TO_CART_BUTTON}
