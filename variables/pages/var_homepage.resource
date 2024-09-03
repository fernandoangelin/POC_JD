*** Settings ***
Documentation    This file stores the selectors for the homepage


*** Variables ***
${COOKIES_MODAL}                css=div.banner > div
${ACCEPT_ALL_COOKIES_BUTTON}    css=button.accept-all-cookies
${REJECT_ALL_COOKIES_BUTTON}    css=button.reject-all-cookies
${COOKIES_DEFINITION_BUTTON}    css=#cookie-settings

${MOBILE_SEARCH_TOGGLE}    css=[data-e2e="header-search-toggle"]
${SEARCH_INPUT}     css=#srchInput
${SEARCH_BUTTON}    id=srchButton
