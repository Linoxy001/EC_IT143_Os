USE AdventureWorks2022;
GO

-- Query 1 BEFORE
SELECT *
FROM Person.Person
WHERE FirstName = 'John';
GO

-- Index for Query 1
CREATE NONCLUSTERED INDEX IX_Person_FirstName
ON Person.Person (FirstName);
GO

-- Query 1 AFTER
SELECT *
FROM Person.Person
WHERE FirstName = 'John';
GO

-- Query 2 BEFORE
SELECT *
FROM Production.Product
WHERE Color = 'Red';
GO

-- Covering Index for Query 2
CREATE NONCLUSTERED INDEX IX_Product_Color_Covering
ON Production.Product (Color)
INCLUDE (ProductID, Name);
GO

-- Query 2 AFTER
SELECT ProductID, Name, Color
FROM Production.Product
WHERE Color = 'Red';
GO