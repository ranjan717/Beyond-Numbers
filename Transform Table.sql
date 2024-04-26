/*Input

Table
1 A
2 B
3 C
4 D

Output

Table
Col_1	Col_2     pattern is col_1 ranks< col_2 ranks
1 A		2 B
1 A		3 C
1 A		4 D
2 B		3 C
2 B		4 D
3 C		4 D
*/

with cte as (

select Col_1,

row_number()over(order by Col_1) as rn

from table_4
)

select 

		t1.Col_1 as Col_1,
		t2.Col_1 as Col_2

from  cte t1

cross join 

	  cte t2

where  t1.rn<t2.rn

order by t1.Col_1;

