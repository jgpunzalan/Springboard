import json
from customer import Customer
from account import Account

DATA_FOLDER = "data/"
CUST_LIST_FILE = "customer_list.json"

running = True
customer_dict = {}
cust = None
account = None

def add_to_cust_list(customer_dict):
    with open(DATA_FOLDER + CUST_LIST_FILE,"w") as data_file:
        json.dump(customer_dict, data_file, indent=4)

while running:
    # List Customers to select
    if not cust:
        try:
            with open(DATA_FOLDER + CUST_LIST_FILE,"r") as data_file:
                customer_dict = json.load(data_file)
            print("Customer ID: Customer Name")
            for acct_no, name in customer_dict.items():
                print(f"{acct_no}".ljust(13) + f"{name}")
        except FileNotFoundError as e:
            print("No Customers Exist")
            customer_dict = {}

        # Select active customer or create a new customer
        user_input = input("\nEnter Customer ID for customer to work on, or enter 'new' to create a new customer: ")
        if user_input.lower() == 'exit':
            running = False
        elif user_input.lower() == 'new':
            cust = Customer.create_customer()
            customer_dict[cust.customer_id] = cust.name
            add_to_cust_list(customer_dict)
        elif user_input in customer_dict.keys():
            cust = Customer.load_customer(user_input)
        else:
            print(f"No customer found with Customer ID {user_input}")
    
    # Display customer to open and new account or select and existing account
    if cust and not account:
        cust.display_customer()
        user_input = input("\nEnter Account No for customer to work on, or enter 'new' to create a new account: ")
        if user_input.lower() == 'exit':
            running = False
        elif user_input.lower() == 'back':
            cust = None
        elif user_input.lower() == 'new':
            account = Account.create_account(cust)
            cust.add_new_account(account.account_type, account.account_no)
        elif user_input in cust.products.keys():
            account = Account.load_account(user_input)
        else:
            print(f"\nNo account found with Account No {user_input}.")
            print(f"Please select again.\n")
    
    if cust and account:
        print("---------------------------------------------------------------------------------------")
        print(f"Customer: {cust.name}")
        print(f"Account:  {account.account_no} - {account.account_type}")
        print(f"Balance:  ${account.balance}\n")
        print("Enter transaction and amount seperated by a space: ")
        print("Valid transactions (deposit/withdrawl) ")
        print("E.g. withdrawl 89.30: ")
        user_input = input()
        if user_input.lower() == 'exit':
            running = False
        elif user_input.lower() == 'back':
            account = None
        else:
            inputs = user_input.split()
            action = inputs[0]
            try:
                amount = float(inputs[1])
            except IndexError as ie:
                print("No amount has been provided.  ")
            except ValueError as ve:
                print("Invalid about provided.  ")
            except Exception as e:
                print(e)
                print(type(e))
                continue

            if action.lower() == 'deposit':
                account.deposit(amount)
            elif action.lower() == 'withdrawl':
                account.withdraw(amount)
            else:
                print("Not a valid transaction.\n")


