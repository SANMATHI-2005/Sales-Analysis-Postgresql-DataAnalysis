--SALES DATA ANALYSIS
sql
--where
--Find all sales made by John.
select salesperson from sales where salesperson='John';
--and +where
--Find sales from the North region where sales amount is greater than 1000.
select region,sales_amount from sales where region='North' and sales_amount>1000;
--aggregate functions
--Find the total sales amount.
select sum(sales_amount) from sales;
--Find the total profit.
select sum(profit) from sales;

--Find the average sales amount.
select avg(sales_amount) from sales;
--Find the highest sales amount.
select max(sales_amount) from sales;
--Find the lowest profit.
select min(profit) from sales;
--Count the number of sales records with a sales amount.
select count(sales_amount) from sales;
--group by functions
--Find the total sales amount for each region.
select region,sum(sales_amount) from sales group by region;
--Find the total profit for each salesperson.
select salesperson,sum(profit) from sales group by salesperson;
--Find the total units sold for each product.
select product,sum(units_sold) from sales group by product;
--Find the total sales amount for each category.
select category,sum(sales_amount) from sales group by category;
--group by functions
--Find the total sales amount for each region.
select region,sum(sales_amount) from sales group by region;
--Find the total profit for each salesperson.
select salesperson,sum(profit) from sales group by salesperson;
--Find the total units sold for each product.
select product,sum(units_sold) from sales group by product;
--Find the average sales amount for each category.
select category,avg(sales_amount) from sales group by category;
--group by + order by
--Find the total sales amount for each month and sort by month.
select month,sum(sales_amount)from sales group by month order by month ;
--Find the top 3 regions based on total sales amount.
select region,sum(sales_amount)from sales group by region order by sum(sales_amount) desc limit 3;
--Find the total sales amount for each salesperson and sort by salesperson.
select salesperson,sum(sales_amount) from sales group by salesperson order by salesperson ;
--Find the total units sold for each product and sort by product.
select product,sum(units_sold )from sales group by product order by product;
--in
--Find sales for Laptop and Monitor products.
select product from sales where product in('Laptop','Monitor');
--Find Electronics sales where profit is greater than 200.
select category,profit from sales where category='Electronics' and profit>200;
--Find sales from North, South, East, and West regions.
select region from sales where region in('North','South','East','West');
--between
--Find sales where units sold are between 10 and 25.
select units_sold from sales where units_sold between 10 and 25;
--Find sales amounts between 500 and 1500.
select sales_amount from sales where sales_amount between 500 and 1500;
--Find products whose names start with L.
select product from sales where product like 'L%';
--Find products whose names contain the letter 'a'.
select product from sales where product like '%a%';
--order by
--Display sales amounts from lowest to highest.
select sales_amount from sales order by sales_amount asc;
--Display profits from highest to lowest.
select profit from sales order by profit desc;
--having
--Find regions where total sales amount is greater than 1000.
select region,sum(sales_amount) from sales group by region having sum(sales_amount)>1000;
--Find salespersons whose total profit is greater than 500.
select salesperson,sum(profit) from sales group by salesperson having sum(profit)>500;
--Find products whose total units sold are greater than 20.
select product,sum(units_sold) from sales group by product having sum(units_sold)>20;
--Find categories whose average sales amount is greater than 1000.
select category,avg(sales_amount) from sales group by category having avg(sales_amount)>1000;
--limit
--Display the lowest 3 sales amounts.
select sales_amount from sales order by sales_amount limit 3;
--Find the top 2 products based on total sales amount.
select product, sum(sales_amount) from sales group by product order by sum(sales_amount) desc limit 2;
--Find products and sort them by average sales amount from highest to lowest.
select product,avg(sales_amount) from sales group by product order by avg(sales_amount) desc;
--case
--Categorize sales amounts into High, Medium, and Low levels.
select sales_amount,case when sales_amount<=500 then 'Low'
when sales_amount<=5000 then 'Medium' else 'High' end as amount_level from sales;
--Categorize profits into High, Medium, and Low levels.
select profit,case when profit>=320 then 'High'
when profit>=50 then 'Medium' else 'Low' end as profit_level from sales;
--avg and sub query
--Find sales amounts that are greater than the average sales amount.
select sales_amount from sales where sales_amount > ( select avg(sales_amount) from sales);
--Find sales amounts that are less than the maximum sales amount and sort in descending order.
select sales_amount from sales where sales_amount< (select max(sales_amount) from sales) order by
sales_amount desc;
--window function
--Rank sales amounts within each region based on sales amount.
select region,sales_amount,salesperson,
rank()over(partition by region order by sales_amount desc) as rank
from sales;

