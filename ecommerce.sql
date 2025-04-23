-- Create the database
CREATE database ECommerce ;

-- Use the ecommerce database
USE ecommerce;


CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    address VARCHAR(150)
);

-- Insert sample data into the Customers table
-- These are example records representing the customers in the system.
INSERT INTO customers (name, email, address) 
VALUES
    ('Kiruthika', 'kivikiruthika97@gmail.com', '51 mountain view, coimbatore'),
    ('Naveen', 'naveen@gmail.com', '456 main st, Tiruppur'),
    ('Gugan', 'gugan@gmail.com', '789 Palani st, Coimbatore'),
    ('gayathri', 'gayathri@gmail.com', '104 old st, Dindigul'),
    ('Saravana', 'sara97@gmail.com', '157 shanthi st, Tiruppur');

-- Retrieve all records from the Customers table
SELECT * FROM customers;

-- Create the Orders Table
-- This table stores the details of orders placed by customers.
-- It includes a reference to the customer (customer_id), order date, and total amount.
CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

-- Insert sample data into the Orders table
-- These are example records representing the orders placed by customers.
INSERT INTO orders (customer_id, order_date, total_amount)
VALUES
    (3, '2024-09-15', 350.00),
    (1, '2024-10-03', 100.00),
    (2, '2024-10-10', 140.00),
    (4, '2024-09-10', 170.00),
    (1, '2024-10-08', 60.00);

-- Retrieve all records from the Orders table
SELECT * FROM orders;


-- Create the Products Table
-- This table stores details about the products available in the store.
CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10, 2),
    description TEXT
);

-- Insert sample data into the Products table
-- These are example records representing the products.
INSERT INTO products (name, price, description)
VALUES
    ('Product A', 80.00, 'Description for Product A'),
    ('Product B', 100.00, 'Description for Product B'),
    ('Product C', 50.00, 'Description for Product C');

-- Retrieve all records from the Products table
SELECT * FROM products;


-- Queries:

-- 1. Retrieve all customers who have placed an order in the last 30 days.
-- This query gets the names of customers who have made a purchase within the last 30 days.

SELECT DISTINCT customers.name 
FROM customers 
JOIN orders ON customers.id = orders.customer_id
WHERE orders.order_date >= CURDATE() - INTERVAL 30 DAY;

-- 2. Get the total amount of all orders placed by each customer.
-- This query sums up the total value of all orders made by each customer.

SELECT customers.name, SUM(orders.total_amount) AS total_amount 
FROM customers
JOIN orders ON customers.id = orders.customer_id
GROUP BY customers.name;

-- 3. Update the price of Product C to 45.00.
-- This query updates the price of a specific product (Product C).

UPDATE products 
SET price = 45.00
WHERE id = 3;

-- Alternative

UPDATE products 
SET price = 45.00
WHERE name = 'Product C';

-- Verify the update
SELECT * FROM products;

-- 4 Add a new column 'discount' to the Products table.
-- This query adds a new column to the Products table to store discount values.

ALTER TABLE products ADD COLUMN discount DECIMAL(5, 2) DEFAULT 0.00;

-- Verify the new column
SELECT * FROM products;

-- 5. Retrieve the top 3 products with the highest price.
-- This query retrieves the three most expensive products in the store.

SELECT name, price 
FROM products 
ORDER BY price DESC 
LIMIT 3;

-- 6 Get the names of customers who have ordered Product A.
-- This query retrieves the names of customers who have ordered Product A.

SELECT DISTINCT customers.name
FROM customers
JOIN orders ON customers.id = orders.customer_id
JOIN order_items ON orders.id = order_items.order_id
JOIN products ON order_items.product_id = products.id
WHERE products.name = 'Product A';

-- 7 Join the orders and customers tables to retrieve the customer's name and order date for each order.
-- This query fetches the customer's name along with the order date for each order.

SELECT customers.name, orders.order_date 
FROM customers
JOIN orders ON customers.id = orders.customer_id;

-- 8 Retrieve the orders with a total amount greater than 150.00.
-- This query gets all orders where the total amount exceeds 150.00.

SELECT * FROM orders WHERE total_amount > 150;

-- 9 Normalize the database by creating a separate table for order items and updating the orders table to reference the order_items table.
-- This step is used to store details about products in individual orders, using a separate 'order_items' table.

CREATE TABLE order_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Insert data into the order_items table
-- These records link specific products to the respective orders with quantities.
INSERT INTO order_items (order_id, product_id, quantity)
VALUES
    (1, 1, 1),
    (2, 2, 2),
    (3, 2, 1),
    (4, 1, 1);

-- Verify the insertion
SELECT * FROM order_items;

-- 10 Retrieve the average total of all orders.
-- This query calculates the average total amount of all the orders.

SELECT AVG(total_amount) FROM orders;
