
Aggregate Fn:
-------------

SUM()
AVG()
MAX()
MIN()
COUNT()



SELECT SUM(col1), AVG(col2), MAX(col2), MIN(col2), COUNT(col2)
FROM table1;

default full table is group

output: no of groups;




-- show the total salary, average salary, maximum salary, number of
-- all time employess

SELECT SUM(salary),
        AVG(salary),
        MAX(salary),
        MIN(salary),
        COUNT(*)
FROM employees;



-- Creating Groups

SELECT department_id, COUNT(*)
FROM employees
GROUP BY department_id;

-- managed by each manager

SELECT manager_id, COUNT(*), MAX(salary)
FROM employees
GROUP BY manager_id;


-- year wise employee recruited

SELECT YEAR(hire_date), COUNT(*)
FROM employees
GROUP BY YEAR(hire_date);



-- count alphabetwise total number of employees 

SELECT LEFT(first_name, 1),
    COUNT(*)
    
FROM employees
GROUP BY LEFT(first_name, 1);



-- count alphabetwise total number of employees 
-- don not consider employees which job type is'IT_PROG'

SELECT LEFT(first_name, 1),
    COUNT(*)

FROM employees
WHERE job_id != 'IT_PROG'
GROUP BY LEFT(first_name, 1);




-- count alphabetwise total number of employees 
-- don not consider employees which job type is'IT_PROG'
-- Only consider when count number is higher than 5 in decending order

SELECT LEFT(first_name, 1),
    COUNT(*) AS cnt

FROM employees
WHERE job_id != 'IT_PROG'
GROUP BY LEFT(first_name, 1)
HAVING COUNT(*) > 5
ORDER BY cnt DESC;


