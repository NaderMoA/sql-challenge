i had to use this code:( alter database "Module 9 Assignment" set datestyle to "ISO,MDY" ) so that i could import the csv files into my tables because the date type was giving me an error and ASKBCS gave me that code.

Q1: List the employee number, last name, first name, sex, and salary of each employee:
Answer 1:
Select "Employees".emp_no,
"Employees".first_name,
"Employees".last_name,
"Employees".sex,
"Salaries".salary
From "Employees"
Inner Join "Salaries"
on "Salaries".emp_no = "Employees".emp_no

Q2: select "Employees".first_name,
Answer 2:
"Employees".last_name,
"Employees".hire_date
from "Employees"
WHERE EXTRACT(YEAR FROM hire_date) = 1986

Q3: List the manager of each department along with their department number, department name, employee number, last name, and first name.
Answer 3:
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

Q4: List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
Answer 4:




