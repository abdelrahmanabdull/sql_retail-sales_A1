--SQL Retail Sales Analysis 

--Create TABLE
DROP TABLE IF EXISTS retail_sales
CREATE TABLE retail_sales
            (
        transactions_id int PRIMARY KEY,
	    sale_date Date,
	    sale_time Time,
	    customer_id int,
	    gender VARCHAR(15),
	    age	int,
	    category	VARCHAR(15),
	    quantiy	INT,
	    price_per_unit	FLOAT,
	    cogs FLOAT,
	    total_sale FLOAT,
     )

	 select top 10 * from ['SQL - Retail Sales Analysis_utf$']

--Data Cleaniing 
SELECT * FROM ['SQL - Retail Sales Analysis_utf$']
Where transactions_id IS NULL

SELECT * FROM ['SQL - Retail Sales Analysis_utf$']
Where sale_date IS NULL


SELECT * FROM ['SQL - Retail Sales Analysis_utf$']
Where sale_time IS NULL

SELECT * FROM ['SQL - Retail Sales Analysis_utf$']
WHERE 
    transactions_id IS NULL
	OR
	sale_date IS NULL
	OR
	sale_time IS NULL
	OR 
	gender IS NULL
	OR 
	category IS NULL 
	OR 
	quantiy IS NULL
	OR 
	cogs IS NULL
	OR 
	total_sale IS NULL 
--
DELETE FROM retail_sales
WHERE
        transactions_id IS NULL
	OR
	sale_date IS NULL
	OR
	sale_time IS NULL
	OR 
	gender IS NULL
	OR 
	category IS NULL 
	OR 
	quantiy IS NULL
	OR 
	cogs IS NULL
	OR 
	total_sale IS NULL 

--Data Exploration

--How many sales we have?
SELECT COUNT(*) as total_sale from ['SQL - Retail Sales Analysis_utf$']

--How many customers we have ?
select count(distinct customer_id) from ['SQL - Retail Sales Analysis_utf$']


select distinct category from ['SQL - Retail Sales Analysis_utf$']


--Data Analsis & Business key & Answers
-- My Analysis & Findings
-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)


-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
SELECT * from ['SQL - Retail Sales Analysis_utf$']
Where sale_date = '2022-11-05'

-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022

SELECT *
FROM ['SQL - Retail Sales Analysis_utf$']
WHERE category = 'Clothing'
      AND CONVERT(VARCHAR, sale_date, 120)
	  LIKE '2022-11%'

-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.

SELECT category, SUM(quantiy * price_per_unit) AS total_sale
FROM ['SQL - Retail Sales Analysis_utf$']
GROUP BY category;
 
-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.

SELECT avg(age) AS Average_Age
FROM ['SQL - Retail Sales Analysis_utf$'] 
WHERE category = 'Beauty'

-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.

SELECT transactions_id
FROM ['SQL - Retail Sales Analysis_utf$']
WHERE total_sale > 1000

-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.

--SELECT count(transactions_id)as total_transactions, gender, category
--FROM ['SQL - Retail Sales Analysis_utf$']
--Group by transactions_id, gender,category

---- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year

SELECT TOP 3
    YEAR(sale_date) AS year,
	MONTH(sale_date) AS month,
	AVG (quantiy) AS avg_sale
FROM ['SQL - Retail Sales Analysis_utf$']
Group by  YEAR(sale_date), MONTH(sale_date)
ORDER BY avg_sale desc


-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 

SELECT TOP 5
   customer_id,
   SUM(total_sale) AS total_sales
FROM ['SQL - Retail Sales Analysis_utf$']
GROUP BY customer_id
ORDER BY total_sales DESC;

-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.

SELECT 
    category, 
    COUNT(DISTINCT customer_id) AS unique_customers
FROM ['SQL - Retail Sales Analysis_utf$']
GROUP BY category;

-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)

SELECT 
    CASE 
        WHEN DATEPART(HOUR, sale_date) <= 12 THEN 'Morning'
        WHEN DATEPART(HOUR, sale_date) <= 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS shift,
    COUNT(*) AS total_orders
FROM ['SQL - Retail Sales Analysis_utf$']
GROUP BY 
    CASE 
        WHEN DATEPART(HOUR, sale_date) <= 12 THEN 'Morning'
        WHEN DATEPART(HOUR, sale_date) <= 17 THEN 'Afternoon'
        ELSE 'Evening'
    END
ORDER BY total_orders DESC;

--End of project