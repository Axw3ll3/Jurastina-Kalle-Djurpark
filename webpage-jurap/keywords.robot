*** Settings ***
Documentation    Keywords for Jurastina-Kalle park
Library    SeleniumLibrary
Variables   variables.py
Resource   variables.robot


*** Keywords ***
Browser Is Opened To The Webpage
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    ${REGISTER_NAV}

User Clicks On The Register Page
    Click Element    ${REGISTER_NAV}
    Wait Until Element Is Visible    ${REG_USERNAME}

User Enters Valid Credentials
    Input Text    ${REG_USERNAME}    ${USERNAME}
    Input Text    ${REG_PASSWORD}    ${PASSWORD}

User Clicks On The Register Button
    Click Button    ${REG_SUBMIT}
    Wait Until Element Is Visible    ${REG_MESSAGE}

Register Should Be Successful
    Element Should Contain    ${REG_MESSAGE}    ${EXPECTED_SUCCESS_MESSAGE}

User Has Registered
    Browser Is Opened To The Webpage
    User Clicks On The Register Page
    User Enters Valid Credentials
    User Clicks On The Register Button
    Register Should Be Successful
    Sleep    2s    # Wait for registration to complete

User Has Logged In
    Wait Until Element Is Visible    ${LOGIN_NAV}
    Click Element    ${LOGIN_NAV}
    Wait Until Element Is Visible    ${LOGIN_USERNAME}
    Input Text    ${LOGIN_USERNAME}    ${USERNAME}
    Input Text    ${LOGIN_PASSWORD}    ${PASSWORD}
    Click Button    ${LOGIN_SUBMIT}
    Wait Until Element Is Visible    ${TICKETS_NAV}
    Sleep    2s    # Wait for login to complete

User Navigates To Ticket Page
    Wait Until Element Is Visible    ${TICKETS_NAV}
    Click Element    ${TICKETS_NAV}
    Wait Until Element Is Visible    ${TICKET_TYPE}

Add Tickets To Cart
    [Arguments]    ${type}    ${quantity}
    Select From List By Value    ${TICKET_TYPE}    ${type}
    Select From List By Value    ${TICKET_CATEGORY}    VIP
    Input Text    ${TICKET_QUANTITY}    ${quantity}
    Click Button    ${ADD_TO_CART}
    Handle Alert    accept    timeout=5s
    Sleep    1s    # Wait for cart to update

User Is Able To Purchase 2 Adult VIP Ticket And 2 Child VIP Tickets
    # Purchase Adult VIP Tickets
    Wait Until Element Is Visible    ${TICKET_TYPE}
    Add Tickets To Cart    Adult    2

    # Purchase Child VIP Tickets
    Add Tickets To Cart    Child    2

    # Verify Cart
    Wait Until Element Is Visible    ${CART_NAV}
    Element Should Be Enabled    ${CHECKOUT_BUTTON}

User Go To The Cart And Confirm Purchase
    Wait Until Element Is Visible    ${CART_NAV}
    Click Element    ${CART_NAV}
    Wait Until Element Is Visible    ${CART_DETAILS}
    Element Should Contain    ${CART_DETAILS}    2 VIP Adult Ticket(s) - $200
    Element Should Contain    ${CART_DETAILS}    2 VIP Child Ticket(s) - $120
    Element Should Be Enabled    ${CHECKOUT_BUTTON}
    Click Button    ${CHECKOUT_BUTTON}
    Handle Alert    accept    timeout=5s    # Handle any confirmation alert

When User Arrived At The Login Page
    Click Element    ${LOGIN_NAV}
    Wait Until Element Is Visible    ${LOGIN_NAV}
    Element Should Be Visible    ${LOGIN_USERNAME}
    Element Should Be Visible    ${LOGIN_PASSWORD}

And Filled In Incorrect Credentials
    Input Text    ${LOGIN_USERNAME}    ${INVALID_USERNAME}
    Input Text    ${LOGIN_PASSWORD}    ${INVALID_PASSWORD}
    Click Button    ${LOGIN_SUBMIT}


Then An Error Saying Invalid Username Or Password Should Appear
    Wait Until Element Contains    ${ERROR_MESSAGE}    Invalid username or password.    timeout=10s
    Element Text Should Be    ${ERROR_MESSAGE}    Invalid username or password.
    [Teardown]    Close Browser


Terminate Browser Session
    Close All Browsers

# Yacine
User is Able to Purchase Adult Ticket 
    Click Button    ${ADD_TO_CART}
    Handle Alert    accept
    Sleep    2

# Yacine
User Checks Out
    Wait Until Element Is Visible    ${CART_NAV}
    Click Element    ${CART_NAV}
    Wait Until Element Is Visible    ${CART_DETAILS}
    Element Should Contain    ${CART_DETAILS}    1 Regular Adult Ticket(s) - $50
    Click Button    ${CHECKOUT_BUTTON}
    Handle Alert    accept
    Close Browser

# Yacine
User Navigates to Booking Page
    Title Should be    Jura-Stina-Kalle Park
    Click Element    ${SAFARI_NAV}

# Yacine
User is Able to Book Herbivore Tour on a Weekday
    Click Element    ${SAFARI_DATE}
    Input Text    ${SAFARI_DATE}    ${VALID_DATE}
    Click Element    ${SAFARI_TYPE}
    Click Element    ${SAFARI_TYPE}
    Wait Until Element Is Visible    ${SAFARI_SUBMIT}
    Click Button    ${SAFARI_SUBMIT}
    Handle Alert    accept
    Sleep    2

# Yacine
User Checks Out With One Safari Booked
    Wait Until Element Is Visible    ${CART_NAV}
    Click Element    ${CART_NAV}
    Wait Until Element Is Visible    ${CART_DETAILS}
    Element Should Contain    ${CART_DETAILS}    1 Regular Adult Ticket(s) - $50
    Element Should Contain    ${CART_DETAILS}    Herbivore Tour on 200025-03-19 - $120
    Click Button    ${CHECKOUT_BUTTON}
    Handle Alert    accept
    Close Browser
    
# Yacine
User is Able to Book T-Rex Rumble on a Weekday
    Click Element    ${SAFARI_DATE}
    Input Text    ${SAFARI_DATE}    ${VALID_DATE}
    Click Element    ${SAFARI_TYPE}
    Select From List By Value    ${SAFARI_TYPE}    T-Rex Rumble
    Wait Until Element Is Visible    ${SAFARI_SUBMIT}
    Click Button    ${SAFARI_SUBMIT}
    Handle Alert    accept
    Sleep    2
    
# Yacine
User Checks Out With Two Safaris Booked
    Wait Until Element Is Visible    ${CART_NAV}
    Click Element    ${CART_NAV}
    Wait Until Element Is Visible    ${CART_DETAILS}
    Element Should Contain    ${CART_DETAILS}    1 Regular Adult Ticket(s) - $50
    Element Should Contain    ${CART_DETAILS}    Herbivore Tour on 200025-03-19 - $120
    Element Should Contain    ${CART_DETAILS}    T-Rex Rumble on 200025-03-19 - $150
    Click Button    ${CHECKOUT_BUTTON}
    Handle Alert    accept
    Close Browser
