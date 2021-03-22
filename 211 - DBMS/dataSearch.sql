USE USE hr_schema;

1.
SELECT * FROM tablename
/* * all */


2. COLUMN FILTER (showing specific cloums)
SELECT col1, col2, col3 
FROM tablename


3. COLUMN aliasing/renaming:
/* SELECT col1+col2 AS 'SUM DATA',
        col3 AS 'COLUMN 3',
        col4*col5 AS 'Cross'  */
FROM tablename

/* SELECT  SALARY AS 'Salary without commission',
		SALARY/1000 AS 'Salary in thousand format',
		SALARY + SALARY * COMMISSION_PCT AS 'final Salary'
FROM employees */

4. row filtering (showing specific data)
SELECT * | col1, col2+col3,...
FROM tablename
WHERE condition;

SELECT *
FROM employees
WHERE DEPARTMENT_ID = 50 and SALARY > 3000


5. showing sorted data:
SELECT * | col1, col2+col3,...
FROM tablename
WHERE condition
ORDER BY col1 ASC|DESC, col2 ASC|DESC....

SELECT  FIRST_NAME,
		EMAIL,
        SALARY,
        HIRE_DATE
FROM employees
ORDER  BY HIRE_DATE ASC


6. showing distinct rows/data
SELECT DISTINCT col1, col2                 /* (both distinct check and keeps when difference in any column) */
FROM tablename

/* show all the manager ids from employees */
SELECT DISTINCT MANAGER_ID
FROM employees
ORDER BY MANAGER_ID ASC


7. showing limitd number of rows
SELECT * | col1, col2+col3,...
FROM tablename
WHERE condition
ORDER BY col1 ASC|DESC, col2 ASC|DESC....
LIMIT 3 |  /* how many */
LIMIT 4, 1 /* 4 skip/offset data, 1 show/row count */

/* show the 10th highest salary holder employee details from 50 number department */
SELECT *
FROM employees
WHERE DEPARTMENT_ID = 50
ORDER BY SALARY DESC
LIMIT 9,1


exercise:

/* show the first name and salary value in thousand foemat */
SELECT FIRST_NAME,
		/* SALARY DIV 1000 AS 'sal in thousand', */
 		/* SALARY/1000 AS 'sal in thousand in floating' */
FROM employees


/* show the employee details who works in depertment no 50 whoese id is 101 */
SELECT * 
FROM employees
WHERE DEPARTMENT_ID = 50 AND MANAGER_ID = 101


/* show those employee details whose salary is greater than or equal 5000 and whoes salary is less than or equal 20000  */
SELECT * 
FROM employees
#WHERE SALARY >= 5000 AND SALARY <=20000
WHERE SALARY BETWEEN 10000 AND 20000


/* show those employee details whose manager id is either 205 or 121 or 101 or 110  */
SELECT * 
FROM employees
WHERE MANAGER_ID IN(205, 121, 101, 110)


LIKE operator:

string match

string pattern match using like operator

% = 0 to inf character (star operation)
_ = exactly 1 character (plus operation)


ex. start with a
WHERE FIRST_NAME LIKE 'a%'

ex. ends with a
WHERE FIRST_NAME LIKE '%a'

ex. name contains 'abc'
WHERE FIRST_NAME LIKE '%abc%'

ex. name consists of 3 characters
WHERE FIRST_NAME LIKE '___'

ex. name consists at least 3 characters
WHERE FIRST_NAME LIKE '___%'


/* show those employee details whose first name has 3 letters  */
SELECT * 
FROM employees
WHERE FIRST_NAME LIKE '___'




Conditional Statement(online included):



ex.
show the employees first name and their job rank.

calculate salary rank from the following criteria:

salary > 22000 - salary rank 'A'
15000 <= salary <= 22000 - salary rank 'B'
salary < 15000 - salary rank 'C'

SELECT  FIRST_NAME,
        CASE 
            WHEN SALARY > 22000 THEN 'A'
            WHEN SALARY BETWEEN 15000 AND 22000 THEN 'B'
            ELSE 'C'
        /* END AS 'salary rank' */
FROM employees






Numeric Function :

ROUND(1.35)  ==> 1
ROUND(1.35, 1)  ==> 1.4
TRUNCATE(1.35, 1) ==> 1.3




NUMERIC, String, Date fn - rowwise function


SELECT * | col1, col2+col3, fn(col1)


SELECT f_name, LENGTH(f_name)
FROM table1

/* show the employees first name and no of characters of their first name */
SELECT FIRST_NAME, LENGTH(FIRST_NAME)
FROM employees


REVERSE()
/* show the employee details whose first name is a pallindrome */
SELECT *
FROM employees
WHERE FIRST_NAME = REVERSE(FIRST_NAME)


salary = 11235 tk


11235 DIV 1000 = 11

(11235%1000) DIV 100 = 2

(11235%100) = 35



WEONG
/* show the employee first name and salary in 'x thousand y hundred z taka only' */
SELECT  FIRST_NAME,
		CONCAT(
			SALARY DIV 1000,
        	' thousand ',
        	(SALARY%1000) DIV 100,
         	' handred ',
         	SALARY % 100,
         	' taka only '
         ) AS 'salary in words'
FROM employees






SUBSTR(str, pos, len)

LEFT(str, len)

RIGHT(str, len)

LPAD(str, len, padstr)
RPAD(str, len, padstr)



missed some part


DATETIME FUNCTION:

DATEDIF(datetime1, datetime2) #number of days