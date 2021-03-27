Command 1:

SELECT employee_id,
        DATEDIFF(end_date, start_date) AS experience
FROM job_history
ORDER BY experience DESC
LIMIT 3, 1;


Command 2:

SELECT first_name,
        salary+salary*commission_pct AS 'gross salary'
FROM employees
ORDER BY 'gross salary' ASC 
LIMIT 5;



Command 3:

SELECT *
FROM locations
WHERE (street_address LIKE '%Rd%' OR street_address LIKE '%St%') AND
    (country_id = 'IT' OR country_id = 'JP' OR country_id = 'US') AND
    postal_code BETWEEN 1000 AND 20000; 



Command 4:

SELECT first_name, email, manager_id
FROM employees
ORDER BY manager_id ASC, hire_date DESC;



Command 5:


SELECT employee_id,
        CONCAT(
                UPPER(LEFT(first_name,1)),LOWER(RIGHT(first_name,1)),
                '-',
                UPPER(LEFT(last_name,1)),LOWER(RIGHT(last_name,1))
        ) AS 'Short name',
        LPAD(
                CONCAT(email,'@gmail.com'), 25, ' '
        ) AS 'EMAIL',

        ROUND(salary*(1+commission_pct), 4) AS 'Total Salary',

        CONCAT(
                DATEDIFF(CURDATE(), hire_date) DIV 365,
                ' years, ',
                (DATEDIFF(CURDATE(), hire_date)%365) DIV 12,
                ' months and ',
                DATEDIFF(CURDATE(), hire_date) % 30,
                ' days only'
        ) AS 'Total Experience',
        
	DATE_ADD(hire_date, INTERVAL (35*365) DAY) AS 'Expected Retirement Date'

FROM employees
WHERE hire_date > DATE(
    STR_TO_DATE(
        '1987, Jun 01 11:20 AM',
        '%Y, %b %d %h:%i %p'
    )
 );
