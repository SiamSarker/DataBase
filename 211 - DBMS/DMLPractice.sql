--          1. Basic SELECT Statement

SELECT * FROM countries;
SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM job_history;



--           2. LIKE / NOT LIKE

SELECT * 
FROM employees
WHERE first_name LIKE 's%';

SELECT * 
FROM employees
WHERE first_name NOT LIKE 's%';

SELECT * 
FROM employees
WHERE first_name LIKE '%a';

SELECT * 
FROM employees
WHERE first_name LIKE '%da%';

SELECT * 
FROM employees
WHERE first_name LIKE 's%a';

SELECT * 
FROM employees
WHERE first_name LIKE 's%' OR first_name LIKE 'a%';

SELECT * 
FROM employees
WHERE first_name LIKE '%o%' AND first_name LIKE '%a%';

SELECT * 
FROM employees
WHERE first_name LIKE '%oa%';

SELECT * 
FROM employees
WHERE first_name LIKE '___';

SELECT * 
FROM employees
WHERE first_name LIKE '___%';

SELECT * 
FROM employees
WHERE first_name LIKE '%a_';




--           3. IN() / NOT IN()

SELECT * 
FROM countries
WHERE country_id IN ('AU', 'BR', 'CN', 'JP');

SELECT * 
FROM departments
WHERE department_id NOT IN (204, 100, 145);

SELECT * 
FROM employees
WHERE job_id IN ('ST_MAN', 'IT_PROG');

SELECT * 
FROM employees
WHERE department_id NOT IN (100, 30, 90);

SELECT * 
FROM locations
WHERE postal_code IN (2901, 50090);

SELECT * 
FROM locations
WHERE city IN ('Roma', 'Venice', 'Tokyo');





--           4. BETWEEN … AND… / NOT BETWEEN … AND …

SELECT * 
FROM departments
WHERE location_id BETWEEN 1000 AND 2000;

SELECT * 
FROM employees
WHERE salary BETWEEN 10000 AND 20000;

SELECT * 
FROM employees
WHERE hire_date BETWEEN '1987-01-01' AND '1987-06-30';

SELECT * 
FROM employees
WHERE employee_id NOT BETWEEN 50 AND 60;

SELECT * 
FROM jobs
WHERE max_salary BETWEEN 5000 AND 10000
	AND min_salary BETWEEN 5000 AND 10000;

SELECT * 
FROM job_history
WHERE end_date BETWEEN '1998-12-01' AND '1998-12-31';





--        5.  CASE WHEN … WHEN … ELSE … END statement

SELECT employee_id, 
	start_date,
	job_id,
	CASE 
		WHEN start_date <=  '1989-12-31' THEN 'C'
		WHEN start_date BETWEEN '1900-01-01' AND '1994-12-31' THEN 'B'
		ELSE 'A'
	END AS 'Group Name'
FROM job_history;

SELECT department_name,
	location_id,
	CASE 
		WHEN location_id <  1200 THEN 'C'
		WHEN location_id BETWEEN 1200 AND 2000 THEN 'B'
		ELSE 'A'
	END AS 'Location Group Name'
FROM departments;

SELECT job_id,
	job_title,
	CASE 
		WHEN job_title LIKE '%president%' THEN 'President'
		WHEN job_title LIKE '%manager%' THEN 'Manager'
		ELSE 'Other'
	END AS 'Job Group Name'
FROM jobs;

SELECT location_id, 
	city, 
	state_province,
	CASE 
		WHEN city IN ('Tokyo', 'Venice', 'Toronto', 'Oxford', 'Singapore') THEN 'A'
		WHEN city IN ('Mexico City', 'London', 'Sydney', 'Seattle', 'Beijing' ) THEN 'B'
		ELSE 'C'
	END AS 'Location Group Name'
FROM locations; 

SELECT employee_id, 
	start_date, 
	end_date,
	CASE 
		WHEN DATEDIFF(end_date, start_date) > 1200 THEN 'A'
		WHEN DATEDIFF(end_date, start_date) BETWEEN 600 AND 1200 THEN 'B'
		ELSE 'C'
	END AS 'SENIORITY_LEVEL'
FROM job_history; 

SELECT job_id, 
	job_title,
	CASE 
		WHEN (max_salary - min_salary) > 20000 THEN 'A'
		WHEN (max_salary - min_salary) BETWEEN 10000 AND 20000 THEN 'B'
		ELSE 'C'
	END AS 'SALARY_RANGE_CLASS'
FROM jobs;





--		4. Numerical and String Functions 

SELECT employee_id,
	LOWER(
		CONCAT(
			LEFT(first_name, 3),
			'_',
			LEFT(last_name, 3)
		)
	)
FROM employees;

SELECT *
FROM employees
WHERE first_name = REVERSE(first_name) OR last_name = REVERSE(last_name);

SELECT employee_id,
	CONCAT(
		email, '@gmail.com'
	) AS 'email'
FROM employees;

SELECT first_name,
	CONCAT(
		RPAD(LEFT(phone_number, 4), LENGTH(phone_number)-1, 'xxx.xxx'),
		RIGHT(phone_number, 1)
	) AS 'phone_number'
FROM employees;

SELECT employee_id,
	email,
	RPAD
	(
		CONCAT(
			first_name,
			' ',
			last_name
		),
		20,
		' '
	) AS 'Full Name'
FROM employees;

SELECT *
FROM locations
WHERE LENGTH(postal_code) <= 5 AND 
	LEFT(postal_code, 2) BETWEEN 50 AND 99;

SELECT *
FROM jobs
WHERE (max_salary-min_salary) > 8000 AND 
    job_title LIKE '%manager%';

SELECT employee_id,
    FLOOR(
        salary * 12* ( 1+(commission_pct/100))
    ) AS 'yearly total salary'
FROM employees;

SELECT *
FROM departments
WHERE SUBSTR(
    location_id, 2, 1
) BETWEEN 5 AND 9;







--              5. Date and Time Functions


SELECT email,
    DATE_FORMAT(hire_date, '%M %D, %Y') AS 'hire_date'
FROM employees;

SELECT email,
    DATE_FORMAT(hire_date, '%b %Y, %d') AS 'hire_date'
FROM employees;

SELECT email,
    DATE_FORMAT(hire_date, '%D %b, %y %h:%s %p') AS 'hire_date'
FROM employees;

SELECT email,
    DATE_FORMAT(hire_date, '%d %b, %Y %W %k:%i') AS 'hire_date'
FROM employees;

SELECT first_name, 
    email, 
    phone_number
FROM employees
WHERE DATE(
    STR_TO_DATE(
        '05 May, 1987 01:00 AM',
        '%d %M, %Y %h:%i %p'
    )
 ) < hire_date;


SELECT first_name, 
    email, 
    phone_number,
    hire_date
FROM employees
WHERE DATE(
    STR_TO_DATE(
        '1st June 1987 11:01 PM',
        '%D %M %Y %h:%i %p'
    )
 ) > hire_date;






-- Assignment 3
SELECT  *
FROM    locations
WHERE   (street_address LIKE '%Rd%' ||  street_address LIKE '%St%') &&
        (country_id ='IT' OR country_id ='JP' OR country_id ='US') AND
        postal_code BETWEEN 1000 AND 20000; 