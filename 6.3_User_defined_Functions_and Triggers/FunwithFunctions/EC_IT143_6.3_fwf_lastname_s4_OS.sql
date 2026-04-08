USE EC_IT143_DA;
GO

/*
EC_IT143_6.3_fwf_lastname_s4_OS.sql
Step 4 - Research and test a solution

Resources:
1. Microsoft Learn - CREATE FUNCTION (Transact-SQL)
2. Microsoft Learn - SUBSTRING (Transact-SQL)
3. Microsoft Learn - LTRIM (Transact-SQL)

This script retests the ad hoc solution after research.
*/

SELECT
    CustomerID,
    CustomerName,
    LTRIM(SUBSTRING(CustomerName, CHARINDEX(' ', CustomerName + ' ') + 1, LEN(CustomerName))) AS last_name
FROM dbo.t_w3_schools_customers;
GO