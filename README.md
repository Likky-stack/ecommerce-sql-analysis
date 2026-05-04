# 🛒 E-commerce SQL Analysis

## 📌 Project Overview
This project analyzes an e-commerce dataset using SQL to extract meaningful business insights such as sales performance, customer behavior, and product trends.

---

## 🗂️ Dataset
The dataset contains 3 tables:

- **customers** → customer details
- **orders** → order information
- **order_details** → product-level sales data

---

## 🔧 Tools Used
- MySQL
- SQL

---

## 📊 Key Analysis Performed

- Total sales, profit, and orders
- Sales by region
- Sales by category
- Top 10 products by sales
- Top customers by spending
- Monthly and yearly trends
- Loss-making products

---

## 🔗 Key SQL Concepts Used

- JOIN (INNER JOIN)
- GROUP BY
- ORDER BY
- HAVING
- Aggregate functions (SUM, COUNT, AVG)
- Subqueries

---

## 📈 Sample Query

```sql
SELECT category, SUM(sales)
FROM order_details
GROUP BY category;
