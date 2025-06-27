# E-Commerce-Data-Analytics-Toolkit-using-SQL-TASK-4-Evelate-Labs-

Here is a **professional README.md** file for your project titled:

> **"E-Commerce Data Analytics Toolkit using SQL"**

You can copy-paste this into your GitHub repository to make it presentation-ready.

---

````markdown
# 📦 E-Commerce Data Analytics Toolkit using SQL

**Author**: Kandukuri Jaswanth  
**Date**: 27-June-2025  
**Engine**: MySQL 8.0+  
**License**: Open Use (Credit Appreciated)

---

## 📘 Overview

This project contains a fully optimized SQL script that transforms a classic **Customers–Orders–Products** schema into an analytics-ready database. It includes **indexing, reusable views, and insightful reports**, all in a **single executable file**.

This toolkit is suitable for:
- Data analyst interviews
- BI dashboard backends
- Learning SQL optimization
- Building analytics pipelines for retail businesses

---

## 📂 Features

| Section | Description |
|--------|-------------|
| 🔧 Index Optimization | Adds indexes to speed up joins and groupings |
| 📊 Analytics Views | Global average price, best-selling product, customer totals |
| 📋 Reports | Dead stock, top customers, product insights |
| 💬 Interview Q&A | Embedded SQL interview questions with examples |

---

## ⚙️ Database Setup

```sql
CREATE DATABASE IF NOT EXISTS e_commerce_data;
USE e_commerce_data;
````

Make sure your tables include:

* `customers(customer_id, first_name, last_name)`
* `orders(order_id, customer_id, order_date)`
* `orderdetails(order_id, product_id, quantity)`
* `products(product_id, product_name, price)`

---

## 🔍 Key Queries

### 1. Global Average Product Price

```sql
CREATE OR REPLACE VIEW vw_global_avg_price AS
SELECT ROUND(AVG(price), 2) AS avg_price FROM products;
```

---

### 2. Most Purchased Product

```sql
CREATE OR REPLACE VIEW vw_most_purchased_product AS
SELECT product_id, product_name, total_units
FROM (
  SELECT p.product_id, p.product_name, SUM(od.quantity) AS total_units,
         ROW_NUMBER() OVER (ORDER BY SUM(od.quantity) DESC) AS rn
  FROM products p
  JOIN orderdetails od ON od.product_id = p.product_id
  GROUP BY p.product_id, p.product_name
) ranked
WHERE rn = 1;
```

---

### 3. Customers Who Never Bought Product #1

```sql
SELECT c.customer_id, c.first_name, c.last_name
FROM customers c
LEFT JOIN orders o ON o.customer_id = c.customer_id
LEFT JOIN orderdetails od ON od.order_id = o.order_id AND od.product_id = 1
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING SUM(CASE WHEN od.product_id = 1 THEN 1 ELSE 0 END) = 0;
```

---

## 📈 Sample View: Lifetime Value of Customer

```sql
CREATE OR REPLACE VIEW vw_customer_order_totals AS
SELECT c.customer_id,
       CONCAT(c.first_name, ' ', c.last_name) AS full_name,
       COUNT(o.order_id) AS total_orders,
       SUM(od.quantity * p.price) AS lifetime_spend
FROM customers c
JOIN orders o USING (customer_id)
JOIN orderdetails od USING (order_id)
JOIN products p USING (product_id)
GROUP BY c.customer_id, full_name;
```

---

## 💼 SQL Interview Questions (with Answers)

> 📎 Use these to revise or explain project logic during technical interviews.

1. **What is the difference between WHERE and HAVING?**
   `WHERE` filters rows before aggregation; `HAVING` filters after grouping.

2. **What are different types of joins?**
   INNER, LEFT, RIGHT, FULL OUTER (simulated using `UNION` in MySQL).

3. **How do you calculate ARPU (Average Revenue Per User)?**

   ```sql
   SELECT ROUND(SUM(od.quantity * p.price) / COUNT(DISTINCT c.customer_id), 2) AS ARPU
   FROM customers c
   JOIN orders o USING (customer_id)
   JOIN orderdetails od USING (order_id)
   JOIN products p USING (product_id);
   ```

4. **What are subqueries?**
   A query inside another query — used for filtering or derived tables.

5. **How do you optimize a SQL query?**

   * Add indexes on JOIN/WHERE/GROUP columns
   * Use EXPLAIN
   * Avoid SELECT \*
   * Materialize complex logic in views

6. **What is a view in SQL?**
   A virtual table representing the result of a SELECT. Used for reuse and abstraction.

7. **How to handle NULLs in SQL?**

   * Use `IS NULL`, `IS NOT NULL`
   * Replace using `COALESCE()` or `IFNULL()`

---

## 🧠 Final Notes

* All views are reusable and can power Power BI or Tableau dashboards.
* Indexes are designed for large-scale datasets with minimal scan overhead.
* This file serves as both an operational script and an interview study sheet.

---

## 📧 Contact

If you found this useful, connect with me on [LinkedIn](https://www.linkedin.com/in/kandukuri-jaswanth-61a8a2209/) or drop a ⭐ on GitHub!

```

---



I'm happy to package it for you.
```
