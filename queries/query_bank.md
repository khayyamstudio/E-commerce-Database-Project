# E-commerce Query Bank
A collection of example SQL queries for an e-commerce project, organized by complexity. These queries cover user, product, order, and analytics operations.
# Basic Queries

**List all users**
<br>
`SELECT user_id, name, email, phone FROM Users;`

**List all products with stock**
<br>
`SELECT name, category, price, stock_qty FROM Products;`

**Show all completed orders**
<br>
`SELECT order_id, user_id, total_amount, status 
FROM Orders 
WHERE status = 'Completed';`

**Get addresses of a user** ***(example for user_id = 1)***
<br>
`SELECT u.name, a.line1, c.city_name, s.state_name, co.country_name
FROM Address a
JOIN City c ON a.city_id = c.city_id
JOIN State s ON c.state_id = s.state_id
JOIN Country co ON s.country_id = co.country_id
JOIN Users u ON a.user_id = u.user_id
WHERE u.user_id = 1;`

---

# Intermediate Queries

**Customer purchase history** ***(example for user_id = 1)***
<br>
`SELECT u.name, o.order_id, o.order_date, p.name AS product, oi.quantity, oi.price_at_purchase
FROM Orders o
JOIN Users u ON o.user_id = u.user_id
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id
WHERE u.user_id = 1;`

**Total sales per category**
<br>
`SELECT p.category, SUM(oi.quantity * oi.price_at_purchase) AS total_sales
FROM Order_Items oi
JOIN Products p ON oi.product_id = p.product_id
JOIN Orders o ON oi.order_id = o.order_id
WHERE o.status = 'Completed'
GROUP BY p.category
ORDER BY total_sales DESC;`

**Top 5 best-selling products**
<br>
`SELECT p.name, SUM(oi.quantity) AS total_sold
FROM Order_Items oi
JOIN Products p ON oi.product_id = p.product_id
GROUP BY p.name
ORDER BY total_sold DESC
LIMIT 5;`

---

# Advanced Analytics Queries


**Top 3 customers by spending**
<br>
`SELECT u.name, SUM(o.total_amount) AS total_spent
FROM Orders o
JOIN Users u ON o.user_id = u.user_id
WHERE o.status = 'Completed'
GROUP BY u.name
ORDER BY total_spent DESC
LIMIT 3;`

**Monthly sales report**
<br>
`SELECT DATE_TRUNC('month', o.order_date) AS month, SUM(o.total_amount) AS monthly_sales
FROM Orders o
WHERE o.status = 'Completed'
GROUP BY month
ORDER BY month;`

**Average order value**
<br>
`SELECT AVG(total_amount) AS avg_order_value
FROM Orders
WHERE status = 'Completed';`

**Count of pending payments**
<br>
`SELECT COUNT(*) AS pending_payments
FROM Payments
WHERE status = 'Pending';`

**Orders by city**
<br>
`SELECT c.city_name, COUNT(o.order_id) AS total_orders
FROM Orders o
JOIN Users u ON o.user_id = u.user_id
JOIN Address a ON u.user_id = a.user_id
JOIN City c ON a.city_id = c.city_id
WHERE a.type = 'Shipping'
GROUP BY c.city_name
ORDER BY total_orders DESC;`

---

# E-commerce Query Bank Summary:
A collection of SQL queries for an e-commerce project, organized by complexity:

**Basic Queries:** Retrieve all users, products with stock, completed orders, and user addresses.
<br>
**Intermediate Queries:** Analyze customer purchase history, total sales per category, and top 5 best-selling products.
<br>
**Advanced Analytics:** Identify top 3 customers by spending, generate monthly sales reports, calculate average order value, count pending payments, and summarize orders by city.
