**SQL Task:** 
Create a database and tables to manage a simple e-commerce system. 
The system should have three tables: customers, orders, and products.

**Database Structure**
The goal of this project is to design and implement a database structure to manage a simple e-commerce system. The system will consist of three tables: customers, orders, and products.
Each table will serve a distinct role in the management of customer data, product information, and order tracking.

Customers: Stores customer information like name, email, and address.
Orders: Tracks orders placed by customers, including the order date and total amount.
Products: Contains details about the products available for purchase, including name, price, and description.

**Setup Instructions**
Install MySQL: Ensure you have MySQL installed and running on your system.

Run the SQL Script: Execute the provided SQL script (ecommerce.sql) in your MySQL client. This script will create the database, tables, and insert sample data. You can use any MySQL client, such as MySQL Workbench or the command-line client.

mysql -u your_username -p < ecommerce.sql
Replace your_username with your MySQL username.

**SQL Queries**
The SQL script includes the following queries:

1.Retrieve customers with orders in the last 30 days: 
 This query gets the names of customers who have made a purchase within the last 30 days.
 
2.Total order amount per customer: Calculates the total amount of orders for each customer:
  This query sums up the total value of all orders made by each customer.

3.Update product price: Updates the price of a specific product:
  This query updates the price of a specific product (Product C).

4.Add discount column: Adds a discount column to the products table:
  This query adds a new column to the Products table to store discount values.

5.Top 3 highest priced products: Retrieves the top 3 products with the highest prices.
  This query retrieves the three most expensive products in the store.
  
6.Customers who ordered Product A: Finds the names of customers who have ordered a specific product.
  This query retrieves the names of customers who have ordered Product A.
  
7.Join orders and customers: Joins the orders and customers tables to display customer names and order dates.
  This query fetches the customer's name along with the order date for each order.
  
8.Orders with total amount > 150: Retrieves orders with a total amount greater than 150.
  This query gets all orders where the total amount exceeds 150.00.

9.Database Normalization: Creates the order_items table, removes the total_amount from the orders table, and then adds it back as a calculated value.
  This step is used to store details about products in individual orders, using a separate 'order_items' table.
  
10.Average order total: Calculates the average total amount of all orders.
  This query calculates the average total amount of all the orders.
  
File Contents
SQL Task.sql: Contains the SQL script to create the database, tables, insert sample data, and run the queries.
README.md: This file, providing project documentation.

**Notes**
The database is normalized by the creation of the order_items table. This helps to prevent data redundancy and improve data integrity.
The total_amount in the orders table is calculated based on the data in the order_items and products tables.
Make sure to change the mysql user and password in the command line instruction to match your local setup.
Sql/README.md
