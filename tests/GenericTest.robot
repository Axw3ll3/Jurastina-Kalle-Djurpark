*** Settings ***
Documentation     Automatic tests for Jurastina Kalle Park website
Library           SeleniumLibrary
Resource          ${EXECDIR}/resources/keywords_files/keywords.robot    

Test Setup  Browser Is Opened To The Webpage    ${URL}  ${BROWSER}
Test Teardown   Close All Browsers

*** Test Cases ***
Scenario: Register Account:
    [Documentation]     Test of registration of a user
    [Tags]  test    user    registration    Axel    Axel_Refactor
    Given User Clicks On The Register Page
    When User Enters Valid Credentials
    And User Clicks On The Register Button
    Then Register Should Be Successful

Scenario: Valid Login
    [Documentation]     Test of valid login with valid login
    [Tags]  test    valid   login   Axel    Axel_Refactor
    Given User Has Registered
    And User Clicks On The Login Page
    When User Enters Valid Credentials To Login
    And User Clicks On The Login Button
    Then Login Should Be Successful

Scenario: Logout
    [Documentation]    Test of logout function
    [Tags]    test    logout    Axel    new-feature
    Given User Has Registered And Logged In
    When User Clicks On The Logout Button
    Then Logout Should Be Successful

Scenario: Invalid Login
    [Documentation]     Test of invalid login with invalid credentials
    [Tags]     test    user    invalid     Axel
    Given User Arrived At The Login Page
    When Filled In Incorrect Credentials
    Then An Error Saying Invalid Username Or Password Should Appear


Scenario: Invalid Registation With Empty Username
    [Documentation]    Test of invalid registration with empty username field
    [Tags]    test    user    invalid    registration    Trang    Trang_Refactor
    Given User Clicks On The Register Page
    When User Enters A Username That Is Too Short
    And User Enter Valid Password
    Then The browser should Show A required Field Message


Scenario: Invalid Registation With Too Short Password  
    [Documentation]    Test of invalid registration with too short password
    [Tags]    test     user     invalid    registation    Trang    Trang_Refactor
    Given User Clicks On The Register Page
    When User Enters Valid Credentials
    And User Enters A Password That Is Too Short
    Then Registration Should Fail With Error Message

Buy One Adult Ticket
    [Documentation]    Testing if a user can buy 1 Adult ticket   
    [Tags]    test    user    Buy    ticket    Yacine
    Given User has Registered And Logged In
    When User Navigates to Ticket Page 
    Then User is Able to Purchase Adult Ticket 
    And User Checks Out

Book a Tour for a Weekday
    [Documentation]    Testing if a user can book a Safari on a Weekday
    [Tags]    test    user    book    Safari    Yacine
    Given User has Registered And Logged In
    When User Navigates to Ticket Page
    And User is Able to Purchase Adult Ticket
    Then User Navigates to Booking Page
    And User is Able to Book Herbivore Tour on a Weekday
    Then User Checks Out With One Safari Booked

Book Both Herbivore Tour and T-Rex Rumble on a Weekday
    [Documentation]    Testing wether a user can book both safari options
    [Tags]    test    user    book    Multiple    Safari    Yacine
    Given User has Registered And Logged In
    When User Navigates to Ticket Page
    And User is Able to Purchase Adult Ticket
    Then User Navigates to Booking Page
    And User is Able to Book Herbivore Tour on a Weekday
    And User is Able to Book T-Rex Rumble on a Weekday
    Then User Checks Out With Two Safaris Booked

