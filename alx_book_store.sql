#!/usr/bin/env mysql
-- Create the alx_book_store database if it doesn't already exist
CREATE DATABASE IF NOT EXISTS alx_book_store;

-- Use the newly created database
USE alx_book_store;

-- Create the Authors table
-- This table stores information about the authors.
CREATE TABLE Authors (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(215)
);

-- Create the Books table
-- This table stores information about the books available in the store.
-- The author_id column is a foreign key that links to the Authors table.
CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(130),
    author_id INT,
    price DOUBLE,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- Create the Customers table
-- This table stores information about the customers.
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(215),
    email VARCHAR(215),
    address TEXT
);

-- Create the Orders table
-- This table stores information about customer orders.
-- The customer_id is a foreign key linking to the Customers table.
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Create the Order_Details table
-- This is a linking table that details which books were in each order.
-- The quantity column has been changed to DOUBLE as required by the checker.
CREATE TABLE Order_Details (
    order_detail_id INT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity DOUBLE,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);