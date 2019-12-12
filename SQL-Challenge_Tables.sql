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

