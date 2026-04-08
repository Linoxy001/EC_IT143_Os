USE EC_IT143_DA;
GO

/*
EC_IT143_6.3_fwf_s7_OS.sql
Step 7 - Perform a "0 results expected" test

If the function is working correctly,
this script should return 0 rows.
*/

WITH results_cte AS
(
    SELECT
        CustomerID,
        CustomerName,
        dbo.fn_get_first_name(CustomerName) AS udf_first_name,
        LEFT(CustomerName, CHARINDEX(' ', CustomerName + ' ') - 1) AS adhoc_first_name
    FROM dbo.t_w3_schools_customers
)
SELECT *
FROM results_cte
WHERE udf_first_name <> adhoc_first_name;
GO