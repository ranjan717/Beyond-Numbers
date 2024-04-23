--Find the emp id whose salary is more than the dept wise avg salary
--Correlated sub query

select emp_id
from employee
where salary>(
select avg(salary)
from employee e2
where e2.dept_id=employee.dept_id);


--Calculate the total no of hours spend by each employee in a day

select
		emp_id,
		emp_name,
		DATEPART(day,login_time) as Login_day,
		SUM(DATEDIFF(Hour, login_time, logout_time)) as total_hours_spent
from Employeelogs
Group by emp_id, emp_name, DATEPART(day,login_time);
