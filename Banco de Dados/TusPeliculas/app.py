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

def display_menu():
    print("\nMENU:")
    print("1. View Data")
    print("2. Insert Data")
    print("3. Update Data")
    print("4. Delete Data")
    print("0. Exit")

def view_data(cursor):
    query = 'SELECT * FROM your_table_name'
    cursor.execute(query)

    rows = cursor.fetchall()

    for row in rows:
        print(row)

def insert_data(cursor):
    # Implement logic to insert data
    pass

def update_data(cursor):
    # Implement logic to update data
    pass

def delete_data(cursor):
    # Implement logic to delete data
    pass

def main():
    connection = connect_to_database()
    cursor = connection.cursor()

    while True:
        display_menu()

        choice = input("Enter your choice (0-4): ")

        if choice == "0":
            break
        elif choice == "1":
            view_data(cursor)
        elif choice == "2":
            insert_data(cursor)
        elif choice == "3":
            update_data(cursor)
        elif choice == "4":
            delete_data(cursor)
        else:
            print("Invalid choice. Please try again.")

    cursor.close()
    connection.close()

if __name__ == "__main__":
    main()

