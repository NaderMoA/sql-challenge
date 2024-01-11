--Q1 
Select e.emp_no,
e.first_name,
e.last_name,
e.sex,
s.salary
From employees as e
Inner Join salaries as s
on s.emp_no = e.emp_no

--Q2
select first_name,
last_name,
hire_date
from employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986

--Q3
select dept_manager.emp_no,
dept_manager.dept_no,
departments.dept_name,
employees.first_name,
employees.last_name,
titles.title
from dept_manager
inner join departments
on dept_manager.dept_no = departments.dept_no
inner join employees
on employees.emp_no = dept_manager.emp_no
inner join titles
on titles.title_id = employees.emp_title_id

--Q4
select employees.emp_no,
employees.first_name,
employees.last_name,
dept_emp.dept_no,
departments.dept_name
FROM employees
INNER JOIN dept_emp
on dept_emp.emp_no = employees.emp_no
INNER Join departments
on departments.dept_no = dept_emp.dept_no

--Q5
SELECT employees.first_name,
employees.last_name,
employees.sex
FROM employees
WHERE employees.first_name = 'Hercules' and 
employees.last_name LIKE 'B%'

--Q6
SELECT dept_emp.emp_no,
departments.dept_name,
employees.last_name,
employees.first_name
FROM dept_emp
INNER JOIN departments
on departments.dept_no = dept_emp.dept_no
INNER JOIN employees
on dept_emp.emp_no = employees.emp_no
WHERE dept_emp.dept_no IN (SELECT departments.dept_no from departments
WHERE departments.dept_name = 'Sales');

--Q7
SELECT employees.emp_no,
employees.last_name,
employees.first_name,
departments.dept_name
FROM employees
INNER JOIN dept_emp
on employees.emp_no = dept_emp.emp_no
INNER JOIN departments
on departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales' OR  departments.dept_name = 'Development'

--Q8
SELECT employees.last_name,
COUNT(employees.last_name)as frequency
FROM employees
GROUP BY employees.last_name
ORDER BY frequency Desc