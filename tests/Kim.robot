*** Settings ***
Library    SeleniumLibrary
Resource    ${EXECDIR}/resources/keywords.robot
Resource    ${EXECDIR}/resources/kim-keywords.robot
Variables    ${EXECDIR}/util/variables.py

Test Setup  Browser Is Opened To The Webpage    ${URL}  ${BROWSER}
Test Teardown   Close All Browsers

*** Test Cases ***

User Logs In
    [Documentation]    Ensure the user is registered and logged in
    Given User Has Registered And Logged In
    When User Navigates to Ticket Page
    Then User Successfully Accesses Ticket Page

User Purchases VIP Tickets
    [Documentation]    Ensure the user can purchase VIP tickets
    Given User Is On The Ticket Page
    When User Purchases 2 Adult VIP Tickets
    Then User Successfully Completes Purchase

User Purchases Child VIP Tickets
    [Documentation]    Ensure the user can purchase child VIP tickets
    Given User Has Purchased Adult VIP Tickets
    When User Purchases 2 Child VIP Tickets
    Then User Successfully Completes Child Ticket Purchase

User Books T-Rex Rumble exTreme Thrill Pack on Saturday
    [Documentation]    Ensure the user can book the safari on Saturday
    Given User Has VIP Tickets
    When User Books T-Rex Rumble exTreme Thrill Pack on Saturday
    Then User Successfully Books The Safari

User Books T-Rex Rumble exTreme Thrill Pack on Sunday
    [Documentation]    Ensure the user can book the safari on Sunday
    Given User Has VIP Tickets
    When User Books T-Rex Rumble exTreme Thrill Pack on Sunday
    Then User Successfully Books The Safari

User Checks Out with Tickets and Bookings
    [Documentation]    Ensure the user can check out successfully
    Given User Has VIP Tickets And Safari Bookings
    When User Proceeds To Checkout
    Then User Successfully Completes The Checkout Process