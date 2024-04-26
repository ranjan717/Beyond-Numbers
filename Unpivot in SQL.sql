--Unpivot a table

select*from QSales

select ProductId, qtr, Sales
from(
	select *from QSales) as s --data from which we will take the columns
unpivot(

Sales FOR qtr IN (Q1_Sales,Q2_Sales,Q3_Sales,Q4_Sales) --give me the values for Sales column which are currently under the columns (mention the column names)

) as b;

--UNPIVOT Syntax

UNPIVOT(
new_col_name FOR Source_col_name IN ( source col names)
) as alias_name