-- 1. Show each region_id and corresponding 
-- no of countries in that region from countries table.

SELECT region_id,
    COUNT(*)
FROM countries
GROUP BY region_id;



-- 2. Show the location_id and corresponding 
-- no of departments in that location from departments table.

SELECT location_id,
    COUNT(*)
FROM departments
GROUP BY location_id;



-- 3. For each department_id, show the no of employees 
-- in that department from employees table.


SELECT department_id,
    COUNT(*)
FROM employees
GROUP BY department_id;



-- 4. For each manager_id, show the no of employees 
-- under his supervision from employees table.


SELECT manager_id,
    COUNT(*)
FROM employees
GROUP BY manager_id;



-- 5. For each job_id, show the no of employees 
-- in that job type from employees table.


SELECT 
    COUNT(*)
FROM employees
GROUP BY job_id;




-- 6. For each department_id, show the 
-- no of managers from that department using employees table.


SELECT 
    COUNT(*)
FROM employees
GROUP BY department_id;



-- 7. Count the total number of employees joined in 
-- the even month and total number of employees joined in
-- the odd number months from the employees table.


-- 2:20 PM
-- 2:30 PM

SELECT 
    COUNT(*)
FROM employees
GROUP BY MONTH(hire_date) % 2;


-- 2:40 PM

-- 8. Show the department wise total no of employees, maximum and
--  minimum salary in that department, average and total salary 
--  provided by that department from the employees table.


SELECT 
    COUNT(*),
    MAX(salary),
    MIN(salary),
    AVG(salary)
FROM employees
GROUP BY department_id;



-- 9. For each year, show the total no of employees who were hired
-- during that year from the employees table.

-- 2:50 PM

SELECT YEAR(hire_date) AS grp_year,
    COUNT(*)
FROM employees
GROUP BY grp_year;





-- 10. Show the total no of jobs within 0k to 10k, 10k to 20k and 
-- so on salary ranges(max_salary-min_salary) groups
-- from the jobs table.


-- 3 PM
-- 3:10 PM
-- 3:30 PM


-- problem 


SELECT max_salary-min_salary,
    CASE 
                WHEN max_salary-min_salary < 10000 THEN 'C'
                WHEN max_salary-min_salary BETWEEN 10000 AND 20000 THEN 'B'
                ELSE 'A'
        END AS salary_class
FROM jobs
GROUP BY max_salary-min_salary;




SELECT 	department_id,
		CASE
        	WHEN salary<10000 THEN 'C'
            WHEN salary BETWEEN 10000 AND 20000 THEN 'B'
            ELSE 'A'
        END AS salary_class,
        AVG(salary)
        
FROM 	employees
-- #WHERE
GROUP BY DEPARTMENT_ID, salary_class;
-- #HAVING






-- 11. For each country_id, show the total no of locations 
-- in that country from the locations table.


SELECT COUNT(*)
FROM locations
GROUP BY country_id;



-- 12. For each city, show the total no of locations in that city 
-- from the locations table.


SELECT COUNT(*)
FROM locations
GROUP BY city;



-- 13. Group and count employees based on the first 
-- letter of their names. (max 26 groups as 26 alphabets)

-- 3:40 PM

SELECT 
    LEFT(first_name, 1),
    COUNT(*)
FROM employees
GROUP BY LEFT(first_name, 1);


-- 14. For each job_id and each department, show the total 
-- no of employees in that group from the employees table.


SELECT 
    COUNT(*)
FROM employees
GROUP BY job_id, department_id;




-- 15. For each year and each month, show the total 
-- no of employees who have left their jobs from the job_history table.


SELECT 
    COUNT(*)
FROM job_history
GROUP BY YEAR(end_date), MONTH(end_date);


-- 3:50 PM
