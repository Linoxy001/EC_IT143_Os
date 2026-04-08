USE EC_IT143_DA;
GO

/*
EC_IT143_6.3_fwf_s4_OS.sql
Step 4 - Research and test a solution

Resources:
1. Microsoft Learn - CREATE FUNCTION (Transact-SQL)
2. Microsoft Learn - CHARINDEX (Transact-SQL)
3. Microsoft Learn - LEFT (Transact-SQL)

This script retests the ad hoc solution after research.
*/

SELECT
    CustomerID,
    CustomerName,
    LEFT(CustomerName, CHARINDEX(' ', CustomerName + ' ') - 1) AS first_name
FROM dbo.t_w3_schools_customers;
GO