#!/usr/bin/python3
"""
This script connects to a MySQL server and creates the database
'alx_book_store' if it does not already exist.
"""
import mysql.connector
from mysql.connector import errorcode

# Your MySQL credentials. In a real-world scenario, these should not be hardcoded.
# For this task, we assume the user is 'root' with no password.
DB_USER = "root"
DB_HOST = "localhost"

# The name of the database to be created
DB_NAME = "alx_book_store"

def create_database():
    """
    Establishes a connection to the MySQL server and creates the
    alx_book_store database if it doesn't exist.
    """
    try:
        # Establish the connection without specifying a database
        cnx = mysql.connector.connect(user=DB_USER, host=DB_HOST)
        cursor = cnx.cursor()

        # SQL command to create the database if it does not exist
        sql_command = "CREATE DATABASE IF NOT EXISTS {}".format(DB_NAME)
        cursor.execute(sql_command)

        # Print success message as required by the task
        print(f"Database '{DB_NAME}' created successfully!")

    except mysql.connector.Error as err:
        # Handle specific MySQL errors
        if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
            print("Something is wrong with your user name or password")
        elif err.errno == errorcode.ER_BAD_DB_ERROR:
            print("Database does not exist")
        else:
            # Print a generic error message for other issues
            print(f"An error occurred: {err}")
    except Exception as e:
        # Handle any other exceptions
        print(f"An unexpected error occurred: {e}")
    finally:
        # This block ensures the cursor and connection are always closed
        if 'cursor' in locals() and cursor is not None:
            cursor.close()
        if 'cnx' in locals() and cnx is not None and cnx.is_connected():
            cnx.close()
            print("Database connection closed.")

if __name__ == "__main__":
    create_database()