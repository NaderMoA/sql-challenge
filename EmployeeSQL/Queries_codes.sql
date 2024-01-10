--Q1 
Select "Employees".emp_no,
"Employees".first_name,
"Employees".last_name,
"Employees".sex,
"Salaries".salary
From "Employees"
Inner Join "Salaries"
on "Salaries".emp_no = "Employees".emp_no

--Q2
select "Employees".first_name,
"Employees".last_name,
"Employees".hire_date
from "Employees"
WHERE EXTRACT(YEAR FROM hire_date) = 1986

--Q3
select "Dept_manager".emp_no,
"Dept_manager".dept_no,
"Departments".dept_name,
"Employees".first_name,
"Employees".last_name,
"Titles".title
from "Dept_manager"
inner join "Departments"
on "Dept_manager".dept_no = "Departments".dept_no
inner join "Employees"
on "Employees".emp_no = "Dept_manager".emp_no
inner join "Titles"
on "Titles".title_id = "Employees".emp_title_id

--Q4
select "Employees".emp_no,
"Employees".first_name,
"Employees".last_name,
"Dept_emp".dept_no,
"Departments".dept_name
FROM "Employees"
INNER JOIN "Dept_emp"
on "Dept_emp".emp_no = "Employees".emp_no
INNER Join "Departments"
on "Departments".dept_no = "Dept_emp".dept_no

--Q5
SELECT "Employees".first_name,
"Employees".last_name,
"Employees".sex
FROM "Employees"
WHERE "Employees".first_name = 'Hercules' and 
"Employees".last_name LIKE 'B%'

--Q6
SELECT "Dept_emp".emp_no,
"Departments".dept_name,
"Employees".last_name,
"Employees".first_name
FROM "Dept_emp"
INNER JOIN "Departments"
on "Departments".dept_no = "Dept_emp".dept_no
INNER JOIN "Employees"
on "Dept_emp".emp_no = "Employees".emp_no
WHERE "Dept_emp".dept_no IN (SELECT "Departments".dept_no from "Departments"
WHERE "Departments".dept_name = 'Sales');

--Q7
SELECT "Employees".emp_no,
"Employees".last_name,
"Employees".first_name,
"Departments".dept_name
FROM "Employees"
INNER JOIN "Dept_emp"
on "Employees".emp_no = "Dept_emp".emp_no
INNER JOIN "Departments"
on "Departments".dept_no = "Dept_emp".dept_no
WHERE "Departments".dept_name = 'Sales' OR  "Departments".dept_name = 'Development'

--Q8
SELECT "Employees".last_name,
COUNT("Employees".last_name)as frequency
FROM "Employees"
GROUP BY "Employees".last_name
ORDER BY frequency Desc