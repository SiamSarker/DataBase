/* 1. For each account, show the account id, its opening branch name and count the total number of transactions
executed from that account to other outside branches. Only consider accounts whose average transaction amount
is below 200$. */


SELECT COUNT(*),
    acc.ACCOUNT_ID,
    b.NAME
FROM account as acc
    JOIN branch as b
    ON b.BRANCH_ID = acc.OPEN_BRANCH_ID
    JOIN acc_transaction as act
    ON act.EXECUTION_BRANCH_ID = b.BRANCH_ID
GROUP BY acc.ACCOUNT_ID, b.NAME
HAVING AVG(act.AMOUNT) < 200;


/* 2. Show all the employee name and his colleague name where 
both of them works under the same superior
employee. Show the output in ascending order of employee 
name and his colleague name. */


SELECT emp.FIRST_NAME,
    col.FIRST_NAME
from employee as emp
    JOIN employee as col 
    ON col.SUPERIOR_EMP_ID = emp.SUPERIOR_EMP_ID
ORDER BY emp.FIRST_NAME ASC, col.FIRST_NAME ASC;




/* 3. For each year and each branch, show the year, execution 
branch name and calculate the total amount of
transactions. */


SELECT YEAR(act.TXN_DATE),
    b.NAME,
    SUM(act.AMOUNT)
FROM acc_transaction as act
    JOIN 
    branch AS b
    ON act.EXECUTION_BRANCH_ID = b.BRANCH_ID
GROUP BY YEAR(act.TXN_DATE), b.NAME;