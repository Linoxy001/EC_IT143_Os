USE EC_IT143_DA;
GO

/*
EC_IT143_6.3_fwf_s6_OS.sql
Step 6 - Compare UDF results to ad hoc query results

This script shows the scalar function result
next to the ad hoc query result.
*/

SELECT
    CustomerID,
    CustomerName,
    dbo.fn_get_first_name(CustomerName) AS udf_first_name,
    LEFT(CustomerName, CHARINDEX(' ', CustomerName + ' ') - 1) AS adhoc_first_name
FROM dbo.t_w3_schools_customers;
GO