*** Settings ***
Documentation    This file contains the environment setup

Resource    ../variables/var_default.resource


*** Keywords ***
Set Environment
    [Documentation]    This keyword sets the environment where the tests will run
    ...                And load the specific resources for each environment
    [Arguments]    ${current_env}=${ENV}

    IF    "${current_env}" == "${EMPTY}" or "${current_env}" == "TST"
        Set Global Variable    ${ENV}    TST
        Import Resource    ${EXECDIR}/variables/envs/tst.resource
    ELSE IF   "${current_env}" == "STG"
        Set Global Variable    ${ENV}    STG
        Import Resource    ${EXECDIR}/variables/envs/stg.resource
    ELSE
        Fail    *****${current_env}***** is not a valid environment.
    END
