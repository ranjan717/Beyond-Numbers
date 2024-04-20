--Show the Top 3 and Bottom 3 products by sales in a single table

WITH CTE AS(
SELECT region, product_name, sum(sales) as Total_Sales
FROM orders
GROUP BY region, product_name
),
A AS (
SELECT *,
ROW_NUMBER()OVER(PARTITION BY region ORDER BY Total_Sales DESC) AS drn,
ROW_NUMBER()OVER(PARTITION BY region ORDER BY Total_Sales ASC) AS arn
FROM CTE
)
SELECT *,
	CASE 
		WHEN drn<=3 THEN 'Top3'
		ELSE 'Bottom3'
	END AS TopBottom
FROM A
WHERE drn<=3 OR arn<=3;