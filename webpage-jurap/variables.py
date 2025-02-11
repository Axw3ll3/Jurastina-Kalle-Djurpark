import os

# Directory
current_directory = os.getcwd().replace('\\', '/')

#Browser and URL
URL = f"file:///{current_directory}/webpage-jurap/jurap.html"
BROWSER = "chrome"

# Locators
REGISTER_NAV = "id:register-nav"
TICKETS_NAV = "id:tickets-nav"
CART_NAV = "id:cart-nav"

# Registration Locators
REG_USERNAME = "id:reg-username"
REG_PASSWORD = "id:reg-password"
REG_SUBMIT = "xpath://button[@type='submit']"
REG_MESSAGE = "id:register-message"

# Ticket Purchase Locators
TICKET_TYPE = "id:ticket-type"
TICKET_CATEGORY = "id:ticket-category"
TICKET_QUANTITY = "id:ticket-quantity"
ADD_TO_CART = "xpath://form[@id='ticket-form']//button[@type='submit']"
TICKET_MESSAGE = "id:ticket-message"    # Added for popup message handling

# Cart Locators
CART_DETAILS = "id:cart-details"
CART_TOTAL = "id:cart-total"
CHECKOUT_BUTTON = "id:checkout-button"

# Test Data
USERNAME = "BookingBot"
PASSWORD = "Finneland12"
EXPECTED_SUCCESS_MESSAGE = "Registration successful"

