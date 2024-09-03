*** Settings ***
Documentation    This file stores the selectors for the brand page


*** Variables ***
${PRODUCT_LIST_BANNER}    css=#productListBanner
${BRAND_TITLE}            css=h1:nth-child(1)
${PRODUCT_LIST}           css=#productListMain

${PRODUCTS_AVAILABLE}    css=a[data-e2e="plp-productList-link"]
