*** Settings ***
Documentation     Keywords for Jurastina-Kalle park
Library           SeleniumLibrary
Variables         variables.py


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

Terminate Browser Session
    Close All Browsers