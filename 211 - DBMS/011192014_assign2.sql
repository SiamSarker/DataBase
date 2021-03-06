-- 1. Show the 4th senior most employee id from the job history table.
-- Here, experience = end_date – start_date

SELECT employee_id
FROM job_history
ORDER BY DATEDIFF(end_date, start_date) DESC
LIMIT 3, 1;



-- 2. Show the top 5 lowest gross salary holder employees first name and gross salary.
-- Here, gross salary = salary+salary*commission_pct

SELECT first_name,
        salary + (salary* IFNULL(commission_pct, 0)) AS gross_salary
FROM employees
ORDER BY gross_salary ASC
LIMIT 5;



-- 3. Show those location details whose
--  street_address contains the word ‘Rd’ or ‘St’ and
--  country id is either ‘IT’ or ‘JP’ or ‘US’ and
--  postal code is within the range 1000 to 20000 inclusive.

SELECT *
FROM locations
WHERE (street_address LIKE '%Rd%' OR street_address LIKE '%St%') AND
    (country_id = 'IT' OR country_id = 'JP' OR country_id = 'US') AND
    postal_code BETWEEN 1000 AND 20000; 




-- 4. Show all the employees first name, email and manager id. Show the output in ascending order of manager id. If
-- multiple employees have the same manager id then also sort them from junior to seniority level.

SELECT first_name, email, manager_id
FROM employees
ORDER BY manager_id ASC, hire_date DESC;




-- 5. Suppose you are receiving the date data from your software in “1987, Jun 01 11:20 AM” format.
-- Now you want to show only those employees
-- EMPLOYEE_ID,
-- Short name (format: 1st letter of first name in uppercase followed by last letter of first name in lowercase followed
-- by a hyphen followed by 1st letter of last name in uppercase followed by last letter of last name in lowercase),
-- EMAIL (format: abcd@gmail.com that is add ‘@gmail.com’ with every email address) left pad the email address with
-- the character <SPACE> so that total no of characters in all the email address becomes 25,
-- Total Salary (rounded upto 4 decimal points, total salary=salary*(1+commission_pct) ),
-- Total Experience (format: 10 years, 2 months and 5 days only),
-- Expected Retirement Date (format: add 35 years with the given hire date)
-- who is hired after the provided date that is “1987, Jun 01 11:20 AM”.


SELECT employee_id,
        CONCAT(
                UPPER(SUBSTR(first_name,1,1)),LOWER(SUBSTR(first_name,-1,1)),
                '-',
                UPPER(SUBSTR(last_name,1,1)),LOWER(SUBSTR(last_name,-1,1))
        ) AS 'Short name',
        LPAD(
                CONCAT(email,'@gmail.com'), 25, ' '
        ) AS 'EMAIL',

        ROUND(salary*(1+commission_pct), 4) AS 'Total Salary',

        CONCAT(
                DATEDIFF(NOW(), hire_date) DIV 365,
                ' years, ',
                (DATEDIFF(NOW(), hire_date)%365) DIV 12,
                ' months and ',
                DATEDIFF(NOW(), hire_date) % 30,
                ' days only'
        ) AS 'Total Experience',
        
	DATE_ADD(hire_date, INTERVAL (35*365) DAY) AS 'Expected Retirement Date'

FROM employees
WHERE DATE(
    STR_TO_DATE(
        '1987, Jun 01 11:20 AM',
        '%Y, %b %d %h:%i %p'
    )
 ) < hire_date;

