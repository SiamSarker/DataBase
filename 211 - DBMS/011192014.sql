/* 1. Show the junior most employee details. */
SELECT * 
FROM employees
WHERE hire_date = (
    SELECT MAX(hire_date)
    FROM employees
);


/* 2. Show the 5th junior most employee details. */
SELECT *
FROM employees as emp1 
WHERE 5-1 = (
    SELECT COUNT(DISTINCT hire_date) 
    FROM employees as emp2
    WHERE emp2.hire_date>emp1.hire_date
);


/* 3. Show the department wise junior most employee details. */
SELECT em1.* 
FROM employees as em1
WHERE hire_date = (
    SELECT MAX(hire_date)
    FROM employees as em2
    WHERE em2.department_id = em1.department_id
);


/* 4. Show the department wise 3rd junior most employee details. */
SELECT *
FROM employees as emp1 
WHERE 3-1 = (
    SELECT COUNT(DISTINCT hire_date) 
    FROM employees as emp2
    WHERE emp2.hire_date>emp1.hire_date
    AND emp2.department_id = emp1.department_id
);


/* 5. Show those managers full details managing minimum number of employees. */
SELECT man.*
FROM employees man
GROUP BY man.manager_id
HAVING COUNT(man.employee_id) = (
    SELECT MIN(man1.total) 
    FROM (
        SELECT COUNT(*) AS total 
        FROM employees e1
        GROUP BY e1.manager_id
    ) AS man1 
);


/* 6. For each year, show the year number and that job id where maximum 
number of employees have joined the company in that year. */
SELECT emp1.year, MAX(emp1.num_emp_joined)
FROM (
    SELECT  YEAR(hire_date) AS year, 
                job_id, 
                COUNT(*) AS num_emp_joined
            FROM employees
            GROUP BY YEAR(hire_date), job_id
) AS emp1
GROUP BY emp1.year;



/* 
    combine the ideas of 6 and 7
    sadly both wrong for now
*/


/* 7. For each department, show the department id and that year number 
when the department hired maximum number of employees in that department. */

SELECT department_id, YEAR(hire_date)
FROM employees
GROUP BY department_id, YEAR(hire_date)
HAVING COUNT(*) = (
        SELECT MAX(d1.num_emp_joined)
        FROM (
        SELECT
            COUNT(*) AS num_emp_joined
            FROM employees
            GROUP BY department_id, YEAR(hire_date)
    ) AS d1
)







