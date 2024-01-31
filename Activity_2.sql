-- Active: 1706530240114@@127.0.0.1@5432@tjDB
CREATE TABLE customers(
	customer_id INT PRIMARY KEY,
	first_name VARCHAR(100) NOT NULL,
	last_name VARCHAR(100) NOT NULL
);

INSERT INTO customers (customer_id, first_name, last_name) VALUES
(1, 'Juan', 'Cruz'),
(2, 'Anne', 'Wall'),
(3, 'Theresa', 'Joseph'),
(4,'Ingram', 'Howard'),
(5,'Dhanniela', 'Lopez')

CREATE TABLE orders(
	order_id INT PRIMARY KEY,
	order_date DATE,
	customer_id INT,
	CONSTRAINT fk_customer_id
		FOREIGN KEY(customer_id)
			REFERENCES customers(customer_id)
);

INSERT INTO orders (order_id, order_date, customer_id) VALUES
(11, 3012024, 1),
(22, 3012024, 1),
(33, 3012024, 2),
(44, 3012024, 3),
(55, 3012024, 3),
(66, 3012024, 4)

SELECT *
FROM customers

SELECT *
FROM orders

SELECT c.customer_id, c.first_name, o.order_id
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;


SELECT c.first_name, c.last_name, COUNT(o.order_id) AS number_of_orders
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id
HAVING COUNT (o.order_id) > 1;