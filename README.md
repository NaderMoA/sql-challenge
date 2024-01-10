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

Q2: List the first name, last name, and hire date for the employees who were hired in 1986.
Answer 2:
select "Employees".first_name,
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

Q5: List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
Answer 5:
SELECT "Employees".first_name,
"Employees".last_name,
"Employees".sex
FROM "Employees"
WHERE "Employees".first_name = 'Hercules' and 
"Employees".last_name LIKE 'B%'

Q6: List each employee in the Sales department, including their employee number, last name, and first name.
Answer 6:
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

Q7: List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
Answer 7:
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

Q8: List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
Answer 8:
SELECT "Employees".last_name,
COUNT("Employees".last_name)as frequency
FROM "Employees"
GROUP BY "Employees".last_name
ORDER BY frequency Desc

