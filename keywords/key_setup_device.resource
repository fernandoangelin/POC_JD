*** Settings ***
Documentation    This file contains the devices setup

Resource    ../variables/var_default.resource


*** Keywords ***
Set Device
    [Documentation]    This keyword sets the device where the tests will run
    ...                And loads the correct library for each device
    [Arguments]    ${current_device}=${DEVICE}

    IF    "${current_device}" == "${EMPTY}" or "${current_device}" == "Desktop"
        Set Global Variable    ${DEVICE}    Desktop
        Import Library    SeleniumLibrary
    ELSE IF    "${current_device}" == "Mobile"
        Set Global Variable    ${DEVICE}    Mobile
        Import Library    SeleniumLibrary
    ELSE IF    "${current_device}" == "iPhone"
        Set Global Variable    ${DEVICE}    iPhone
        Import Library    AppiumLibrary
        # It needs to be developed if needed.
        # The MacOS emulator can be configured to run the tests
    ELSE
        Fail    *****${current_device}***** is not a supported device.
    END

Close Environment
    [Documentation]    This keyword closes the environment
    [Arguments]    ${current_device}=${DEVICE}
    IF    "${current_device}" in ["Desktop", "Mobile"]
        Close All Browsers
    ELSE IF    "${current_device}" in ["iPhone"]
        Close Application
    ELSE
        Fail    *****${current_device}***** is not a supported device.
    END
