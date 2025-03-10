#Group 7, Axel, Trang and Yacine
import os

# Directory
current_directory = os.getcwd().replace('\\', '/')

#Browser and URL
URL = f"file:///{current_directory}/webpage-jurap/jurap.html"
BROWSER = "chrome"

# Locators
REGISTER_NAV = "id:register-nav"
LOGIN_NAV = "id:login-nav"
TICKETS_NAV = "id:tickets-nav"
CART_NAV = "id:cart-nav"
LOGOUT_NAV = "id:logout-nav"

# Registration Locators
REG_USERNAME = "id:reg-username"
REG_PASSWORD = "id:reg-password"
REG_SUBMIT = "xpath://button[@type='submit']"
REG_MESSAGE = "id:register-message"

# Login Locators
LOGIN_USERNAME = "id:login-username"
LOGIN_PASSWORD = "id:login-password"
LOGIN_SUBMIT = "xpath://form[@id='login-form']//button[@type='submit']"
LOGIN_MESSAGE = "id:login-message"


# Ticket Purchase Locators
TICKET_TYPE = "id:ticket-type"
TICKET_CATEGORY = "id:ticket-category"
TICKET_QUANTITY = "id:ticket-quantity"
ADD_TO_CART = "xpath://form[@id='ticket-form']//button[@type='submit']"
TICKET_MESSAGE = "id:ticket-message"    # Added for popup message handling

# Logout Locator
LOGOUT_BUTTON = "id:logout-link"

# Cart Locators
CART_DETAILS = "id:cart-details"
CART_TOTAL = "id:cart-total"
CHECKOUT_BUTTON = "id:checkout-button"

# Test Data
USERNAME = "BookingBot"
PASSWORD = "Finneland12"
EXPECTED_SUCCESS_MESSAGE = "Registration successful"
INVALID_USERNAME = "wrong_user"
INVALID_PASSWORD = "wrong_password"
ERROR_MESSAGE = "id:login-message"

SAFARI_NAV = "id:safari-nav"
SAFARI_DATE = "id:safari-date"
SAFARI_TYPE = "id:safari-type"
SAFARI_SUBMIT = "xpath://form[@id='safari-form']//button[@type='submit']"
HERBIVORE_SAFARI = "Herbivore Tour"
TREX_SAFARI = "T-Rex Rumble"
TREX_EXTREME = "T-Rex Rumble eXtreme Thrill Pack"
TICKET = "Regular Adult Ticket"
CHILD_TICKET = "Regular Child Ticket"
VIP_ADULT = "VIP Adult Ticket"
VIP_CHILD = "VIP Child Ticket"
