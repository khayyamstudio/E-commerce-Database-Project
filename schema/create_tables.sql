--Final PostgreSQL Schema
--1. Users
CREATE TABLE Users (
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

--2. Products
CREATE TABLE Products (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10,2) NOT NULL,
    stock_qty INT DEFAULT 0
);

--3. Orders
CREATE TABLE Orders (
    order_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES Users(user_id),
    order_date TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) DEFAULT 'Pending',
    total_amount DECIMAL(10,2) NOT NULL
);

--4. Order_Items (bridge table)
CREATE TABLE Order_Items (
    order_item_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES Orders(order_id) ON DELETE CASCADE,
    product_id INT REFERENCES Products(product_id),
    quantity INT NOT NULL,
    price_at_purchase DECIMAL(10,2) NOT NULL
);

--5. Payments
CREATE TABLE Payments (
    payment_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES Orders(order_id),
    method VARCHAR(20) CHECK (method IN ('UPI','Card','COD')),
    status VARCHAR(20) DEFAULT 'Pending',
    amount DECIMAL(10,2) NOT NULL,
    transaction_date TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

--6. Address (in 3NF)
--Country
CREATE TABLE Country (
    country_id SERIAL PRIMARY KEY,
    country_name VARCHAR(100) UNIQUE NOT NULL
);
--State
CREATE TABLE State (
    state_id SERIAL PRIMARY KEY,
    state_name VARCHAR(100) NOT NULL,
    country_id INT REFERENCES Country(country_id)
);
--City
CREATE TABLE City (
    city_id SERIAL PRIMARY KEY,
    city_name VARCHAR(100) NOT NULL,
    state_id INT REFERENCES State(state_id)
);
--Address
CREATE TABLE Address (
    address_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES Users(user_id),
    line1 VARCHAR(255) NOT NULL,
    zipcode VARCHAR(20),
    city_id INT REFERENCES City(city_id),
    type VARCHAR(20) CHECK (type IN ('Billing','Shipping'))
);
