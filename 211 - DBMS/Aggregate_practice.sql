-- 1. Show the total no of employees, their total salary, 
-- their average salary, their maximum salary, their minimum salary from employees table.

SELECT COUNT(*),
    SUM(salary),
    AVG(salary),
    MAX(salary),
    MIN(salary)
FROM employees;


-- 2. Show the maximum and minimum experienced employees 
-- hire dates from employees table.

SELECT MIN(hire_date) AS most_experienced,
    MAX(hire_date)
FROM employees;



-- 3. Show the maximum experienced employee hire date working 
-- in department number 50 from employees table


SELECT MIN(hire_date) AS most_experienced,
    MAX(hire_date)
FROM employees
WHERE department_id = 50;



-- 4. Show the number of departments located 
-- in location id 1700 from departments table.

SELECT COUNT(*)
FROM departments
WHERE location_id = 1700;



-- 5. Show the most recent retired employee’s end 
-- date working in department number 80 from job history table.


SELECT MAX(end_date)
FROM job_history
WHERE department_id = 80;




-- 6. Show the maximum and minimum value of min_salary column, 
-- maximum and minimum value of max_salary column from jobs table.


SELECT MAX(min_salary),
    MIN(min_salary),
    MAX(max_salary),
    MIN(max_salary)
FROM jobs;



-- 7. Count the number of employees managed by manager id 114 from employees table.

SELECT COUNT(*)
FROM employees
WHERE manager_id = 114;



-- 8. Count the total number of distinct job_ids from employees table.

SELECT COUNT(DISTINCT job_id)
FROM employees;



--9. Count the distinct number of countries from locations table.

SELECT COUNT(DISTINCT country_id)
FROM locations;


-- 10. Count the total number of locations located in ‘US’ from locations table.

SELECT COUNT(*)
FROM locations
WHERE country_id = 'US';




-- 11. Show the maximum and minimum salary range value 
-- (i.e. salary range = max_salary - min_salary) from jobs table.

SELECT MAX(max_salary - min_salary),
    MIN(max_salary - min_salary)
FROM jobs;




-- 12. Count the number of employees 
-- whose employee id is greater than his manager id.

SELECT COUNT(*)
FROM employees
WHERE employee_id > manager_id;


