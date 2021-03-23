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

