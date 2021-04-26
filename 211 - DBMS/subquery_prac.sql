/* Show the highest salary value */
 
SELECT MAX(SALARY)
FROM employees;


/* Type 1.1 >> Show the highest salary holder employee details */
SELECT *
FROM employees WHERE SALARY = (
SELECT MAX(SALARY)
FROM employees );



/* practice 1: Show the lowest salary value. */
SELECT MIN(salary)
FROM employees;


/* practice 1.1: Show the lowest salary holder employee details. */
SELECT *
FROM employees
WHERE salary = (
        SELECT MIN(salary)
        FROM employees
);


/* Type 2 >> Show the nth highest salary value */
SELECT SALARY
FROM employees as emp1 WHERE 4-1 = (
SELECT COUNT(DISTINCT SALARY) FROM employees as emp2
WHERE emp2.SALARY>emp1.SALARY
);
/* for 4th highest salary value, use n-1=4-1=3 */ /* for 2nd highest salary value, use n-1=2-1=1 */

/* Type 2.2 >> Show the nth highest salary holder employee details */
SELECT *
FROM employees as emp1 
WHERE 4-1 = (
    SELECT COUNT(DISTINCT SALARY) FROM employees as emp2
    WHERE emp2.SALARY>emp1.SALARY
);


/* practice 2: Show the 3rd highest salary value. */

SELECT salary
FROM employees as emp1 
WHERE 3-1 = (
    SELECT COUNT(DISTINCT SALARY) FROM employees as emp2
    WHERE emp2.SALARY>emp1.SALARY
);

/* practice 2.1: Show the 3rd highest salary holder employee details. */
SELECT *
FROM employees as emp1 
WHERE 3-1 = (
    SELECT COUNT(DISTINCT SALARY) FROM employees as emp2
    WHERE emp2.SALARY>emp1.SALARY
);

/* practice 3: Show the 50th highest salary value. */
SELECT salary
FROM employees as emp1 
WHERE 50-1 = (
    SELECT COUNT(DISTINCT SALARY) FROM employees as emp2
    WHERE emp2.SALARY>emp1.SALARY
);

/* practice 3.1: Show the 50th highest salary holder employee details. */
SELECT *
FROM employees as emp1 
WHERE 50-1 = (
    SELECT COUNT(DISTINCT SALARY) FROM employees as emp2
    WHERE emp2.SALARY>emp1.SALARY
);


/* practice 4: Show the 10th lowest salary value. */
SELECT salary
FROM employees as emp1 
WHERE 10-1 = (
    SELECT COUNT(DISTINCT SALARY) FROM employees as emp2
    WHERE emp2.SALARY<emp1.SALARY
);

/* practice 4.1: Show the 10th lowest salary holder employee details. */
SELECT *
FROM employees as emp1 
WHERE 10-1 = (
    SELECT COUNT(DISTINCT SALARY) FROM employees as emp2
    WHERE emp2.SALARY<emp1.SALARY
);


/* Type 3 >> Show department wise highest salary value */
SELECT DEPARTMENT_ID, MAX(SALARY) AS highest_sal FROM employees
GROUP BY DEPARTMENT_ID;

/* Type 3.1 >> Show department wise highest salary holder employee details */
/* way 1 – using row subquery: */
SELECT *
FROM employees
WHERE (DEPARTMENT_ID, SALARY) = ANY (
    SELECT DEPARTMENT_ID, MAX(SALARY) AS highest_sal FROM employees
    GROUP BY DEPARTMENT_ID
);
/* way 2 – using correlated subquery: */
SELECT e1.*
FROM employees e1 WHERE e1.salary = (
    SELECT MAX(e2.salary)
    FROM employees e2
    WHERE e2.department_id = e1.department_id
);


/* practice 5: Show the department wise lowest salary value. */
SELECT MIN(salary)
FROM employees
GROUP BY department_id;

/* practice 5.1: Show the department wise lowest salary 
holder employee details. */
SELECT em1.* 
FROM employees as em1
WHERE salary = (
    SELECT MIN(salary)
    FROM employees as em2
    WHERE em2.department_id = em1.department_id
);


/* practice 6: Show the department wise most senior employees 
experience value in no of days. */

SELECT DATEDIFF(NOW(), em1.hire_date) 
FROM employees as em1
WHERE hire_date = (
    SELECT MAX(hire_date)
    FROM employees as em2
    WHERE em2.department_id = em1.department_id
);

/* practice 6.1: Show the department wise most senior employee details. */
SELECT em1.* 
FROM employees as em1
WHERE hire_date = (
    SELECT MAX(hire_date)
    FROM employees as em2
    WHERE em2.department_id = em1.department_id
);


/* Type 4 >> Show the department wise nth highest salary value */
SELECT DEPARTMENT_ID, SALARY FROM employees as emp1
WHERE 5-1 = (
    SELECT COUNT(DISTINCT SALARY)
    FROM employees as emp2
    WHERE emp2.SALARY>emp1.SALARY
    AND emp1.DEPARTMENT_ID=emp2.DEPARTMENT_ID
);
/* for 4th highest salary value, use n-1=4-1=3 */ /* for 2nd highest salary value, use n-1=2-1=1 */
/* Type 4.1 >> Show the department wise nth highest salary holder employee details */
SELECT *
FROM employees as emp1 WHERE 5-1 = (
    SELECT COUNT(DISTINCT SALARY)
    FROM employees as emp2
    WHERE emp2.SALARY>emp1.SALARY
    AND emp1.DEPARTMENT_ID=emp2.DEPARTMENT_ID
);

/* practice 7: Show department wise 2nd lowest salary value */
/* practice 7.1: Show department wise 2nd lowest salary holder employee details */


/* Type 5 >> Show the manager id(s) managing maximum no of employees */
SELECT man.employee_id, COUNT(man.employee_id) AS maxcnt 
FROM employees man
GROUP BY man.manager_id
HAVING COUNT(man.employee_id) = (
    SELECT MAX(man1.total) 
    FROM (
    SELECT COUNT(*) AS total FROM employees e1
    GROUP BY e1.manager_id
    ) AS man1 
);


/* practice 9: show the manager details managing minimum no of employees */
SELECT man.*
FROM employees man
GROUP BY man.manager_id
HAVING COUNT(man.employee_id) = (
    SELECT MIN(man1.total) 
    FROM (
    SELECT COUNT(*) AS total FROM employees e1
    GROUP BY e1.manager_id
    ) AS man1 
);


/* practice 10: show the department details having maximum no of employees */

SELECT d.*
FROM employees d
GROUP BY d.department_id
HAVING COUNT(d.employee_id) = (
    SELECT MAX(d1.total) 
    FROM (
    SELECT COUNT(*) AS total FROM employees e1
    GROUP BY e1.department_id
    ) AS d1 
);




/* Type 5.1 >> Show the manager managing nth highest total no of employees */
SELECT mantable.man_id, mantable.emp_cnt 
FROM
(
    SELECT e.manager_id AS man_id, COUNT(e.employee_id) AS emp_cnt FROM employees e
    GROUP BY e.manager_id
) AS mantable
JOIN
(
    SELECT e.manager_id AS man_id, COUNT(e.employee_id) AS emp_cnt FROM employees e
    GROUP BY e.manager_id
) AS mantable1
ON mantable.emp_cnt < mantable1.emp_cnt
GROUP BY mantable.man_id
HAVING COUNT(DISTINCT mantable1.emp_cnt) = 5-1;
/* for 4th highest salary value, use n-1=4-1=3 */ 
/* for 2nd highest salary value, use n-1=2-1=1 */













