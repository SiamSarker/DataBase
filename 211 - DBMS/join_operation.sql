-- table alising
-- table join - ON function

-- show the employee first name and his job title

SELECT e.first_name, 
    j.job_title,
    d.department_id,
    l.location_id

FROM employees AS e
    JOIN 
    jobs as j
    ON e.job_id = j.job_id

    JOIN 
    departments as d
    ON e.department_id = d.department_id

    JOIN
    locations as l
    ON d.location_id = l.location_id;





-- self join

SELECT emp.first_name AS 'elmployee name', 
    man.first_name AS 'manager name',
    manofman.first_name AS 'manager manager name'

FROM employees AS emp

    JOIN employees AS man
    ON emp.manager_id = man.employee_id

    JOIN employees AS manofman
    ON man.manager_id = manofman.employee_id;



-- see the last part again