*** Settings ***
Library    SeleniumLibrary
Resource    ${EXECDIR}/resources/keywords_files/keywords.robot
Resource    ${EXECDIR}/resources/keywords_files/stinaPalle-keywords.robot

Test Setup  Browser Is Opened To The Webpage    ${URL}  ${BROWSER}
Test Teardown   Close All Browsers

*** Test Cases ***
Buy One Adult Ticket
    [Documentation]    Testing if a user can buy 1 Adult ticket   
    [Tags]    test    user    Buy    ticket    Yacine_refactor
    Given User has Registered And Logged In
    When User is Able to Purchase Adult Ticket 
    Then User Checks Out

Book a Tour for a Weekday
    [Documentation]    Testing if a user can book a Safari on a Weekday
    [Tags]    test    user    book    Safari    Yacine_refactor
    Given User has Registered And Logged In
    When User is Able to Purchase Adult Ticket
    And User is Able to Book Herbivore Tour on a Weekday
    Then User Checks Out With One Safari Booked

Book Both Herbivore Tour and T-Rex Rumble on a Weekday
    [Documentation]    Testing wether a user can book both safari options
    [Tags]    test    user    book    Multiple    Safari    Yacine_refactor
    Given User has Registered And Logged In
    And User is Able to Purchase Adult Ticket
    When User is Able to Book T-Rex Rumble And Herbivore Tour on a Weekday
    Then User Checks Out With Two Safaris Booked
