# MSSQL-Project-Portfolio
A collection of Microsoft SQL Server projects showcasing expertise in database design, development, and optimization. Learn from real-world examples and improve your T-SQL skills.

# Customer Database Project

## 📚 Overview

Welcome to the **Customer Database Project**! This project is designed to create and manage a comprehensive customer database using MySQL. It includes essential tables for customers, orders, products, order details, customer purchases, and returns. The goal is to facilitate effective tracking of customer interactions and sales performance.

---

## 🗂️ Database Structure

### Tables

1. **Customers**
   - Stores customer information.
   - **Columns**: 
     - `customer_id`
     - `first_name`
     - `last_name`
     - `email`
     - `phone`
     - `address`
     - `city`
     - `state`
     - `postal_code`
     - `country`
     - `created_at`
     - `updated_at`

2. **Orders**
   - Records customer orders.
   - **Columns**: 
     - `order_id`
     - `customer_id`
     - `order_date`
     - `total`
     - `status`
     - `created_at`
     - `updated_at`

3. **Products**
   - Contains product details.
   - **Columns**: 
     - `product_id`
     - `product_name`
     - `description`
     - `price`
     - `stock_quantity`
     - `created_at`
     - `updated_at`

4. **Order Details**
   - Links products to specific orders.
   - **Columns**: 
     - `order_detail_id`
     - `order_id`
     - `product_id`
     - `quantity`
     - `unit_price`
     - `created_at`
     - `updated_at`

5. **Customer Purchases**
   - Tracks product purchases by customers.
   - **Columns**: 
     - `customer_id`
     - `product_id`
     - `quantity`

6. **Customer Returns**
   - Logs product returns and reasons.
   - **Columns**: 
     - `return_id`
     - `customer_id`
     - `product_id`
     - `return_date`
     - `return_reason`

---

## 💻 SQL Scripts

The project includes SQL scripts for:

- **Creating the database and tables**
- **Inserting sample data**
- **Queries to analyze sales data** (e.g., identifying the top 3 selling products)

### Example: Create Database and Tables
```sql
CREATE DATABASE customers;

USE customers;

CREATE TABLE customers (
  customer_id INT AUTO_INCREMENT,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  phone VARCHAR(20),
  address VARCHAR(255),
  city VARCHAR(50),
  state VARCHAR(50),
  postal_code VARCHAR(10),
  country VARCHAR(50),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (customer_id)
);

-- Additional table creation scripts...
