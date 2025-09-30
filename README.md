# SQL_Library_management_system


Library Management System

This project is a Library Management System built using SQL.
It helps manage books, members, employees, branches, and book issue/return records.


# Files Included

erd.sql → Creates tables (Branch, Employee, Books, Members, Issued Status, Return Status) with relationships.

insert_queries.sql → Adds sample data into all tables.

basic sql operation.sql → Contains example queries and tasks (Insert, Update, Delete, Reports).

CSV Files → Contain raw data for books, members, employees, issued and return status.

library.jpg → ER diagram image of the project.


# Main Features

Add new books, members, employees, and branches.

Issue and return books with proper tracking.

Update and delete records easily.

Generate reports such as:

Books issued by an employee

Members who issued more than one book

Total rental income by category

Books not returned yet

# How to Run

Create a new database:

CREATE DATABASE Library_Management_System;
USE Library_Management_System;


Run erd.sql to create all tables.

Run insert_queries.sql to add sample data.

Use queries from basic sql operation.sql to perform operations and analysis.

# Example Query

Find all books in the "Classic" category:

SELECT * FROM books WHERE category = 'Classic';
