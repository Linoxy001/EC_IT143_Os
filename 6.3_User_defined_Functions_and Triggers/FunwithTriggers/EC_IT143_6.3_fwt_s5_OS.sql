USE EC_IT143_DA;
GO

/*
EC_IT143_6.3_fwt_s5_OS.sql
Step 5 - Test results to see if they are as expected

This script updates one row and checks whether
last_modified_date was populated.
*/

UPDATE dbo.t_w3_schools_customers
SET Country = Country
WHERE CustomerID = 1;
GO

SELECT
    CustomerID,
    CustomerName,
    Country,
    last_modified_date
FROM dbo.t_w3_schools_customers
WHERE CustomerID = 1;
GO