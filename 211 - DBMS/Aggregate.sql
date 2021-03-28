
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