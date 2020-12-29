-- #1: employee number, last name, first name, sex, and salary. 
SELECT 
	employees.emp_no, 
	employees.last_name, 
	employees.first_name, 
	employees.sex,
	salaries.salary
FROM employees
LEFT JOIN salaries 
ON employees.emp_no=salaries.emp_no;

-- #2: first name, last name, and hire date for employees who were 
-- hired in 1986.
SELECT 
	first_name,
	last_name,
	hire_date
FROM employees 
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- #3: manager of each department with the following information: 
-- department number, department name, the manager's employee number, 
-- last name, first name.

SELECT
	dept_managers.dept_no, 
	departments.dept_name,
	dept_managers.emp_no,
	employees.last_name,
	employees.first_name
FROM dept_managers
LEFT JOIN departments 
ON dept_managers.dept_no = departments.dept_no
LEFT JOIN employees 
ON dept_managers.emp_no = employees.emp_no
ORDER BY last_name; 

-- #4 . List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.

SELECT 
	dept_emp.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM dept_emp
LEFT JOIN employees 
ON dept_emp.emp_no = employees.emp_no
LEFT JOIN departments 
ON dept_emp.dept_no = departments.dept_no
ORDER BY last_name; 

-- #5: List first name, last name, and sex for employees whose first name is 
-- "Hercules" and last names begin with "B."
SELECT 
	first_name,
	last_name,
	sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'
ORDER BY last_name;

-- #6: List all employees in the Sales department, including their employee number, 
-- last name, first name, and department name.

SELECT 
	dept_emp.emp_no, 
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM dept_emp
LEFT JOIN employees 
ON dept_emp.emp_no = employees.emp_no
LEFT JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE dept_name = 'Sales'
ORDER BY last_name;

-- #7: List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.
SELECT 
	dept_emp.emp_no, 
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM dept_emp
LEFT JOIN employees 
ON dept_emp.emp_no = employees.emp_no
LEFT JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE dept_name='Sales' OR dept_name='Development'
ORDER BY dept_name, last_name;

-- #8: In descending order, list the frequency count of employee last names, i.e., 
-- how many employees share each last name.
SELECT last_name, COUNT(last_name) AS Frequency 
FROM employees 
GROUP BY last_name
ORDER BY Frequency DESC;
