-- Question 5: Online Shopping Management System
-- A. Theory:
-- Explain how INSERT, UPDATE, and DELETE commands are used to modify records in SQL. Explain how GROUP BY is used with aggregate functions such as COUNT(), SUM(), and AVG() to summarize data. Also explain how HAVING differs from WHERE when filtering query results.
-- B. Practical:
-- Create an Online Shopping Management System using Customer and Orders tables.
-- 1. Create both tables with suitable attributes and apply Primary Key and Foreign Key constraints.
-- 2. Apply suitable NOT NULL, UNIQUE, DEFAULT, and CHECK constraints.
-- 3. Insert at least 5 customer records and 5 order records.
-- 4. Display orders whose total amount is greater than ₹5,000.
-- 5. Calculate the total order amount for each customer using GROUP BY and SUM().
-- 6. Display customers whose total order amount exceeds ₹10,000 using HAVING.
-- 7. Find the average order amount using AVG().
-- 8. Update the status of a particular order.
-- 9. Delete an order based on a suitable condition.
-- 10. Add a new column to the Orders table using ALTER.
-- 11. Display the final order records.

CREATE DATABASE mall;
USE mall;

CREATE TABLE customer (
	customer_id INT PRIMARY KEY AUTO_InCREMENT,
	customer_name VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE orders (
	order_id    INT PRIMARY KEY,
    customer_id INT NOT NULL,
    amount INT CHECK (amount >= 0),
    order_date  DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

INSERT INTO customer (customer_id, customer_name, city, email) VALUES
(1, 'Amit',  'Ludhiana',   'amit@mail.com'),
(2, 'Neha',   'Delhi',      'neha@mail.com'),
(3, 'Rohan',  'Mumbai',     'rohan@mail.com'),
(4, 'Priya',  'Chandigarh', 'priya@mail.com'),
(5, 'Simran',  'Ludhiana',   'simran@mail.com');

INSERT INTO orders (order_id, customer_id, amount, order_date) VALUES
(301, 1, 4500, '2026-01-05'),
(302, 2, 6480, '2026-01-08'),
(304, 3, 11750, '2026-01-20'),
(305, 4, 4680, '2026-02-02'),
(308, 5, 1030, '2026-03-01');

select * from orders where amount > 5000;

select customer_id, SUM(amount) AS total_amount FROM orders GROUP BY customer_id;

select customer_id, SUM(amount) AS total_amount FROM orders
GROUP BY customer_id HAVING SUM(amount) > 10000;

select avg(amount) from orders;
update orders set amount = 2030 where customer_id = 5;

DELETE FROM orders WHERE customer_id = 5;

ALTER TABLE Orders ADD rating INT;
update orders set rating = 3 where customer_id = 1;
update orders set rating = 4 where customer_id = 2;
update orders set rating = 5 where customer_id = 3;
update orders set rating = 2 where customer_id = 4;
update orders set rating = 1 where customer_id = 5;

select * from orders;
