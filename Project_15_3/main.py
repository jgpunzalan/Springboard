import mysql.connector
import pandas as pd

FILE_PATH = "./data/third_party_sales_1.csv"

def get_db_connection():
    connection = None
    try:
        connection = mysql.connector.connect(user='username', 
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
    insert_sql = "INSERT INTO springboard.ticket_sales VALUES(%s, %s, %s, %s, %s, %s, %s, %s, %s, %s); "
    for ind, row in df.iterrows():
        cursor.execute(insert_sql,tuple(row))



    connection.commit()
    cursor.close()
    return

def query_popular_tickets(connection):
    # Query the data
    statement = """SELECT event_id, event_name, sum(num_tickets) tickets_sold
                   FROM springboard.ticket_sales
                   GROUP BY event_id
                   ORDER BY sum(num_tickets) DESC
                   LIMIT 3;"""
    cursor = connection.cursor()
    cursor.execute(statement)
    records = cursor.fetchall()
    cursor.close()
    return records

def display_popular_events(records):
    print("Top 3 most popular events")
    for rec in records:
        print(f"  - {rec[1]}")


def main():
    conn = get_db_connection()
    load_third_party(conn, FILE_PATH)
    recs = query_popular_tickets(conn)
    display_popular_events(recs)

if __name__ == "__main__":
    main()