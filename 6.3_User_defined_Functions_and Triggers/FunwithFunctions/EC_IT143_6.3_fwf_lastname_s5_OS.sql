USE EC_IT143_DA;
GO

/*
EC_IT143_6.3_fwf_lastname_s5_OS.sql
Step 5 - Create a user-defined scalar function

Function name:
dbo.fn_get_last_name

Purpose:
Return the last name portion of CustomerName.
*/

CREATE OR ALTER FUNCTION dbo.fn_get_last_name
(
    @customer_name VARCHAR(100)
)
RETURNS VARCHAR(50)
AS
BEGIN
    DECLARE @last_name VARCHAR(50);

    SET @last_name =
        LTRIM(SUBSTRING(@customer_name, CHARINDEX(' ', @customer_name + ' ') + 1, LEN(@customer_name)));

    RETURN @last_name;
END;
GO