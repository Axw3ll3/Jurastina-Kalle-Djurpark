*** Settings ***
Library    SeleniumLibrary
Resource    ${EXECDIR}/resources/keywords.robot
Resource    ${EXECDIR}/resources/stinaPalle-keywords.robot

Test Setup  Browser Is Opened To The Webpage    ${URL}  ${BROWSER}
Test Teardown   Close All Browsers

*** Test Cases ***

