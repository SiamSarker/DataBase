/* 1. Show all the employees first name, their job title, 
their manager first name and their manager job title. */

SELECT emp.first_name AS 'employee name',
    j_e.job_title AS 'employee title',
    man.first_name AS 'manager name',
    j_m.job_title AS 'manager title'
FROM employees AS emp 
    JOIN 
    jobs as j_e
    ON j_e.job_id = emp.job_id
    JOIN 
    employees AS man 
    ON emp.manager_id = man.employee_id
    JOIN 
    jobs as j_m
    ON j_m.job_id = man.job_id;



/* 2. Show all those employees first name and his colleagues 
first name where the colleagues have joined after the
employee. */


SELECT emp.first_name,
    col.first_name
    
FROM    employees AS emp
        JOIN
        employees AS col
        ON emp.HIRE_DATE<col.HIRE_DATE;




/* 3. For each year and each month, count the total number of
employees from job_history table who have left the job. */

SELECT 
    COUNT(*)
FROM job_history
GROUP BY YEAR(end_date), MONTH(end_date);




/* 4. For each country, count the total number of employees who 
works in that country. Don’t consider employees whose
manager is 30 and also don’t consider those country where 
less than 20 employees work. */

SELECT c.country_name,
    COUNT(*)
FROM countries as c
     JOIN
    locations as l ON l.country_id = c.country_id
     JOIN
    departments AS d ON d.location_id = l.location_id
     JOIN
    employees as emp ON emp.department_id = d.department_id

WHERE emp.manager_id != 30
GROUP BY c.country_id;
        


/* 5. For each employee count the total number of employees who 
receives higher salary than him. */

SELECT 
        COUNT(*)

FROM    employees AS emp

        JOIN
        employees AS col
        ON emp.SALARY < col.SALARY
        
GROUP BY emp.EMPLOYEE_ID;



/* 6. For each manager count the total number of employees and 
their average salary who were hired before the manager. */


SELECT 
    COUNT(*),
    AVG(emp.salary)
FROM employees AS emp
    JOIN 
    employees AS man ON man.employee_id = emp.manager_id
WHERE emp.hire_date < man.hire_date
GROUP BY emp.manager_id;



/* 7. For each year and each job id, count the total number of 
employees, their average salary, their maximum
min_salary, their minimum max_salary value. Don’t 
consider those group having average salary less than 3000 and
also don’t consider employees from the year 1994. */


SELECT YEAR(emp.hire_date),
    AVG(emp.salary),
    MAX(j.min_salary),
    MIN(j.max_salary),
    COUNT(*)
FROM jobs as j
    JOIN
    employees as emp
    ON emp.job_id = j.job_id

WHERE YEAR(emp.hire_date) != 1994
GROUP BY YEAR(emp.hire_date), j.job_id
HAVING AVG(emp.salary) < 3000;

