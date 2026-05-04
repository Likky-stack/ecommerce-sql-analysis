# 🛒 E-Commerce Sales Analysis using SQL

## 📌 Project Overview

This project analyzes an e-commerce dataset using SQL to extract meaningful business insights such as sales performance, customer behavior, and product trends. The goal is to demonstrate strong SQL skills and the ability to solve real-world business problems using data.

---

## 🗂️ Dataset

The dataset consists of 3 tables:

* **customers** → contains customer details (name, region, ID)
* **orders** → contains order-level information (order ID, date, customer ID)
* **order_details** → contains product-level details (sales, profit, quantity, category)

---

## 🔧 Tools Used

* MySQL
* SQL

---

## 📊 Key Analysis Performed

* Total sales, profit, and number of orders
* Sales distribution by region
* Sales and profit by category
* Top 10 products by sales
* Top customers by spending
* Monthly and yearly sales trends
* Identification of loss-making products

---

## 🔗 Key SQL Concepts Used

* JOIN (INNER JOIN)
* GROUP BY
* ORDER BY
* HAVING
* Aggregate functions (SUM, COUNT, AVG)
* Subqueries

---

## 💡 Sample Query

```sql
SELECT 
    c.customer_name,
    SUM(od.sales) AS total_sales
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_details od ON o.order_id = od.order_id
GROUP BY c.customer_name
ORDER BY total_sales DESC;
```

---

## 📌 Key Insights

* Technology category generated the highest sales
* Some products are consistently loss-making despite high sales
* A small number of customers contribute a large portion of total revenue
* Sales performance varies significantly across regions
* Monthly trends show fluctuations indicating seasonal demand

---

## 📁 Project Structure

* `queries.sql` → contains all SQL queries used for analysis
* `README.md` → project documentation

---

## 🚀 Conclusion

This project demonstrates the use of SQL for data analysis by transforming raw data into actionable insights. It highlights strong analytical thinking and practical knowledge of SQL in solving business problems.

