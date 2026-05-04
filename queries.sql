-- =====================================
-- E-COMMERCE SQL ANALYSIS PROJECT
-- =====================================

USE ecommerce;

-- =====================================
-- 1. DATA PREVIEW
-- =====================================

SELECT * FROM customers LIMIT 5;
SELECT * FROM orders LIMIT 5;
SELECT * FROM order_details LIMIT 5;

-- =====================================
-- 2. TOTAL BUSINESS OVERVIEW
-- =====================================

SELECT 
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM order_details;

-- =====================================
-- 3. FULL JOIN DATASET (BASE QUERY)
-- =====================================

SELECT 
    o.order_id,
    o.order_date,
    c.customer_name,
    c.region,
    od.product_name,
    od.category,
    od.sales,
    od.quantity,
    od.profit
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_details od ON o.order_id = od.order_id;

-- =====================================
-- 4. SALES BY REGION
-- =====================================

SELECT 
    c.region,
    SUM(od.sales) AS total_sales
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_details od ON o.order_id = od.order_id
GROUP BY c.region
ORDER BY total_sales DESC;

-- =====================================
-- 5. SALES & PROFIT BY CATEGORY
-- =====================================

SELECT 
    category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM order_details
GROUP BY category
ORDER BY total_sales DESC;

-- =====================================
-- 6. TOP 10 PRODUCTS BY SALES
-- =====================================

SELECT 
    product_name,
    SUM(sales) AS total_sales
FROM order_details
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 10;

-- =====================================
-- 7. LOSS-MAKING PRODUCTS
-- =====================================

SELECT 
    product_name,
    SUM(profit) AS total_profit
FROM order_details
GROUP BY product_name
HAVING total_profit < 0
ORDER BY total_profit;

-- =====================================
-- 8. CATEGORY-WISE QUANTITY SOLD
-- =====================================

SELECT 
    category,
    SUM(quantity) AS total_quantity
FROM order_details
GROUP BY category
ORDER BY total_quantity DESC;

-- =====================================
-- 9. YEARLY SALES TREND
-- =====================================

SELECT 
    YEAR(o.order_date) AS year,
    SUM(od.sales) AS total_sales
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
GROUP BY year
ORDER BY year;

-- =====================================
-- 10. MONTHLY SALES TREND
-- =====================================

SELECT 
    YEAR(o.order_date) AS year,
    MONTH(o.order_date) AS month,
    SUM(od.sales) AS total_sales
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
GROUP BY year, month
ORDER BY year, month;

-- =====================================
-- 11. TOP 10 CUSTOMERS BY SPENDING
-- =====================================

SELECT 
    c.customer_name,
    SUM(od.sales) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_details od ON o.order_id = od.order_id
GROUP BY c.customer_name
ORDER BY total_spent DESC
LIMIT 10;

-- =====================================
-- 12. AVERAGE ORDER VALUE
-- =====================================

SELECT 
    AVG(order_total) AS avg_order_value
FROM (
    SELECT 
        order_id,
        SUM(sales) AS order_total
    FROM order_details
    GROUP BY order_id
) t;

-- =====================================
-- 13. MOST PROFITABLE CATEGORY
-- =====================================

SELECT 
    category,
    SUM(profit) AS total_profit
FROM order_details
GROUP BY category
ORDER BY total_profit DESC
LIMIT 1;

-- =====================================
-- 14. TOTAL ORDERS PER CUSTOMER
-- =====================================

SELECT 
    c.customer_name,
    COUNT(DISTINCT o.order_id) AS total_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY total_orders DESC;

-- =====================================
-- 15. TOP REGIONS BY PROFIT
-- =====================================

SELECT 
    c.region,
    SUM(od.profit) AS total_profit
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_details od ON o.order_id = od.order_id
GROUP BY c.region
ORDER BY total_profit DESC;

-- =====================================
-- END OF PROJECT
-- =====================================
