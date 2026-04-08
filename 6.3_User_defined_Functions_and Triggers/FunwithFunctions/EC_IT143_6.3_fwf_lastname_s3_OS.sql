USE EC_IT143_DA;
GO

/*
EC_IT143_6.3_fwf_lastname_s3_OS.sql
Step 3 - Create an ad hoc SQL query

This query tests the logic for extracting the last name
from the CustomerName column.
*/

SELECT
    CustomerID,
    CustomerName,
    LTRIM(SUBSTRING(CustomerName, CHARINDEX(' ', CustomerName + ' ') + 1, LEN(CustomerName))) AS last_name
FROM dbo.t_w3_schools_customers;
GO