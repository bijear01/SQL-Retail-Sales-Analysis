----------- SQL Retail sales Analysis  Project 
CREATE DATABASE sql_sales_analysis;
use sql_sales_analysis;
---------- Create Table 
 CREATE TABLE retail_sales
 (
 transactions_id int PRIMARY key,
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
 
select * from retail_sales;

select 
count(*)
from retail_sales;

select * from retail_sales
limit 10;


select * from retail_sales 
where 
    transactions_id is null
    or 
    sale_date is null
    or 
    sale_time is null 
    or
    customer_id is null
    or 
    gender is null 
    or 
    age is null
    or 
    category is null 
    or 
    total_sale is null;
    
    -- lets delete the null values from the table 
    
DELETE FROM retail_sales

  where 
    transactions_id is null
    or 
    sale_date is null
    or 
    sale_time is null 
    or
    customer_id is null
    or 
    gender is null 
    or 
    age is null
    or 
    category is null 
    or 
    total_sale is null;

-- Data Exploration   

-- How many sales we have?
select * from retail_sales;
select count(*) as total_sales from retail_sales;

-- How many unique customers do we have ?
select count(distinct customer_id) as total_customers from retail_sales;

-- How many categories do we have ?
----------- SQL Retail sales Analysis  Project 
CREATE DATABASE sql_sales_analysis;
use sql_sales_analysis;
---------- Create Table 
 CREATE TABLE retail_sales
 (
 transactions_id int PRIMARY key,
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
 
select * from retail_sales;

select 
count(*)
from retail_sales;

select * from retail_sales
limit 10;


select * from retail_sales 
where 
    transactions_id is null
    or 
    sale_date is null
    or 
    sale_time is null 
    or
    customer_id is null
    or 
    gender is null 
    or 
    age is null
    or 
    category is null 
    or 
    total_sale is null;
    
    -- lets delete the null values from the table 
    
DELETE FROM retail_sales

  where 
    transactions_id is null
    or 
    sale_date is null
    or 
    sale_time is null 
    or
    customer_id is null
    or 
    gender is null 
    or 
    age is null
    or 
    category is null 
    or 
    total_sale is null;

-- Data Exploration   

-- How many sales we have?
select * from retail_sales;
select count(*) as total_sales from retail_sales;

-- How many unique customers do we have ?
select count(distinct customer_id) as total_customers from retail_sales;

-- How many categories do we have ?
select count(distinct category ) as total_category from retail_sales;
select distinct category from retail_sales;

-- Data Analysis and business key problems

-- Q1 write a SQL query to retrieve all columns for sales made on '2022-11-05.
select * from retail_sales 
where sale_date = '2022-11-05';

-- Q2 writa a SQL query to retrieve all transactions where the category is 'clothing' and
-- the quantity sold is more than 10 in the month of nov-2022 

select *
from retail_sales
where 
category = 'clothing'
and 
sale_date between  '2022-11-01' and  '2022-11-31'
and quantiy>= 4;

-- Q3 Write a SQL query to calculate the total sales (total_sales) for each category
  select 
  category,
  sum(total_sale) as net_sales,
  count(*) as total_orders
  from retail_sales
  group by 1
  order by 1 desc;
  
  -- Q4 Write a SQL query to find the average age of customers who purchased items from the 'beauty' category
   select 
  round(avg(age),2) as avg_age 
   from retail_sales
   where category ='beauty';
   
   -- Q5 Write SQL query to find all transactions where the total_sale is greater than 1000
   select * 
   from retail_sales
   where 
   total_sale > 1000;
   
   -- Q6 Write a SQL query to find the total number of transactions(transaction_id) made by each gender in each category
   select category, gender,
   count(*) as total_transaction
   from retail_sales
   group by 1,2
   order by 1;
   
   -- Q7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year.
  
  select
  year,
  month,
  avg_sale
from
  (
     select
        extract(year from sale_date) as year,
         extract(month from sale_date) as month,
         round(avg(total_sale),2) as avg_sale,
         rank() over(partition by extract(year from sale_date) order by avg(total_sale) desc) as classification
         from retail_sales
          group by 1,2
)
   as t1
   where classification = 1;
   
   -- Q8 Write a SQL query to find out top 5 customers based on the highest total sales 
   select 
   customer_id,
   sum(total_sale)
   from retail_sales
   group by 1
   order by 2 desc
   limit 5;
   
   -- Q9 Write a SQL query to find the number of unique customers who purchased items from each category
   
   select category,
   count(distinct customer_id) as unique_cs
   from retail_sales
  group by 1;
  
  -- Q10 Write a SQL query to create each shift and number of orders(example morning<=12, Afternoon between 12 & 17, evening >17)
    
    with hourly_sale
    AS
    (
    select*,
        case 
            when extract(hour from sale_time) < 12 then 'Morning'
            when extract(hour from sale_time) between 12 and 17 then 'Afternoon'
            else 'Evening'
		end as shift
        from retail_sales
        )
        select
           shift,
           count(*) as total_orders
           from hourly_sale
           group by shift 
           
-- END OF THE PROJECT
   
  

    
    

   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   


    
    
    

   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   