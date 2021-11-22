import json
from datetime import date
from sequence import SequenceGenerator

DATA_FOLDER = "data/customers/"
DISPLAY_SPACING = 18

class Customer:
    
    def __init__(self, customer_id=0, name="name", address01="add1", address02="add2", city="city", state="state", zip="99999", email="", phone=""):
        self.customer_id = customer_id
        self.name = name
        self.address01 = address01
        self.address02 = address02
        self.city = city
        self.state = state
        self.zip = zip
        self.email = email
        self.phone = phone
        self.cust_since = str(date.today()) 
        self.products = {}
    
    @staticmethod
    def create_customer():
        """Create a new Customer object and store data in JSON"""
        customer_id = SequenceGenerator.next_val()
        name = input("Enter Name: ")
        address01 = input("Enter Address Line 1: ")
        address02 = input("Enter Address Line 1: ")
        city = input("Enter City: ")
        state = input("Enter State: ")
        zip = input("Enter Zip Code: ")
        email = input("Enter Email: ")
        phone = input("Enter Phone #: ")
        new_customer = Customer(customer_id, name, address01, address02, city, state, zip, email, phone)
        new_customer.save_customer()
        print(f"Customer {customer_id} created. \n")
        return new_customer

    @staticmethod
    def load_customer(customer_id):
        """Finds and returns Customer object based on the customer_id provided"""
        with open(DATA_FOLDER + f"customer_{customer_id}.json","r") as data_file:
            data = json.load(data_file)
        
        customer = Customer(data["customer_id"], data["name"], data["address01"], data["address02"], data["city"], data["state"], data["zip"], data["email"], data["phone"])
        customer.cust_since = data["cust_since"]
        customer.products = data["products"]

        return customer

    def save_customer(self):
        """Stores Customer object into a JSON file"""
        with open(DATA_FOLDER + f"customer_{self.customer_id}.json","w+") as data_file:
            json.dump(self.__dict__, data_file, indent=4)
    
    def display_customer(self):
        """Displays Customer details on console"""
        print("---------------------------------------------------------------------------------------")
        print("Customer ID:".ljust(DISPLAY_SPACING) + f"{self.customer_id}")
        print(f"Name:".ljust(DISPLAY_SPACING) + f"{self.name}")
        print(f"Address:".ljust(DISPLAY_SPACING) + f"{self.address01}")
        if len(self.address02) > 0:
            print(f"".ljust(DISPLAY_SPACING) + f"{self.address02}")
        print(f"".ljust(DISPLAY_SPACING) + f"{self.city}, {self.state} {self.zip}")
        print(f"Email:".ljust(DISPLAY_SPACING) + f"{self.email}")
        print(f"Phone:".ljust(DISPLAY_SPACING) + f"{self.phone}")
        print(f"Customer Since:".ljust(DISPLAY_SPACING) + f"{self.cust_since}")
        print(f"Account(s):".ljust(DISPLAY_SPACING) + f"{self.products}")
    
    def add_new_account(self, account_type, account_no):
        """Adds a new account to customer's products and saves the customer's data to JSON"""
        self.products[str(account_no)] = account_type
        self.save_customer()