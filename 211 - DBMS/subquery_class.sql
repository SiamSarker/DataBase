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



-- 3. for each year find out the minimum no of employees
-- hired by any department.


SELECT MIN(dt.num_emp)
FROM
(
    SELECT YEAR(hire_date) as year, department_id as d_id,
    COUNT(*) as num_emp
    FROM employees  
    GROUP BY YEAR(hire_date), department_id
) AS dt
GROUP BY dt.year;




-- 4. for each employee,
-- show his employee id,
-- total no of employee hired after him and
-- total no of employee hired before him


SELECT myself.employee_id as my,
    COUNT(*) as after_num_emp
FROM employees AS myself
    JOIN 
    employees AS col
    ON myself.hire_date < col.hire_date
GROUP BY myself.employee_id;


SELECT myself1.employee_id as my1,
    COUNT(*) as before_num_emp
FROM employees AS myself1
    JOIN 
    employees AS col1
    ON myself1.hire_date > col1.hire_date
GROUP BY myself1.employee_id;


-- final query

SELECT af_tb.my,
    af_tb.after_num_emp,
    bf_tb.before_num_emp
FROM (
    SELECT myself.employee_id as my,
    COUNT(*) as after_num_emp
FROM employees AS myself
    JOIN 
    employees AS col
    ON myself.hire_date < col.hire_date
GROUP BY myself.employee_id
) AS af_tb
JOIN 
(
    SELECT myself1.employee_id as my1,
    COUNT(*) as before_num_emp
FROM employees AS myself1
    JOIN 
    employees AS col1
    ON myself1.hire_date > col1.hire_date
    GROUP BY myself1.employee_id
) AS bf_tb
ON af_tb.my = bf_tb.my1;








-- Corelated subquery


-- find out the highest salary employee details 
-- from each department.

-- way - 1: row subquery

-- department wise max salary




SELECT *
FROM employees
WHERE (department_id, salary) = ANY (
    SELECT department_id, MAX(salary) as max_sal
    FROM employees
    GROUP BY department_id
);



-- corelated subquery

SELECT *
FROM employees e1
WHERE salary = (
    SELECT MAX(salary)
    FROM employees as e2
    WHERE e2.department_id = e1.department_id
);











