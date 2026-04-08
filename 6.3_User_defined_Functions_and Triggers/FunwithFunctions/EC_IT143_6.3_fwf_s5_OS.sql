USE EC_IT143_DA;
GO

/*
EC_IT143_6.3_fwf_s5_OS.sql
Step 5 - Create a user-defined scalar function

Function name:
dbo.fn_get_first_name

Purpose:
Return the first name portion of ContactName.
*/

CREATE OR ALTER FUNCTION dbo.fn_get_first_name
(
    @contact_name VARCHAR(100)
)
RETURNS VARCHAR(50)
AS
BEGIN
    DECLARE @first_name VARCHAR(50);

    SET @first_name =
        LEFT(@contact_name, CHARINDEX(' ', @contact_name + ' ') - 1);

    RETURN @first_name;
END;
GO