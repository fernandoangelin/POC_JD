*** Settings ***
Documentation    This file stores the selectors for the product page


*** Variables ***
${PRICE_INFO}                    css=[data-e2e="product-price"]
${PRODUCT_NAME}                  css=[data-e2e="product-name"]
${PRODUCT_IMAGE_GALERY}          id=gallery
${PRODUCT_SIZE_LIST_SELECTOR}    css=[data-e2e="pdp-productDetails-size"]
${ADD_TO_CART_BUTTON}            id=addToBasket
${QUANTITY_INPUT}                id=quantity
${QUANTITY_PLUS_ICON}            css=.quantityPlus
${QUANTITY_MINUS_ICON}           css=.quantityMinus
${ADD_TO_WHISHLIST_ICON}         id=itemWishlist
