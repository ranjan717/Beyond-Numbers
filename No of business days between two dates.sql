--No of business days between two dates


28-04-2024 
5 business days
21-04-2024
5 business days
14-04-2024
10
14
no of days between two days - 2*no of weeks between the two dates
every one week has 2 non business days

select order_id, order_date,datediff(day,order_date,ship_date)-2*(datediff(week, order_date,ship_date)) as no_of_business_days
from orders;


