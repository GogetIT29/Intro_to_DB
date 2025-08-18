#!/usr/bin/env python3
import mysql.connector
from mysql.connector import errorcode

# Your MySQL credentials - replace with your actual values
# Use localhost as host
DB_USER = "root"
DB_PASSWORD = "@E$@u29@My$QL"
DB_HOST = "localhost"
DB_PORT = 3306

def create_database(cursor):
    """
    Creates the 'alx_book_store' database if it does not already exist.
    """
    db_name = "alx_book_store"
    try:
        # The 'CREATE DATABASE IF NOT EXISTS' statement ensures the script does not fail if the database already exists.
        cursor.execute(f"CREATE DATABASE IF NOT EXISTS {db_name}")
        print(f"Database '{db_name}' created successfully!")
    except mysql.connector.Error as err:
        print(f"Failed to create database: {err}")

def main():
    """
    Connects to the MySQL server and creates the database.
    Handles connection errors and ensures the connection is closed.
    """
    cnx = None  # Initialize connection variable to None
    try:
        # Establish a connection to the MySQL server
        cnx = mysql.connector.connect(
            user=DB_USER,
            password=DB_PASSWORD,
            host=DB_HOST,
            port=DB_PORT
        )
        print("Connected to MySQL server successfully.")
        
        # Create a cursor object to execute SQL queries
        cursor = cnx.cursor()
        
        # Call the function to create the database
        create_database(cursor)

    except mysql.connector.Error as err:
        # Handle specific MySQL errors
        if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
            print("Something is wrong with your user name or password.")
        elif err.errno == errorcode.ER_BAD_DB_ERROR:
            print("Database does not exist.")
        else:
            print(f"Error connecting to the database: {err}")
    finally:
        # Ensure the connection and cursor are closed, even if an error occurs
        if cnx and cnx.is_connected():
            cursor.close()
            cnx.close()
            print("Connection to MySQL server is closed.")

if __name__ == "__main__":
    main()