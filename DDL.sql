--database - postgres
	--schema - tejaswi_app
		--tables - 

CREATE TABLE tejaswi_app.users (
    user_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE tejaswi_app.products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    description TEXT,
    stock_quantity INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE tejaswi_app.categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100) UNIQUE NOT NULL,
    description TEXT
);

CREATE TABLE tejaswi_app.orders (
    order_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES tejaswi_app.users(user_id),
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2) NOT NULL,
    status VARCHAR(50) DEFAULT 'Pending'
);

CREATE TABLE tejaswi_app.payments (
    payment_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES tejaswi_app.orders(order_id),
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method VARCHAR(50) NOT NULL,
    payment_amount DECIMAL(10, 2) NOT NULL,
    payment_status VARCHAR(50) DEFAULT 'Completed'
);


INSERT INTO tejaswi_app.users (first_name, last_name, email) 
VALUES 
('Alice', 'Johnson', 'alice.johnson@example.com'),
('Bob', 'Smith', 'bob.smith@example.com'),
('Charlie', 'Brown', 'charlie.brown@example.com'),
('David', 'Williams', 'david.williams@example.com'),
('Eve', 'Davis', 'eve.davis@example.com');


INSERT INTO tejaswi_app.products (product_name, price, description, stock_quantity) 
VALUES 
('Laptop', 1000.00, 'A powerful laptop with 16GB RAM and 512GB SSD', 10),
('Smartphone', 500.00, 'Latest model smartphone with a 6.5-inch display', 20),
('Headphones', 150.00, 'Noise-cancelling wireless headphones', 30),
('Smartwatch', 200.00, 'Water-resistant smartwatch with fitness tracking', 15),
('Tablet', 300.00, 'Portable tablet with 8-inch screen', 25);


INSERT INTO tejaswi_app.categories (category_name, description)
VALUES 
('Electronics', 'All types of electronic gadgets and accessories'),
('Fashion', 'Clothing, shoes, and fashion accessories'),
('Home Appliances', 'Appliances for home use'),
('Toys', 'Toys and games for kids'),
('Sports', 'Sports gear and equipment');



INSERT INTO tejaswi_app.orders (user_id, total_amount, status) 
VALUES 
(1, 1200.00, 'Completed'),
(2, 500.00, 'Pending'),
(3, 350.00, 'Shipped'),
(4, 600.00, 'Pending'),
(5, 700.00, 'Completed');


INSERT INTO tejaswi_app.payments (order_id, payment_method, payment_amount, payment_status) 
VALUES 
(1, 'Credit Card', 1200.00, 'Completed'),
(2, 'PayPal', 500.00, 'Pending'),
(3, 'Debit Card', 350.00, 'Completed'),
(4, 'Credit Card', 600.00, 'Completed'),
(5, 'Bank Transfer', 700.00, 'Completed');
