*** Settings ***
Documentation    This file contains the keywords for pdp actions

Resource    ../../variables/pages/var_cartpage.resource


*** Keywords ***
Cart Page Should Be Visible
    [Documentation]    This keyword verifies if the cookies modal is visible

    Wait Until Element Is Visible    ${CART_SELECTOR}
    Element Should Be Visible    ${CART TITLE}
    Element Should Be Visible    ${CART_PRODUCT_LIST}
    Element Should Be Visible    ${CART_SUMMARY}
    Element Should Be Visible    ${CART_SUBTOTAL}
    Element Should Be Visible    ${CART_TOTAL}
    Element Should Be Visible    ${PROCEED_CHECKOUT_BUTTON}
    Element Should Be Visible    ${PROCEED_PAYPAL_EXPRESS_BUTTON}
    Element Should Be Visible    ${PROMOCODE_ENABLER_OPTION}
    Element Should Be Visible    ${PRIVACY_POLICIES}
