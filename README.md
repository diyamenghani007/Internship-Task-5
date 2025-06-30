Internship Task 5 

This repository contains the SQL project completed as part of **Internship Task 5**, focused on designing a mini relational database for managing customer orders, 
performing advanced queries using SQL JOINs, and deriving meaningful business insights.

Key Objectives
- Design and create a normalized database schema for a retail system.
- Populate tables with mock data representing customers, products, orders, and order details.
- Perform SQL JOIN operations (INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL JOIN via UNION).
- Execute aggregate functions and group-based analytics.
- Derive actionable insights like revenue, customer behavior, and sales trends.

Tools Used
- SQL Workbench

Tables Created

1. **Customers**  
   Stores customer details including name, contact info, and join date.

2. **Products**  
   Contains product inventory with category, price, and stock quantity.

3. **Orders**  
   Records each order placed by a customer with order date and total amount.

4. **OrderDetails**  
   Line items associated with each order showing product, quantity, and subtotal.

Key SQL Concepts Applied

- **INNER JOIN**: To fetch matching records across multiple tables.
- **LEFT & RIGHT JOIN**: To identify unmatched or optional relationships (e.g. customers with no orders).
- **UNION JOIN**: For simulating a FULL OUTER JOIN.
- **GROUP BY + Aggregation**: Summarizing data (sales by product, customer orders, etc.).
- **Filtering with HAVING**: Post-grouping conditions.
- **Subqueries & Summations**: For insight extraction.

Insights & Learning

Key Insights
- Identified most frequently ordered products.
- Calculated total revenue per product and per customer.
- Discovered customers with multiple orders and those with no purchase history.
- Assessed daily sales and customer counts.

Things Learned
- How to structure a multi-table relational schema.
- The power and versatility of JOIN operations in SQL.
- Crafting analytical queries for business intelligence use cases.
- Best practices in writing readable and reusable SQL code.

