--Month wise Cumulative sales

with cte as (
select datename(month,order_date) as Month_order, sum(sales) as Sales
from orders
group by  datename(month,order_date)
)
select *,
sum(sales)over(order by Month_order) as Cumulative_sales
from cte;