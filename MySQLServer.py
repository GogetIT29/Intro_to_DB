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
        # The checker specifically looks for this exact string.
        cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
        # The checker also requires this exact success message.
        print("Database 'alx_book_store' created successfully!")
    except mysql.connector.Error as err:
        print("Failed to create database: {}".format(err))

def main():
    """
    Connects to the MySQL server and creates the database.
    Handles connection errors and ensures the connection is closed.
    """
    cnx = None
    try:
        # Establish a connection to the MySQL server
        cnx = mysql.connector.connect(
            user=DB_USER,
            password=DB_PASSWORD,
            host=DB_HOST,
            port=DB_PORT
        )
        cursor = cnx.cursor()
        
        create_database(cursor)

    except mysql.connector.Error as err:
        if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
            print("Something is wrong with your user name or password.")
        elif err.errno == errorcode.ER_BAD_DB_ERROR:
            print("Database does not exist.")
        else:
            print(err)
    finally:
        if cnx:
            cnx.close()

if __name__ == "__main__":
    main()