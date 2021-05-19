-- 1. Show the branch id, branch name, branch city of that branch(es)
-- that performed maximum total amount of transactions

SELECT b.BRANCH_ID, b.NAME, b.CITY
FROM branch AS b
    JOIN acc_transaction AS t
    ON t.EXECUTION_BRANCH_ID = b.BRANCH_ID
WHERE (t.AMOUNT) = (
    SELECT MAX(AMOUNT) as max_sal
    FROM acc_transaction
    GROUP BY EXECUTION_BRANCH_ID
);



-- 2. Find out those account details that was opened by the same 
-- employee who also opened the account id 5 and whose customer id 
-- is the same as the customer id of account number 1.

SELECT ac.*
FROM account as ac
    JOIN employee as emp
        ON emp.EMP_ID = ac.OPEN_EMP_ID
    JOIN customer as cus
        ON cus.CUST_ID = ac.CUST_ID

WHERE emp.EMP_ID = (
        SELECT emp1.EMP_ID
        FROM account as ac1
        JOIN
        employee as emp1
        ON emp1.EMP_ID = ac1.OPEN_EMP_ID
        WHERE ac1.ACCOUNT_ID = 5
    )
    AND 
    cus.CUST_ID = (
        SELECT cus1.CUST_ID
        FROM account as ac1
        JOIN
        customer as cus1
        ON cus1.CUST_ID = ac1.CUST_ID
        WHERE ac1.ACCOUNT_ID = 1
    );

