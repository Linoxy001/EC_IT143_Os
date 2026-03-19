/******************************************************************************
File:        EC_IT143_W3.4_OS.sql
Author:      Olumuyiwa Sobowale
Class:       IT 143
Assignment:  W3.4 Adventure Works—Create Answers
Database:    AdventureWorks2022
Created:     2026-03-19

Description:
This script answers 8 user questions using AdventureWorks database.
Questions were selected from classmates and categorized as:
- Marginal (2)
- Moderate (2)
- Increased (2)
- Metadata (2)

******************************************************************************/

USE AdventureWorks2022;
GO

SET NOCOUNT ON;
GO

/*===========================================================
Q1 - Marginal Complexity
Author: Blessing Elileojo Omage
Question: Which product sold the most?
===========================================================*/
SELECT TOP 1
    p.Name,
    SUM(sod.OrderQty) AS TotalSold
FROM Sales.SalesOrderDetail sod
JOIN Production.Product p
    ON sod.ProductID = p.ProductID
GROUP BY p.Name
ORDER BY TotalSold DESC;
GO


/*===========================================================
Q2 - Marginal Complexity
Author: Victor Chinyere Iwuoha
Question: What are the top five most expensive products by list price?
===========================================================*/
SELECT TOP 5
    Name,
    ListPrice
FROM Production.Product
ORDER BY ListPrice DESC;
GO


/*===========================================================
Q3 - Moderate Complexity
Author: Christopher Jerome
Question: Which product categories generated the highest total sales revenue?
===========================================================*/
SELECT
    pc.Name AS Category,
    SUM(sod.LineTotal) AS TotalRevenue
FROM Sales.SalesOrderDetail sod
JOIN Production.Product p
    ON sod.ProductID = p.ProductID
JOIN Production.ProductSubcategory ps
    ON p.ProductSubcategoryID = ps.ProductSubcategoryID
JOIN Production.ProductCategory pc
    ON ps.ProductCategoryID = pc.ProductCategoryID
GROUP BY pc.Name
ORDER BY TotalRevenue DESC;
GO


/*===========================================================
Q4 - Moderate Complexity
Author: Shadi Maria Jamjam
Question: What is the average order quantity for each product subcategory in 2014?
===========================================================*/
SELECT
    ps.Name AS Subcategory,
    AVG(sod.OrderQty) AS AvgOrderQty
FROM Sales.SalesOrderDetail sod
JOIN Sales.SalesOrderHeader soh
    ON sod.SalesOrderID = soh.SalesOrderID
JOIN Production.Product p
    ON sod.ProductID = p.ProductID
JOIN Production.ProductSubcategory ps
    ON p.ProductSubcategoryID = ps.ProductSubcategoryID
WHERE YEAR(soh.OrderDate) = 2014
GROUP BY ps.Name
ORDER BY AvgOrderQty DESC;
GO


/*===========================================================
Q5 - Increased Complexity
Author: Victor Chinyere Iwuoha
Question: Monthly sales totals for road bikes in 2013
===========================================================*/
SELECT
    DATENAME(MONTH, soh.OrderDate) AS Month,
    SUM(sod.OrderQty) AS QuantitySold,
    SUM(sod.LineTotal) AS Revenue,
    AVG(sod.UnitPrice) AS AvgPrice
FROM Sales.SalesOrderDetail sod
JOIN Sales.SalesOrderHeader soh
    ON sod.SalesOrderID = soh.SalesOrderID
JOIN Production.Product p
    ON sod.ProductID = p.ProductID
JOIN Production.ProductSubcategory ps
    ON p.ProductSubcategoryID = ps.ProductSubcategoryID
WHERE YEAR(soh.OrderDate) = 2013
  AND ps.Name LIKE '%Road%'
GROUP BY DATENAME(MONTH, soh.OrderDate), MONTH(soh.OrderDate)
ORDER BY MONTH(soh.OrderDate);
GO


/*===========================================================
Q6 - Increased Complexity
Author: Davidson Charles
Question: Top 10 regions ranked by total purchase amount
===========================================================*/
SELECT TOP 10
    st.Name AS Region,
    COUNT(soh.SalesOrderID) AS TotalOrders,
    SUM(soh.TotalDue) AS TotalRevenue
FROM Sales.SalesOrderHeader soh
JOIN Sales.SalesTerritory st
    ON soh.TerritoryID = st.TerritoryID
GROUP BY st.Name
ORDER BY TotalRevenue DESC;
GO


/*===========================================================
Q7 - Metadata Question
Author: Edgar Estrada
Question: Which tables contain a column named CustomerID?
===========================================================*/
SELECT
    TABLE_SCHEMA,
    TABLE_NAME,
    COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE COLUMN_NAME = 'CustomerID'
ORDER BY TABLE_NAME;
GO


/*===========================================================
Q8 - Metadata Question
Author: Blessing Elileojo Omage
Question: How many tables are in AdventureWorks?
===========================================================*/
SELECT COUNT(*) AS TotalTables
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';
GO
