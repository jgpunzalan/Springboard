import json
from datetime import date
from sequence import SequenceGenerator
from customer import Customer

DATA_FOLDER = "data/accounts/"
DISPLAY_SPACING = 18

class Account:

    def __init__(self, account_no, customer_id, account_type, balance=0, open_date=str(date.today())):
        self.account_no = account_no
        self.customer_id = customer_id
        self.account_type = account_type
        self.balance = balance
        self.open_date = open_date
    
    @staticmethod
    def create_account(customer: Customer):
        """Create a new Account object and store data in JSON"""
        account_no = str(SequenceGenerator.next_val())
        customer_id = customer.customer_id
        account_type = input("Enter Savings or Checking: ")
        balance = float(input("Enter starting balance: "))
        new_account = Account(account_no, customer_id, account_type, balance)
        new_account.save_account()
        print(f"New account {account_no} created.\n")
        return new_account

    def save_account(self):
        """Stores Account object into a JSON file"""
        with open(DATA_FOLDER + f"account_{self.account_no}.json","w+") as data_file:
            json.dump(self.__dict__, data_file, indent=4)

    @staticmethod
    def load_account(account_no):
        """Finds and returns Account object based on the account_no provided"""
        with open(DATA_FOLDER + f"account_{account_no}.json","r") as data_file:
            data = json.load(data_file)
        
        return Account(data["account_no"], data["customer_id"], data["account_type"], data["balance"], data["open_date"])
    
    def display_balance(self):
        """Displays account balance on console"""
        print("Current Balance: {self.balance}")
    
    def deposit(self, amount):
        """Adds amount to to account balance"""
        self.balance += amount
        self.save_account()
        print(f"{amount} deposited.\n")
    
    def withdraw(self, amount):
        """Deducts amount from account balance is amount is available"""
        if self.balance < amount:
            print("Insufficient Funds.\n")
        else:
            self.balance -= amount
            self.save_account()
            print(f"{amount} withdrawn.\n")
    
