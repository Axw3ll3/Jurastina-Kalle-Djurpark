import os

# Directory
current_directory = os.getcwd().replace('\\', '/')

url = f"file:///{current_directory}/webpage-jurap/jurap.html"

#Locators
REGISTER_BUTTON = "id:register-nav"
USERNAME_BOX = "id:reg-username"
PASSWORD_BOX = "id:reg-password"

#Test Data
USERNAME = "Bookingbot"
Password = "Finneland12"