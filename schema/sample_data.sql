-- Country → State → City:

-- Country:
INSERT INTO Country (country_name) VALUES 
('India'),
('USA');

-- State:
INSERT INTO State (state_name, country_id) VALUES
('Maharashtra', 1),
('Karnataka', 1),
('California', 2),
('New York', 2),
('Texas', 2);

-- City:
INSERT INTO City (city_name, state_id) VALUES
('Mumbai', 1),
('Pune', 1),
('Bangalore', 2),
('San Francisco', 3),
('Los Angeles', 3),
('New York City', 4),
('Austin', 5);

-- Users & Addresses:

-- Users:
INSERT INTO Users (name, email, phone) VALUES
('Raj Kumar', 'raj@example.com', '9876543210'),
('Aisha Sharma', 'aisha@example.com', '9123456780'),
('John Smith', 'john@example.com', '5551234567'),
('Emily Davis', 'emily@example.com', '5559876543'),
('Arjun Mehta', 'arjun@example.com', '9988776655');

-- Addresses:
INSERT INTO Address (user_id, line1, zipcode, city_id, type) VALUES
(1, 'Flat 12A, Andheri West', '400053', 1, 'Shipping'),
(1, 'Office 220, BKC', '400051', 1, 'Billing'),
(2, 'MG Road Apt 45', '560001', 3, 'Shipping'),
(3, '123 Market St', '94105', 4, 'Shipping'),
(3, '456 Broadway', '10001', 6, 'Billing'),
(4, 'Sunset Blvd Apt 56', '90001', 5, 'Shipping'),
(5, 'Baner Road House 78', '411045', 2, 'Shipping'),
(5, 'IT Park Phase 2', '411057', 2, 'Billing');

-- Products:

INSERT INTO Products (name, category, price, stock_qty) VALUES
('iPhone 14', 'Electronics', 79999.00, 50),
('Samsung Galaxy S23', 'Electronics', 74999.00, 60),
('Sony WH-1000XM5 Headphones', 'Electronics', 29999.00, 40),
('Nike Air Max Shoes', 'Fashion', 8999.00, 100),
('Levi Jeans', 'Fashion', 3999.00, 150),
('Dell XPS 13 Laptop', 'Computers', 124999.00, 20),
('Apple MacBook Air M2', 'Computers', 139999.00, 25),
('Boat Airdopes 141', 'Electronics', 1999.00, 200),
('Puma Sports T-shirt', 'Fashion', 2499.00, 120);

-- Orders & Order_Items:
-- Orders:
INSERT INTO Orders (user_id, total_amount, status) VALUES
(1, 87998.00, 'Completed'),
(2, 3999.00, 'Completed'),
(3, 149998.00, 'Pending'),
(4, 107498.00, 'Completed'),
(5, 104997.00, 'Completed');

-- Order_Items:
INSERT INTO Order_Items (order_id, product_id, quantity, price_at_purchase) VALUES
(1, 1, 1, 79999.00),   -- iPhone 14
(1, 4, 1, 8999.00),    -- Nike Shoes
(2, 5, 1, 3999.00),    -- Levi's Jeans
(3, 6, 1, 124999.00),  -- Dell XPS 13
(3, 3, 1, 24999.00),   -- Sony Headphones
(4, 2, 1, 74999.00),   -- Samsung Galaxy S23
(4, 9, 1, 2499.00),    -- Puma T-shirt
(4, 4, 1, 8999.00),    -- Nike Shoes
(5, 7, 1, 139999.00),  -- MacBook Air
(5, 8, 1, 1999.00);    -- Boat Airdopes

-- Payments:
INSERT INTO Payments (order_id, method, status, amount) VALUES
(1, 'Card', 'Paid', 87998.00),
(2, 'UPI', 'Paid', 3999.00),
(3, 'COD', 'Pending', 149998.00),
(4, 'Card', 'Paid', 107498.00),
(5, 'UPI', 'Paid', 104997.00);


-- NOTE: With this dataset, you can now run queries like:
-- “Top 3 customers by spending”
-- “Most popular category by sales”
-- “Orders per city/state”
