USE EC_IT143_DA;
GO

/*
EC_IT143_6.3_fwt_s4_OS.sql
Step 4 - Create an after-update trigger

Trigger name:
dbo.trg_update_last_modified_date

Purpose:
Automatically set last_modified_date whenever a row is updated.
*/

CREATE OR ALTER TRIGGER dbo.trg_update_last_modified_date
ON dbo.t_w3_schools_customers
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE c
    SET c.last_modified_date = GETDATE()
    FROM dbo.t_w3_schools_customers c
    INNER JOIN inserted i
        ON c.CustomerID = i.CustomerID;
END;
GO