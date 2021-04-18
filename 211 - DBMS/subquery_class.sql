-- 1. show all those employee details who recevies higher salary
-- than any of the emoloyees salary from dept. id 100.

SELECT *
FROM employees
WHERE salary > ANY (
    SELECT salary
    FROM employees
    WHERE department_id = 100
);



-- 2. show all those employee details who recevies higher salary
-- than all the emoloyees salary from dept. id 100.

SELECT *
FROM employees
WHERE salary > ALL (
    SELECT salary
    FROM employees
    WHERE department_id = 100
);


-- 3. show all those employee deatils who receives higher
-- salary than any of the departments maximum salary. 

SELECT *
FROM employees
WHERE salary > ANY (
    SELECT MAX(salary)
    FROM employees
    GROUP BY department_id
);



-- 4. find out those employees who don't work in it job type
-- and also receives lower salary than any other employee
-- in it job type

SELECT *
FROM employees
WHERE job_id != 'It_prog'
    AND 
    salary < ANY (
    SELECT salary
    from employees
    WHERE job_id = 'It_prog'
    );








-- ROW Subquerey

-- 1. show all thoese employees details who works in the same
-- department as employee id 110 AND 
-- also receives the same salary of employee id 110


SELECT * 
FROM employees
WHERE (department_id, salary) = (
    SELECT department_id, salary
    FROM employees
    WHERE employee_id = 110
);











-- Derived subquerey

-- inner query return 1 table, (temporary table) 



-- 1. show the minimum number of employees 
-- managed by any manager.


SELECT MAX(dt.num_emp)
FROM (
    SELECT COUNT(*) as num_emp
    FROM employees

    GROUP BY manager_id
) as dt;



-- 2. show the minimum amount of total salary
-- provided by a department


SELECT MIN(dt.total_sal)
FROM (
    SELECT department_id, sum(salary) as total_sal
    FROM employees
    GROUP BY department_id
) as dt;



-- 3. show all those
--





















