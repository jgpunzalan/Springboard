CREATE DATABASE springboard;

USE springboard;

-- Ticket Sales table schema
-- -------------------------------------
CREATE TABLE ticket_sales (
	ticket_id INT,
	trans_date INT,
	event_id INT,
	event_name VARCHAR(50),
	event_date INT,
	event_type VARCHAR(10),
	event_city VARCHAR(20),
	customer_id INT,
	price DECIMAL,
	num_tickets INT
);