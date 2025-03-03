#Group 7, Axel, Trang and Yacine
*** Settings ***
Documentation     Automatic tests for Jurastina Kalle Park website
Library           SeleniumLibrary
Resource          keywords.robot
Variables         variables.py

*** Test Cases ***
Scenario: Register Account:
    [Documentation]     Test of registration of a user
    [Tags]  test    user    valid    registration    Axel
    Given Browser Is Opened To The Webpage
    And User Clicks On The Register Page
    When User Enters Valid Credentials
    And User Clicks On The Register Button
    Then Register Should Be Successful
    And Terminate Browser Session

Scenario: Invalid Registation With Empty Username
    [Documentation]    Test of invalid registration with empty username field
    [Tags]    test    user    invalid    registration    Trang
    Given Browser Is Opened To The Webpage
    And User Clicks On The Register Page
    When User Enters A Username That Is Too Short
    And User Enter Valid Password
    And User Clicks On The Register Button
    Then The browser should Show A required Field Message
    And Terminate Browser Session

Scenario: Invalid Registation With Too Short Password  
    [Documentation]    Test of invalid registration with too short password
    [Tags]    test     user     invalid    registration    Trang
    Given Browser Is Opened To The Webpage
    And User Clicks On The Register Page
    When User Enters Valid Credentials
    And User Enters A Password That Is Too Short
    And User Clicks On The Register Button
    Then Registration Should Fail With Error Message
    And Terminate Browser Session

Scenario: Valid Login And Logout
    [Documentation]     Test of valid login with valid login
    [Tags]  test    valid   login   Axel    
    Given User Has Registered
    And User Clicks On The Login Page
    When User Enters Valid Credentials To Login
    And User Clicks On The Login Button
    Then Login Should Be Successful
    And User Clicks On The Logout Button
    Then Logout Should Be Successful
    And Terminate Browser Session

Scenario: Invalid Login
    [Documentation]     Test of invalid login with invalid credentials
    [Tags]     test    user    invalid     login    Axel
    Given Browser Is Opened To The Webpage
    When User Arrived At The Login Page
    And Filled In Incorrect Credentials
    Then An Error Saying Invalid Username Or Password Should Appear
    And Terminate Browser Session

Buy One Adult Ticket
    [Documentation]    Testing if a user can buy 1 Adult ticket   
    [Tags]    test    user    buying    ticket    Yacine
    Given User has Registered 
    And User Has Logged In
    When User Navigates to Ticket Page 
    Then User is Able to Purchase Adult Ticket 
    And User Checks Out

Scenario: Buy 2 Adult and 2 Childen VIP Tickets
    [Documentation]     Test of buying 2 adult and 2 children VIP tickets
    [Tags]  test    user    buying    tickets   Axel
    Given User Has Registered
    And User Has Logged In
    When User Navigates To Ticket Page
    And User Is Able To Purchase 2 Adult VIP Ticket And 2 Child VIP Tickets
    Then User Go To The Cart And Confirm Purchase
    And Terminate Browser Session

Book a Tour for a Weekday
    [Documentation]    Testing if a user can book a Safari on a Weekday
    [Tags]    test    user    booking    Safari    weekday    Yacine
    Given User has Registered
    And User Has Logged In
    When User Navigates to Ticket Page
    And User is Able to Purchase Adult Ticket
    Then User Navigates to Booking Page
    And User is Able to Book Herbivore Tour on a Weekday
    Then User Checks Out With One Safari Booked

Book Both Herbivore Tour and T-Rex Rumble on a Weekday
    [Documentation]    Testing wether a user can book both safari options
    [Tags]    test    user    booking    Multiple    Safari    weekday    Yacine
    Given User has Registered
    And User Has Logged In
    When User Navigates to Ticket Page
    And User is Able to Purchase Adult Ticket
    Then User Navigates to Booking Page
    And User is Able to Book Herbivore Tour on a Weekday
    And User is Able to Book T-Rex Rumble on a Weekday
    Then User Checks Out With Two Safaris Booked

Scenario: Successfully booking T-Rex Rumble exTreme Thrill Pack on a weekend
    [Documentation]    Test of booking safari for VIP on Saturday and Sunday
    [Tags]    test    user    booking    safari    weekend    Trang
    Given User Has Registered
    And User Has Logged In
    When User Navigates to Ticket Page
    And User Is Able To Purchase 2 Adult VIP Ticket And 2 Child VIP Tickets
    Then User Navigates to Booking Page
    And User is Able to Books T-Rex Rumble exTreme Thrill Pack on Saturday 
    And User is Able to Books T-Rex Rumble exTreme Thrill Pack on Sunday
    Then User Checks Out With VIP Tickets And Safaris Booked On The Weekend
