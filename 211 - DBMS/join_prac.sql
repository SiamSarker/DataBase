-- 5:05 PM
-- 6:14 PM

-- 1. Show the region_name and corresponding country_name

SELECT rg.region_name,
    cn.country_name
FROM regions as rg 
    JOIN 
    countries as cn
    ON rg.region_id = cn.region_id;


SELECT	c.country_name,
		r.region_name
        
FROM	countries AS c

		JOIN
        regions AS r
        ON c.region_id = r.region_id;



-- 2. Show the department_name and corresponding country_name.


SELECT dp.department_name,
    cn.country_name
FROM departments as dp 
    JOIN 
    locations ON dp.location_id = locations.location_id
    JOIN 
    countries AS cn
    ON cn.country_id = locations.country_id;



-- 6:30PM

-- 3. Show the employee_name and his job place country_name.


SELECT nm.first_name,
    cn.country_name
FROM employees as nm 
    JOIN
    departments AS dp ON dp.manager_id = nm.employee_id
    JOIN
    locations AS l ON l.location_id = dp.location_id
    JOIN 
    countries AS cn ON cn.country_id = l.country_id;


-- 5:20 PM


--4. Show the employee_name and his job_title.

SELECT na.first_name,
    cn.job_title
FROM employees as na 
    JOIN 
    jobs AS cn ON cn.job_id = na.job_id;

-- 6:40PM
-- 6:50PM


-- 5. Show the employee_name and his manager_name

SELECT emp.first_name,
    man.first_name
FROM employees AS emp 
    JOIN 
    employees AS man 
    ON emp.manager_id = man.employee_id;


-- 7:10PM


-- 6. Show the department_name and the manager_name of corresponding department.


SELECT dp.department_name,
    man.first_name
FROM departments AS dp 
    JOIN 
    employees AS man 
    ON dp.department_id = man.employee_id;



-- 7. Show the employee_id, his salary, his manager_id, 
-- his manager_name, his manager_salary.


SELECT emp.first_name AS df,
    emp.salary as fg,
    emp.manager_id as rgt,
    man.first_name,
    man.salary
FROM employees AS emp 
    JOIN 
    employees AS man 
    ON emp.manager_id = man.employee_id;



-- 8. Show the employee_id, his join_date, his manager_id, 
-- his manager_name, his manager_salary.

-- 7:20PM

SELECT emp.employee_id AS df,
    emp.hire_date as fg,
    emp.manager_id as rgt,
    man.first_name,
    man.salary
FROM employees AS emp 
    JOIN 
    employees AS man 
    ON emp.manager_id = man.employee_id;



-- 9. Show the manger_name and his manager_name (manager of manager).

SELECT
    man.first_name AS er,
    man_man.first_name
FROM employees AS emp 
    JOIN 
    employees AS man 
    ON emp.manager_id = man.employee_id
    JOIN 
    employees man_man
    ON man.manager_id = man_man.employee_id;




-- 7:30PM

-- 10. Show the employee name and his manager name only for those 
-- employees who have joined after this manager.


SELECT emp.first_name AS df,
    man.first_name
FROM employees AS emp 
    JOIN 
    employees AS man 
    ON emp.manager_id = man.employee_id
WHERE YEAR(emp.hire_date) > YEAR(man.hire_date);



-- 11. Show the employees name and other employees 
-- name who receives higher salary than him

-- 7:40PM
-- 7:50PM

SELECT emp1.first_name AS df,
    emp2.first_name AS rtt

FROM employees emp1
    JOIN 
    employees emp2
    ON emp1.salary > emp2.salary;



-- 12. Show the employees name and other employees name who is hired after him.

SELECT emp1.first_name AS df,
    emp2.first_name AS rtt

FROM employees emp1
    JOIN
    employees emp2
    ON YEAR(emp1.hire_date) < YEAR(emp2.hire_date);



-- 13. For each region, show the region_name and total 
-- no of employees in that region.

-- 8:00PM
-- 8:20PM

SELECT r.region_name,
    COUNT(*)
FROM regions as r
    LEFT JOIN
    countries as co ON co.region_id = r.region_id
    LEFT JOIN
    locations AS l ON l.country_id = co.country_id
    LEFT JOIN 
    departments AS d ON d.location_id = l.location_id
    LEFT JOIN
    employees as emp
    ON emp.employee_id = d.manager_id
GROUP BY r.region_name;




-- 14. For each job, show the job_title and total no of employees.


SELECT j.job_title,
    COUNT(*)
FROM jobs as j
    LEFT JOIN
    employees as emp ON emp.job_id = j.job_id
    
GROUP BY j.job_id, j.job_title;


-- 8:40PM

-- 15. For each country, show the total no of departments 
-- in that country.

SELECT c.country_name,
    COUNT(*)
FROM countries as c
    LEFT JOIN
    locations as l ON l.location_id = c.country_id
    LEFT JOIN
    departments AS d ON d.location_id = l.location_id
    
GROUP BY c.country_id, c.country_name;



-- 16. For each department, show the department_name and 
-- corresponding total no of ex-employees (job_history table)
--  from that department.


SELECT d.department_name,
    COUNT(*)
FROM departments as d
    LEFT JOIN
    job_history as j ON j.department_id = d.department_id
    
GROUP BY d.department_id, d.department_name;


-- 8:50PM


/* show the employee name, manager name */

SELECT	emp.first_name AS 'employee name',
		man.first_name AS 'manager name'
        
FROM	employees AS emp

		JOIN
        employees AS man
        ON emp.manager_id = man.employee_id;

-- 17. For each manager, show the manager_name and total no 
-- of employees under his supervision.


SELECT man.manager_id as id,
    emp.first_name as rt,
    COUNT(*)
FROM employees AS man
    JOIN 
    employees AS emp ON emp.employee_id = man.manager_id
GROUP BY man.manager_id;


-- 9:10PM




--      problem in assigning manager name. So I did same mistaks
--     in privious quires. so check all again




-- 18. For each manager, show the manager_name and total no of 
-- employees under his supervision who receives higher salary than him.

SELECT man.manager_id as id,
    emp.first_name as rt, 
    COUNT(*)
FROM employees AS man
    JOIN 
    employees AS emp ON emp.employee_id = man.manager_id
WHERE man.salary < emp.salary
GROUP BY man.manager_id;

-- WRONG/ maybe




-- 19. Show the employee name and no of employees who receives 
-- lower salary than him.

SELECT  myself.first_name,
        COUNT(*)

FROM    employees AS myself

        JOIN
        employees AS col
        ON myself.SALARY>col.SALARY
        
GROUP BY myself.EMPLOYEE_ID, myself.first_name
HAVING  COUNT(*)>=20;


--20. Show the employee name and count the total no of colleagues who is senior to him.


SELECT  myself.FIRST_NAME,
col.first_name
        /* COUNT(*) */
    
FROM    employees AS myself

        JOIN
        employees AS col
        ON myself.HIRE_DATE>col.HIRE_DATE;
        
GROUP BY myself.EMPLOYEE_ID, myself.FIRST_NAME

