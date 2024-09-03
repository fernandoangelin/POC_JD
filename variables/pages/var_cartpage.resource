*** Settings ***
Documentation    This file stores the selectors for the cart page


*** Variables ***
${CART_SELECTOR}    id=basketContent
${CART TITLE}    id=basketTitle
${CART_PRODUCT_LIST}    css=[data-e2e="cart-basket-list"]
${CART_SUMMARY}    id=basketTotals
${CART_SUBTOTAL}    css=[data-e2e="cart-basketTotals-subtotal"]
${CART_SUBTOTAL_VALUE}    css=${CART_SUBTOTAL} strong
${CART_TOTAL}    css=[data-e2e="cart-basketTotals-total"]
${CART_TOTAL_VALUE}    css=${CART_TOTAL} strong
${PROCEED_CHECKOUT_BUTTON}    css=.basketContinue
${PROCEED_PAYPAL_EXPRESS_BUTTON}    id=paypalExpress-checkoutLink
${PROMOCODE_ENABLER_OPTION}    id=promo
${PRIVACY_POLICIES}    css=.legalRequirementMessage
