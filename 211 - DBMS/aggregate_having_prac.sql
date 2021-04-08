-- 4 PM

-- 1. Show only those manager_ids who handle more than 5 employees.

SELECT manager_id
FROM employees
GROUP BY manager_id
HAVING COUNT(*) > 5;



-- 2. Show only those department_ids where in 
-- total salary expense is more than 100000 dollar.


SELECT department_id
FROM employees
GROUP BY department_id
HAVING SUM(salary) > 100000;



-- 3. Count the total no of employees for each department. 
-- Don’t consider employees of job_id “AD_PRESS” and also
-- consider only those departments where total no of employees is 
-- greater than 5.

-- 4:10 PM
SELECT department_id, COUNT(*)
FROM employees
WHERE job_id != 'AD_PRES'
GROUP BY department_id
HAVING COUNT(*) > 5;



-- 4. Group employees based on the first 3 digit of their phone number. 
-- Avoid employees from department no 10/20/60 and also avoid those groups 
-- where total salaries of employees is less than 50000.


SELECT LEFT(phone_number, 3),
    COUNT(*)
FROM employees
WHERE department_id NOT IN (10, 20, 60)
GROUP BY LEFT(phone_number, 3)
HAVING SUM(salary) < 50000;



-- 4:20 PM


-- 5. For each year and each month, count total number of employees 
-- joined from employees table. Don’t consider those year and months 
-- where total number of hired employees are less than 20.


SELECT 
    COUNT(*)
FROM employees
GROUP BY YEAR(hire_date), MONTH(hire_date)
HAVING COUNT(*) < 20;




-- 6. For each country and each city, count total number of locations 
-- from locations table. Don’t consider locations from city ‘US’ and 
-- also don’t consider those country and city having less than 5 locations.


SELECT country_id,
    COUNT(*)
FROM locations
WHERE country_id != 'US'
GROUP BY country_id, city
HAVING COUNT(*) >= 5;


-- 4:30 PM



