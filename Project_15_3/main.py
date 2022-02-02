import mysql.connector
import pandas as pd

FILE_PATH = "data/third_party_sales_1.csv"

def get_db_connection():
    connection = None
    try:
        connection = mysql.connector.connect(user='root', 
                                           password = 'password',
                                           host='localhost',
                                           port="3306",
                                           database="springboard")
    except Exception as error:
        print("Error while connecting to database for job tracker", error)
    
    return connection

def load_third_party(connection, file_path_csv):
    cursor = connection.cursor()

    df = pd.read_csv(file_path_csv, header=None)

    for ind, row in df.iterrows():
        print(row)



    connection.commit()
    cursor.close()
    return

def query_popular_tickets(connection):
    # Query the data
    statement = "SELECT SOMETHING"
    cursor = connection.cusor()
    cursor.execute(statement)
    records = cursor.fetchall()
    cursor.close()
    return records

def main():
    conn = get_db_connection()
    load_third_party(conn, FILE_PATH)
    # query_popular_tickets(conn)

if __name__ == "__main__":
    main()