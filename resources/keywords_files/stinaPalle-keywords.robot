
*** Settings ***
Documentation    Keywords for Stina-Palle scenario
Library    SeleniumLibrary
Resource    ${EXECDIR}/resources/keywords_files/keywords.robot

*** Keywords ***

User is Able to Purchase Adult Ticket 
    Wait Until Element Is Visible    ${TICKETS_NAV}
    Click Element    ${TICKETS_NAV}
    Wait Until Element Is Visible    ${TICKET_TYPE}
    Click Button    ${ADD_TO_CART}
    Handle Alert    accept
    Sleep    2

User Checks Out
    Wait Until Element Is Visible    ${CART_NAV}
    Click Element    ${CART_NAV}
    Wait Until Element Is Visible    ${CART_DETAILS}
    Element Should Contain    ${CART_DETAILS}    1 Regular Adult Ticket(s) - $50
    Click Button    ${CHECKOUT_BUTTON}
    Handle Alert    accept

User is Able to Book Herbivore Tour on a Weekday
    Title Should be    Jura-Stina-Kalle Park
    Click Element    ${SAFARI_NAV}
    ${weekday_date}=    Set Variable    2025-02-27    # Example date
    Check Date Is Weekday    ${weekday_date}
    Input Text    ${SAFARI_DATE}    ${weekday_date}
    Click Element    ${SAFARI_TYPE}
    Click Element    ${SAFARI_TYPE}
    Wait Until Element Is Visible    ${SAFARI_SUBMIT}
    Click Button    ${SAFARI_SUBMIT}
    Handle Alert    accept
    Sleep    2

User Checks Out With One Safari Booked
    Wait Until Element Is Visible    ${CART_NAV}
    Click Element    ${CART_NAV}
    Wait Until Element Is Visible    ${CART_DETAILS}
    Element Should Contain    ${CART_DETAILS}    ${TICKET}
    Element Should Contain    ${CART_DETAILS}    ${HERBIVORE_SAFARI}
    Click Button    ${CHECKOUT_BUTTON}
    Handle Alert    accept

    
User is Able to Book T-Rex Rumble And Herbivore Tour on a Weekday
    Title Should be    Jura-Stina-Kalle Park
    Click Element    ${SAFARI_NAV}
    ${weekday_date}=    Set Variable    2025-02-27    # Example date
    Check Date Is Weekday    ${weekday_date}
    Input Text    ${SAFARI_DATE}    ${weekday_date}
    Click Element    ${SAFARI_TYPE}
    Click Element    ${SAFARI_TYPE}
    Wait Until Element Is Visible    ${SAFARI_SUBMIT}
    Click Button    ${SAFARI_SUBMIT}
    Handle Alert    accept
    Sleep    2
    ${weekday_date}=    Set Variable    2025-02-27    # Example date
    Check Date Is Weekday    ${weekday_date}
    Input Text    ${SAFARI_DATE}    ${weekday_date}
    Click Element    ${SAFARI_TYPE}
    Select From List By Value    ${SAFARI_TYPE}    T-Rex Rumble
    Wait Until Element Is Visible    ${SAFARI_SUBMIT}
    Click Button    ${SAFARI_SUBMIT}
    Handle Alert    accept
    Sleep    2
    
User Checks Out With Two Safaris Booked
    Wait Until Element Is Visible    ${CART_NAV}
    Click Element    ${CART_NAV}
    Wait Until Element Is Visible    ${CART_DETAILS}
    Element Should Contain    ${CART_DETAILS}    ${TICKET}
    Element Should Contain    ${CART_DETAILS}    ${HERBIVORE_SAFARI}
    Element Should Contain    ${CART_DETAILS}    ${TREX_SAFARI}
    Click Button    ${CHECKOUT_BUTTON}
    Handle Alert    accept
