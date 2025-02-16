### **Retail Sales Analysis Using SQL**  

#### **Project Overview**  
**Title**: Retail Sales Analysis  
**Database**: `SQL - Retail Sales Analysis_utf$`  

This project aims to analyze retail sales data using **SQL** to extract valuable insights into sales performance, customer behavior, and key business trends. The project includes database setup, data cleaning, execution of analytical queries, and the creation of detailed reports to help business owners make data-driven decisions.  

---

### **Project Objectives**  

✅ Setting up a structured database and organizing data.  
✅ Cleaning the data and ensuring it is error-free.  
✅ Analyzing data to answer key business questions.  
✅ Creating reports to support data-driven decision-making.  

---

### **Project Structure**  

#### **1. Database Setup**  

The project starts by creating the **retail_sales** table within the `SQL - Retail Sales Analysis_utf$` database, which contains details of each sales transaction, such as transaction ID, date, customer details, category, price, cost, and total sales value.  

```sql
-- SQL Retail Sales Analysis

-- Create TABLE
DROP TABLE IF EXISTS retail_sales;
CREATE TABLE retail_sales (
        transactions_id INT PRIMARY KEY,
        sale_date DATE,
        sale_time TIME,
        customer_id INT,
        gender VARCHAR(15),
        age INT,
        category VARCHAR(15),
        quantiy INT,
        price_per_unit FLOAT,
        cogs FLOAT,
        total_sale FLOAT
);

SELECT TOP 10 * FROM ['SQL - Retail Sales Analysis_utf$'];
```  

---

#### **2. Data Cleaning**  

This step involves checking for and removing missing values to maintain data integrity.  

```sql
SELECT * FROM ['SQL - Retail Sales Analysis_utf$']
WHERE transactions_id IS NULL;

SELECT * FROM ['SQL - Retail Sales Analysis_utf$']
WHERE sale_date IS NULL;

SELECT * FROM ['SQL - Retail Sales Analysis_utf$']
WHERE sale_time IS NULL;

SELECT * FROM ['SQL - Retail Sales Analysis_utf$']
WHERE
    transactions_id IS NULL
    OR sale_date IS NULL
    OR sale_time IS NULL
    OR gender IS NULL
    OR category IS NULL
    OR quantiy IS NULL
    OR cogs IS NULL
    OR total_sale IS NULL;

DELETE FROM retail_sales
WHERE
    transactions_id IS NULL
    OR sale_date IS NULL
    OR sale_time IS NULL
    OR gender IS NULL
    OR category IS NULL
    OR quantiy IS NULL
    OR cogs IS NULL
    OR total_sale IS NULL;
```  

---

#### **3. Data Exploration**  

**Initial data analysis includes:**  
✅ Determining the total number of sales transactions.  
✅ Counting the number of unique customers.  
✅ Listing different product categories.  

```sql
-- Total number of transactions
SELECT COUNT(*) as total_sale FROM ['SQL - Retail Sales Analysis_utf$'];

-- Number of unique customers
SELECT COUNT(DISTINCT customer_id) FROM ['SQL - Retail Sales Analysis_utf$'];

-- Different product categories
SELECT DISTINCT category FROM ['SQL - Retail Sales Analysis_utf$'];
```  

---

#### **4. Data Analysis & Business Insights**  

**Q1: Retrieve all sales transactions for a specific date**  
```sql
SELECT * FROM ['SQL - Retail Sales Analysis_utf$']
WHERE sale_date = '2022-11-05';
```  

**Q2: Retrieve all transactions where category is "Clothing" and quantity sold is more than 10 in November 2022**  
```sql
SELECT *
FROM ['SQL - Retail Sales Analysis_utf$']
WHERE category = 'Clothing'
      AND CONVERT(VARCHAR, sale_date, 120)
      LIKE '2022-11%';
```  

**Q3: Calculate total sales for each product category**  
```sql
SELECT category, SUM(quantiy * price_per_unit) AS total_sale
FROM ['SQL - Retail Sales Analysis_utf$']
GROUP BY category;
```  

**Q4: Determine the average age of customers who purchased beauty products**  
```sql
SELECT AVG(age) AS Average_Age
FROM ['SQL - Retail Sales Analysis_utf$']
WHERE category = 'Beauty';
```  

**Q5: Retrieve all high-value transactions where total sales exceed $1000**  
```sql
SELECT transactions_id
FROM ['SQL - Retail Sales Analysis_utf$']
WHERE total_sale > 1000;
```  

**Q6: Count total transactions by gender and product category**  
```sql
SELECT COUNT(transactions_id) AS total_transactions, gender, category
FROM ['SQL - Retail Sales Analysis_utf$']
GROUP BY gender, category;
```  

**Q7: Calculate average sales per month and determine the best-selling month each year**  
```sql
SELECT TOP 3
    YEAR(sale_date) AS year,
    MONTH(sale_date) AS month,
    AVG(quantiy) AS avg_sale
FROM ['SQL - Retail Sales Analysis_utf$']
GROUP BY YEAR(sale_date), MONTH(sale_date)
ORDER BY avg_sale DESC;
```  

**Q8: Find the top 5 customers with the highest total purchases**  
```sql
SELECT TOP 5
    customer_id,
    SUM(total_sale) AS total_sales
FROM ['SQL - Retail Sales Analysis_utf$']
GROUP BY customer_id
ORDER BY total_sales DESC;
```  

**Q9: Determine the number of unique customers for each product category**  
```sql
SELECT
    category,
    COUNT(DISTINCT customer_id) AS unique_customers
FROM ['SQL - Retail Sales Analysis_utf$']
GROUP BY category;
```  

**Q10: Categorize sales into different time-based shifts (Morning, Afternoon, Evening) and count the number of orders in each shift**  
```sql
SELECT
    CASE
        WHEN DATEPART(HOUR, sale_time) <= 12 THEN 'Morning'
        WHEN DATEPART(HOUR, sale_time) <= 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS shift,
    COUNT(*) AS total_orders
FROM ['SQL - Retail Sales Analysis_utf$']
GROUP BY
    CASE
        WHEN DATEPART(HOUR, sale_time) <= 12 THEN 'Morning'
        WHEN DATEPART(HOUR, sale_time) <= 17 THEN 'Afternoon'
        ELSE 'Evening'
    END
ORDER BY total_orders DESC;
```  

---

### **Findings**  
📌 **Top-performing categories** can help optimize marketing and inventory management.  
📌 **Peak sales hours** show when customer traffic is highest.  
📌 **Demographic trends** allow for personalized customer targeting.  
📌 **Top-spending customers** can be targeted with exclusive offers.  

---

### **Reports Available**  
📊 **Daily Sales Summary**  
📊 **Most Profitable Product Categories**  
📊 **Monthly Sales Trends**  
📊 **Customer Demographics Analysis**  
📊 **Top-Spending Customers Report**  

---

### **Conclusion**  

This project provides a comprehensive analysis of retail sales, extracting key insights into sales trends and customer behavior. Business owners can leverage these findings to enhance their strategies and make data-driven decisions.  

---

### **How to Use**  

1️⃣ **Run queries** to extract relevant insights.  
2️⃣ **Analyze results** to generate accurate reports.  
3️⃣ **Modify and extend** by adding advanced analytics.  



