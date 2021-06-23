1.
SELECT * FROM emp 
WHERE emps != 'PRESIDENT' && emps != 'MANAGER'
Order By Salaries ASC;

2.
SELECT * FROM emp 
WHERE SUBSTR(emps, -2, 1) = 'K' AND 
LENGTH(emps) = 5;

3.
SELECT * FROM emp 
WHERE SUBSTR(emps, 3, 1) = 'r' AND 
LEFT(jobs, 1) = 'M' OR LEFT(jobs, 1) = 'A';


4.
SELECT * FROM emp 
WHERE jobs IN {
    SELECT jobs FROM emp 
    WHERE emps = 'ALLEN' 
};


5.
SELECT SUM(salaries) 
FROM emp
GROUP BY department
Having AVG(salaries) >= 3000;


6. -- where is commission attribute ?

SELECT * 
FROM emp
WHERE department IN (20, 30);


8. 
SELECT COUNT(*)
FROM emp 
WHERE salary > 800
GROUP BY job;

9.
SELECT department
FROM dept 
GROUP BY employee
HAVING COUNT(*) > 3;


10.
SELECT DISTINCT department
FROM emp;

11. 12. DDL code


13.
SELECT MAX(salary), MIN(salary), AVG(salary)
FROM emp
GROUP BY jobs;


Select * FROM farmer;
-- Cool with discord