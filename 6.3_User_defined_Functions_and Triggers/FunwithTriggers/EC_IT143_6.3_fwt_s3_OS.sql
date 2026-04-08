USE EC_IT143_DA;
GO

/*
EC_IT143_6.3_fwt_s3_OS.sql
Step 3 - Research and test a solution

Resources:
1. Microsoft Learn - CREATE TRIGGER (Transact-SQL)
2. Microsoft Learn - inserted and deleted tables
3. Microsoft Learn - GETDATE (Transact-SQL)

This script adds the audit column if it does not already exist.
*/

IF COL_LENGTH('dbo.t_w3_schools_customers', 'last_modified_date') IS NULL
BEGIN
    ALTER TABLE dbo.t_w3_schools_customers
    ADD last_modified_date DATETIME NULL;
END;
GO