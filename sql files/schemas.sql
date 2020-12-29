-- create departments table 

CREATE TABLE departments (
	dept_no VARCHAR (30) NOT NULL,
	dept_name VARCHAR (255) NOT NULL,
	PRIMARY KEY (dept_no)
);

select * from departments

-- create titles table 
CREATE TABLE titles (
	title_id VARCHAR (30) NOT NULL,
	title VARCHAR (30) NOT NULL,
	PRIMARY KEY (title_id)
); 

select * from titles 

-- create employees table 
DROP TABLE employees 

CREATE TABLE employees (
	emp_no INTEGER NOT NULL, 
	emp_title_id VARCHAR (30) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR (30) NOT NULL,
	last_name VARCHAR (30) NOT NULL,
	sex VARCHAR (2) NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

select * from employees 

--Create table dept_emp 

DROP TABLE dept_emp 

CREATE TABLE dept_emp (
	emp_no INTEGER NOT NULL, 
	dept_no VARCHAR (30) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

select * from dept_emp 

-- create table dept_managers 
DROP TABLE dept_managers 

CREATE TABLE dept_managers (
	dept_no VARCHAR (30) NOT NULL,
	emp_no INTEGER NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

select * from dept_managers

-- create table salaries 
DROP TABLE salaries 

CREATE TABLE salaries (
	emp_no INTEGER NOT NULL,
	salary INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

select * from salaries 


