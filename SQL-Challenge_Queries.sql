DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dep_employees;
DROP TABLE IF EXISTS dep_manager;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;

-- Generate employees Table
CREATE TABLE employees (
	emp_no INTEGER PRIMARY KEY,
    birth_date DATE,
    first_name VARCHAR(30),
	last_name VARCHAR (30),
	gender VARCHAR (1),
	hire_date DATE
);
-- View table columns and datatypes
SELECT * FROM employees;

-- Generate departments Table
CREATE TABLE departments (
    dept_no VARCHAR(30) PRIMARY KEY,
    dept_name VARCHAR(30) 
);
-- View table columns and datatypes
SELECT * FROM departments;

-- Generate dep_employees Table
CREATE TABLE dep_employees (
    emp_no INTEGER,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	dept_no VARCHAR(30),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    from_date DATE,
	to_date DATE
);
-- View table columns and datatypes
SELECT * FROM dep_employees;

-- Generate dep_manager Table
CREATE TABLE dep_manager (
	dept_no VARCHAR(30),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	emp_no INTEGER,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    from_date DATE,
	to_date DATE
);
-- View table columns and datatypes
SELECT * FROM dep_manager;

-- Generate salaries Table
CREATE TABLE salaries (
	emp_no INTEGER,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	salary INTEGER,	
    from_date DATE,
	to_date DATE
);
-- View table columns and datatypes
SELECT * FROM salaries;

-- Generate titles Table
CREATE TABLE titles (
	emp_no INTEGER,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	title VARCHAR (30),	
    from_date DATE,
	to_date DATE
);
-- View table columns and datatypes
SELECT * FROM titles;

-- Performing Queries

-- 1) List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
FROM employees
INNER JOIN salaries
ON salaries.emp_no = employees.emp_no;

-- 2)List employees who were hired in 1986
SELECT emp_no,last_name,hire_date
FROM employees
WHERE hire_date LIKE '1986%';

-- 3)List the manager of each department with the following information: department number, 
-- department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT dep_manager.dept_no, departments.dept_name, employees.emp_no, employees.last_name, employees.first_name, dep_manager.from_date, dep_manager.to_date
FROM dep_manager
INNER JOIN employees
ON employees.emp_no = dep_manager.emp_no
INNER JOIN departments
ON departments.dept_no = dep_manager.dept_no;

-- 4)List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
SELECT dep_employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dep_employees
INNER JOIN departments
ON dep_employees.dept_no = departments.dept_no
INNER JOIN employees
ON employees.emp_no = dep_employees.emp_no;

-- 5)List all employees whose first name is "Hercules" and last names begin with "B".
SELECT emp_no,first_name,last_name
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';



