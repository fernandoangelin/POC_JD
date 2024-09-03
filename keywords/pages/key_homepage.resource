*** Settings ***
Documentation    This file contains the keywords for homepage actions

Resource    ../../variables/pages/var_homepage.resource


*** Keywords ***
Cookies Modal Should Be Visible
    [Documentation]    This keyword verifies if the cookies modal is visible

    Wait Until Element Is Visible    ${COOKIES_MODAL}
    Element Should Be Visible    ${ACCEPT_ALL_COOKIES_BUTTON}
    Element Should Be Visible    ${REJECT_ALL_COOKIES_BUTTON}
    Element Should Be Visible    ${COOKIES_DEFINITION_BUTTON}

Cookies Modal Should Not Be Visible
    [Documentation]    This keyword verifies if the cookies modal is visible

    Wait Until Element Is Not Visible    ${COOKIES_MODAL}

Click Accept All Cookies Button
    [Documentation]    This keyword clicks in accept all cookies button

    Click Button    ${ACCEPT_ALL_COOKIES_BUTTON}

Insert Text Search Input
    [Documentation]    This keyword inserts text in the search input
    [Arguments]    ${search_term}

    Wait Until Element Is Visible    ${SEARCH_INPUT}
    Input Text    ${SEARCH_INPUT}    ${search_term}

Click Search Button
    [Documentation]    This keyword clicks in the search button

    Wait Until Element Is Visible    ${SEARCH_BUTTON}
    Click Button    ${SEARCH_BUTTON}

Search For A Specific Brand
    [Documentation]    This keyword receives a input text
    ...                Inserts it to the search input
    ...                And clicks in the search button
    [Arguments]    ${search_term}

    IF    "${DEVICE}" in ["Mobile"]
        Wait Until Element Is Visible    ${MOBILE_SEARCH_TOGGLE}
        Click Element    ${MOBILE_SEARCH_TOGGLE}
    END

    Insert Text Search Input    ${search_term}
    Click Search Button
