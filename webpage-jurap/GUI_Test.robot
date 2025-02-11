*** Settings ***
Documentation
Library           SeleniumLibrary
Resource          keywords.robot
Variables         variables.py


*** Test Cases ***
Scenario: Register Account:
    [Documentation]
    [Tags]
    Given Browser Is Opened To The Webpage
    And User Clicks On The Register Page
    When User Enters Valid Credentials
    And User Clicks On The Register Button
    Then Register Should Be Successful

Scenario: Buy 2 Adult and 2 Childen VIP Tickets
    [Documentation]
    [Tags]
    Given User Has Registered
    And User Has Logged In
    When User Navigates To Ticket Page
    Then User Is Able To Purchase 2 Adult VIP Ticket And 2 Child VIP Tickets
    