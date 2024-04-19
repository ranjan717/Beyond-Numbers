--Pivoting in SQL
--Create class table

create table class(
student_name varchar(10),
Class int,
gender varchar(2),
Rollno int
)

INSERT INTO class(student_name,class,gender, Rollno)
VALUES ('Raja', 3, 'M', 32),
	   ('Rashmi', 5, 'F', 22),
	   ('Hema', 2, 'F', 27),
	   ('Ranjan', 6, 'M', 7)

select*from class;

select*from
(
select student_name, class, gender from class
) A
PIVOT(
COUNT(student_name)
FOR gender in ([F],[M])
) B


--Create table sales

create table sales(
Product varchar(10),
month varchar(10),
Sales int,
)

INSERT INTO sales(Product, month, Sales)
VALUES('A','Jan',1000),
	  ('B','Feb',2000),
	  ('C','Jan',500),
	  ('D','Mar',1500);
select*from sales;

select*from(
select product, month, Sales from sales
)A
PIVOT(
sum(Sales)
for product in (A,B,C,D)
)B