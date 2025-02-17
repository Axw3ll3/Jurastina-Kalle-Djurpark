*** Settings ***
Documentation     Automatic tests for Jurastina Kalle Park website
Library           SeleniumLibrary
Resource          keywords.robot
Variables         variables.py


*** Test Cases ***
Scenario: Register Account:
    [Documentation]     Test of registration of a user
    [Tags]  test    user    registration    Axel
    Given Browser Is Opened To The Webpage
    And User Clicks On The Register Page
    When User Enters Valid Credentials
    And User Clicks On The Register Button
    Then Register Should Be Successful
    And Terminate Browser Session

Scenario: Buy 2 Adult and 2 Childen VIP Tickets
    [Documentation]     Test of buying tickets and safari
    [Tags]  test    user    buying    tickets   safari  Axel
    Given User Has Registered
    And User Has Logged In
    When User Navigates To Ticket Page
    And User Is Able To Purchase 2 Adult VIP Ticket And 2 Child VIP Tickets
    Then User Go To The Cart And Confirm Purchase
    And Terminate Browser Session

Scenario: Invalid Login
    [Documentation]     Test of invalid login with invalid credentials
    [Tags]     test    user    invalid     Axel
    Given Browser Is Opened To The Webpage
    When User Arrived At The Login Page
    And Filled In Incorrect Credentials
    Then An Error Saying Invalid Username Or Password Should Appear
    And Terminate Browser Session

Buy One Adult Ticket
    [Documentation]    Testing if a user can buy 1 Adult ticket   
    [Tags]    test    user    Buy    ticket    Yacine
    Given User has Registered 
    And User Has Logged In
    When User Navigates to Ticket Page 
    Then User is Able to Purchase Adult Ticket 
    And User Checks Out

Book a Tour for a Weekday
    [Documentation]    Testing if a user can book a Safari on a Weekday
    [Tags]    test    user    book    Safari    Yacine
    Given User has Registered
    And User Has Logged In
    When User Navigates to Ticket Page
    And User is Able to Purchase Adult Ticket
    Then User Navigates to Booking Page
    And User is Able to Book Herbivore Tour on a Weekday
    Then User Checks Out With One Safari Booked

Book Both Herbivore Tour and T-Rex Rumble on a Weekday
    [Documentation]    Testing wether a user can book both safari options
    [Tags]    test    user    book    Multiple    Safari    Yacine
    Given User has Registered
    And User Has Logged In
    When User Navigates to Ticket Page
    And User is Able to Purchase Adult Ticket
    Then User Navigates to Booking Page
    And User is Able to Book Herbivore Tour on a Weekday
    And User is Able to Book T-Rex Rumble on a Weekday
    Then User Checks Out With Two Safaris Booked

Scenario: Successfully booking T-Rex Rumble exTreme Thrill Pack on a weekend
    [Documentation]    # Test of booking safari for VIP on Saturday and Sunday
    [Tags]    test    user    booking    safari    Trang
    Given User Has Registered
    And User Has Logged In
    When User Navigates to Ticket Page
    And User Is Able To Purchase 2 Adult VIP Ticket And 2 Child VIP Tickets
    Then User Navigates to Booking Page
    And User is Able to Books T-Rex Rumble exTreme Thrill Pack on Saturday 
    And User is Able to Books T-Rex Rumble exTreme Thrill Pack on Sunday
    Then User Checks Out With VIP Tickets And Safaris Booked On The Weekend
