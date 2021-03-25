1. Basic SELECT Statement

SELECT * FROM countries;
SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM job_history;



2. LIKE / NOT LIKE

SELECT * 
FROM employees
WHERE first_name LIKE 's%';

SELECT * 
FROM employees
WHERE first_name NOT LIKE 's%';

SELECT * 
FROM employees
WHERE first_name LIKE '%a';

SELECT * 
FROM employees
WHERE first_name LIKE '%da%';

SELECT * 
FROM employees
WHERE first_name LIKE 's%a';

SELECT * 
FROM employees
WHERE first_name LIKE 's%' OR first_name LIKE 'a%';

SELECT * 
FROM employees
WHERE first_name LIKE '%o%' AND first_name LIKE '%a%';

SELECT * 
FROM employees
WHERE first_name LIKE '%oa%';

SELECT * 
FROM employees
WHERE first_name LIKE '___';

SELECT * 
FROM employees
WHERE first_name LIKE '___%';

SELECT * 
FROM employees
WHERE first_name LIKE '%a_';




3. IN() / NOT IN()

SELECT * 
FROM countries
WHERE country_id IN ('AU', 'BR', 'CN', 'JP');

SELECT * 
FROM departments
WHERE department_id NOT IN (204, 100, 145);

SELECT * 
FROM employees
WHERE job_id IN ('ST_MAN', 'IT_PROG');

SELECT * 
FROM employees
WHERE department_id NOT IN (100, 30, 90);

SELECT * 
FROM locations
WHERE postal_code IN (2901, 50090);

SELECT * 
FROM locations
WHERE city IN ('Roma', 'Venice', 'Tokyo');





4. BETWEEN … AND… / NOT BETWEEN … AND …

SELECT * 
FROM departments
WHERE location_id BETWEEN 1000 AND 2000;

SELECT * 
FROM employees
WHERE salary BETWEEN 10000 AND 20000;

SELECT * 
FROM employees
WHERE hire_date BETWEEN '1987-01-01' AND '1987-06-30';

SELECT * 
FROM employees
WHERE employee_id NOT BETWEEN 50 AND 60;

SELECT * 
FROM jobs
WHERE max_salary BETWEEN 5000 AND 10000
	AND min_salary BETWEEN 5000 AND 10000;

SELECT * 
FROM job_history
WHERE end_date BETWEEN '1998-12-01' AND '1998-12-31';

