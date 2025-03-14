*** Settings ***
Documentation    Keywords for Kim senario
Library    SeleniumLibrary
Resource    ${EXECDIR}/resources/keywords_files/keywords.robot

*** Keywords ***

User Successfully Accesses Ticket Page
    Page Should Contain    text=Buy Tickets

User Is On The Ticket Page
    User Has Registered And Logged In
    User Navigates To Ticket Page

User Purchases 2 Adult VIP Tickets And 2 Child VIP Tickets
    Wait Until Element Is Visible    ${TICKET_TYPE}
    Add Tickets To Cart    Adult    2
    Add Tickets To Cart    Child    2
    Wait Until Element Is Visible    ${CART_NAV}
    Element Should Be Enabled    ${CHECKOUT_BUTTON}
    
User Successfully Completes Purchase
    Wait Until Element Is Visible    ${CART_NAV}
    Click Element    ${CART_NAV}
    Wait Until Element Is Visible    ${CART_DETAILS}
    Element Should Contain    ${CART_DETAILS}    ${VIP_ADULT}
    Element Should Contain    ${CART_DETAILS}    ${VIP_CHILD}
    Element Should Contain    ${CART_TOTAL}    320
    Element Should Be Enabled    ${CHECKOUT_BUTTON}
    Click Button    ${CHECKOUT_BUTTON}
    Handle Alert    accept    timeout=5s    # Handle any confirmation alert

User Has VIP Tickets
    User Has Registered And Logged In
    User Navigates To Ticket Page
    User Purchases 2 Adult VIP Tickets And 2 Child VIP Tickets

User Books T-Rex Rumble exTreme Thrill Pack on Saturday
    User Navigates to Booking Page
    ${saturday_date}=    Set Variable    2025-03-22    # Example Saturday date
    Check Date Is Weekend    ${saturday_date}
    Input Text    ${SAFARI_DATE}    ${saturday_date}
    Select From List By Index    ${SAFARI_TYPE}    3
    Wait Until Element Is Visible    ${SAFARI_SUBMIT}

User Books T-Rex Rumble exTreme Thrill Pack on Sunday
    User Navigates to Booking Page
    ${sunday_date}=    Set Variable    2025-03-23   # Example Sunday date
    Check Date Is Weekend    ${sunday_date}
    Input Text    ${SAFARI_DATE}    ${sunday_date}
    Select From List By Index    ${SAFARI_TYPE}    3
    Wait Until Element Is Visible    ${SAFARI_SUBMIT}

User Successfully Books The Safari
    Click Button    ${SAFARI_SUBMIT}
    Handle Alert    accept
    Sleep    2

User Has VIP Tickets And Safari Bookings
    User Has VIP Tickets
    User Books T-Rex Rumble exTreme Thrill Pack on Saturday
    User Successfully Books The Safari
    User Books T-Rex Rumble exTreme Thrill Pack on Sunday
    User Successfully Books The Safari

User Proceeds To Checkout
    Wait Until Element Is Visible    ${CART_NAV}
    Click Element    ${CART_NAV}
    Wait Until Element Is Visible    ${CART_DETAILS}
    Element Should Contain    ${CART_DETAILS}    ${VIP_ADULT}
    Element Should Contain    ${CART_DETAILS}    ${VIP_CHILD}
    Element Should Contain    ${CART_DETAILS}    ${TREX_EXTREME}
    Element Should Contain    ${CART_DETAILS}    ${TREX_EXTREME}
    Element Should Contain    ${CART_TOTAL}    760

User Successfully Completes The Checkout Process
    Click Button    ${CHECKOUT_BUTTON}
    Handle Alert    accept