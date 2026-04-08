USE EC_IT143_DA;
GO

/*
EC_IT143_6.3_fwf_lastname_s6_OS.sql
Step 6 - Compare UDF results to ad hoc query results
*/

SELECT
    CustomerID,
    CustomerName,
    dbo.fn_get_last_name(CustomerName) AS udf_last_name,
    LTRIM(SUBSTRING(CustomerName, CHARINDEX(' ', CustomerName + ' ') + 1, LEN(CustomerName))) AS adhoc_last_name
FROM dbo.t_w3_schools_customers;
GO