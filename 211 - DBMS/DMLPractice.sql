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


