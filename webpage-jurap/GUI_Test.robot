*** Settings ***
Documentation     Automatic tests for Jurastina Kalle Park website
Library           SeleniumLibrary
Resource          keywords.robot
Variables         variables.py


*** Test Cases ***
Scenario: Register Account:
    [Documentation]     Test of registration of a user
    [Tags]  test    user    registration
    Given Browser Is Opened To The Webpage
    And User Clicks On The Register Page
    When User Enters Valid Credentials
    And User Clicks On The Register Button
    Then Register Should Be Successful
    And Terminate Browser Session

Scenario: Buy 2 Adult and 2 Childen VIP Tickets
    [Documentation]     Test of buying tickets and safari
    [Tags]  test    user    buying    tickets   safari
    Given User Has Registered
    And User Has Logged In
    When User Navigates To Ticket Page
    And User Is Able To Purchase 2 Adult VIP Ticket And 2 Child VIP Tickets
    Then User Go To The Cart And Confirm Purchase
    And Terminate Browser Session

