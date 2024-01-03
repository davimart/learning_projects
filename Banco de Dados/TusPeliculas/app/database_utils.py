# database_utils.py
import mysql.connector

def connect_to_database():
    host = input("Enter MySQL host: ")
    database = input("Enter database name: ")
    user = input("Enter username: ")
    password = input("Enter password: ")

    connection = mysql.connector.connect(
        host=host,
        database=database,
        user=user,
        password=password
    )

    return connection

def execute_query(cursor, query, data=None):
    cursor.execute(query, data)
    cursor.connection.commit()
