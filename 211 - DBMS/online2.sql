-- 1. Show the employees FirstName, BirthDate (Format: Sunday 28th March, 2021), Phone (Format: First 8 digits of
-- phone number followed by xxx-xx followed by last 2 digits of phone number), Hire Group Name from employee
-- table. Consider only those employees whose birth year is within the range 1960 to 1970 exclusive and also consider
-- employees whose title either starts with ‘Sales’ or ‘IT’
-- Calculate Hire Group Name based on the following criteria:
-- • Hire month is within 1 to 4 inclusive – Group Q1
-- • Hire month is within 5 to 8 inclusive – Group Q2
-- • Hire month is within 9 to 12 inclusive – Group Q3


SELECT FirstName,
    DATE_FORMAT(BirthDate, '%W %D %M, %Y'),
    CONCAT(
		RPAD(LEFT(Phone, 8), LENGTH(Phone)-2, 'xxx-xx'),
		RIGHT(Phone, 2)
	) AS 'Phone',
    CASE 
        WHEN MONTH(HireDate) BETWEEN 1 AND 4 THEN 'Q1'
        WHEN MONTH(HireDate) BETWEEN 5 AND 8 THEN 'Q2'
        WHEN MONTH(HireDate) BETWEEN 9 AND 12 THEN 'Q3'
    END AS 'Hire Group Name'
FROM employee
WHERE YEAR(BirthDate) BETWEEN 1960 AND 1970 AND 
    (Title LIKE ('Sales%') OR Title LIKE ('IT%'));




-- 2. For GenreId value 7, show the 4
-- th to 6
-- th highest unitprice_per_millisecond track details from the track table.
-- Here, unitprice_per_millisecond = UnitPrice / Milliseconds



SELECT  UnitPrice / Milliseconds AS unitprice_per_millisecond
FROM track
WHERE GenreId = 7
ORDER BY unitprice_per_millisecond DESC
LIMIT 3, 3;




-- 3. Show the InvoiceId, InvoiceDate, ExpectedDeliveryDate (format: add 15 days with the InvoiceDate), BillingState
-- and Total bill (format: x dollars and y cents) of those invoice data from invoice table whose BillingState has valid
-- data (not null) and also the Total value is greater than 5 dollars. Show the output in descending order of InvoiceDate
-- year. If two invoices are on the same year then also sort them based on the decreasing order of total value.


SELECT InvoiceId, 
    InvoiceDate,
    DATE_ADD(InvoiceDate, INTERVAL 15 DAY) AS ExpectedDeliveryDate,
    BillingState,
    CONCAT(
        Total DIV 1,
        ' dollars ',
        Total % 1 * 100,
        ' cents'
    ) AS 'Total bill'
FROM invoice
WHERE BillingState IS NOT NULL AND
    Total > 5
ORDER BY YEAR(InvoiceDate) DESC, Total DESC;
    