*** Settings ***
Documentation    This file contains the browser setup

Resource    ../variables/var_default.resource


*** Keywords ***
Set And Open Browser
    [Documentation]    This keyword sets the browser where the tests will run
    [Arguments]    ${current_browser}=${BROWSER}    ${current_device}=${DEVICE}    ${is_headless}=${IS_HEADLESS}

    IF    "${current_browser}" == "${EMPTY}" or "${current_browser}" == "Chrome"
        Set Global Variable    ${BROWSER}    Chrome
        ${driverpath}    Evaluate    webdriver_manager.chrome.ChromeDriverManager().install()    modules=webdriver_manager.chrome

        IF    "${current_device}" == "Desktop" and not ${is_headless}
            ${browser_options}    Set Variable    add_argument("--incognito");add_argument("--start-maximized");add_argument("--disable-search-engine-choice-screen")
        ELSE IF    "${current_device}" == "Desktop" and ${is_headless}
            ${browser_options}    Set Variable    add_argument("--incognito");add_argument("--window-size=1920,1080");add_argument("--disable-search-engine-choice-screen")
        ELSE IF    "${current_device}" == "Mobile"
            ${mobile_emulation}    Set Variable    { "deviceName": "iPhone XR" }
            ${browser_options}    Set Variable    add_argument("--incognito");add_argument("--window-size=414,896");add_experimental_option("mobileEmulation", ${mobile_emulation});add_argument("--disable-search-engine-choice-screen")
        END

        IF    not ${is_headless}
            Open Browser    ${DEFAULT_URL}
            ...             ${current_browser}
            ...             options=${browser_options}
            ...             executable_path=${driverpath}
        ELSE
            Open Browser    ${DEFAULT_URL}
            ...             headlesschrome
            ...             options=${browser_options}
            ...             executable_path=${driverpath}
        END
    ELSE IF    "${current_browser}" == "Firefox"
        Set Global Variable    ${BROWSER}    Firefox
        ${driverpath}    Evaluate    webdriver_manager.firefox.GeckoDriverManager().install()    modules=webdriver_manager.firefox

        IF    "${current_device}" == "Desktop" and not ${is_headless}
            ${browser_options}    Set Variable    add_argument("--private-window");add_argument("--start-maximized")
        ELSE IF    "${current_device}" == "Desktop" and ${is_headless}
            ${browser_options}    Set Variable    add_argument("--private-window");add_argument("--width=1920");add_argument("--height=1080")
        ELSE
            Fail    ***${current_browser}*** is not supported for the ***${current_device}*** device
        END

        IF    not ${is_headless}
            Open Browser    ${DEFAULT_URL}
            ...             ${current_browser}
            ...             options=${browser_options}
            ...             executable_path=${driverpath}
            ...             service_log_path=/dev/null
        ELSE
            Open Browser    ${DEFAULT_URL}
            ...             headlessfirefox
            ...             options=${browser_options}
            ...             executable_path=${driverpath}
            ...             service_log_path=/dev/null
        END
    ELSE IF    "${current_browser}" == "Safari" and "${DEVICE}" in ["iPhone"] and not ${is_headless}
        Set Global Variable    ${BROWSER}    Safari
        Fail    *****${BROWSER}***** is not implemented yet.
    ELSE
        Fail    *****${current_browser}***** is not a supported browser.
    END
