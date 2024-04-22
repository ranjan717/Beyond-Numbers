--Lead and Lag in SQL server
/* 

1.Accessing data from a subsequent or preceding row within the same result set without the use of a self-join

2.Useful for comparative analysis or for calculating running totals, differences, or averages across rows.

Lead function : The lead function retrieves data from the next row (the row that follows the current row) in the result set based on a specified order

LEAD (column name, [no of rows next] ,[default value if there is no next rows available]) 
    OVER ( [ partition_by_clause ] order_by_clause )

LAG (column name, [no of rows backward] [default value if there are no backward rows]) 
    OVER ( [ partition_by_clause ] order_by_clause )

Lag function : The lag function retrieves data from the previous row (the row that is previous to the current row) in the result set based on a specified order

*/

select *,

lag(sales, 1, sales)over(partition by region order by sales desc)as prev_sales

from orders;

--YOY Growth in each region
with cte as(
select region, datepart(year,order_date) as year_order, sum(sales) as total_sales
from orders
group by region,datepart(year,order_date)
)

select*,
lag(total_sales,1,total_sales) over(partition by region order by year_order) as prev_yr_sales
,(total_sales-lag(total_sales,1,total_sales) over(partition by region order by year_order))*100/lag(total_sales,1,total_sales) over(partition by region order by year_order) as yoy_growth
from cte;



