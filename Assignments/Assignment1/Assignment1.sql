--Total Sales Using SalesOrderHeader (ties to customer)
SELECT SUM(SOH.SubTotal) AS Total_Sales_SOH_$ FROM SalesLT.SalesOrderHeader SOH;

--Total Sales Using SalesOrderDetail (ties to product)
SELECT SUM(SOD.LineTotal) AS Total_Sales_SOD_$ FROM SalesLT.SalesOrderDetail SOD;

--Comparison querying with SalesOrderHeader vs SalesOrderDetail
SELECT SUM(SOH.SubTotal) AS Total_Sales_SOH_$, (SELECT SUM(SOD.LineTotal) FROM SalesLT.SalesOrderDetail SOD) AS Total_Sales_SOD_$ FROM SalesLT.SalesOrderHeader SOH;

SELECT SUM( DISTINCT SOH.SubTotal) AS Total_Sales_SOH_$, SUM(SOD.LineTotal) AS Total_Sales_SOD_$ FROM SalesLT.SalesOrderDetail SOD 
JOIN SalesLT.SalesOrderHeader SOH ON SOD.SalesOrderID = SOH.SalesOrderID 

GROUP BY SOH.SalesOrderID;

--Total sales $ by country – ranked/sorted (highest to lowest)
SELECT SUM(SOH.SubTotal) AS Total_Sale_$, A.CountryRegion AS Country, RANK() OVER (ORDER BY SUM(SOH.SubTotal) DESC) Rank FROM SalesLT.SalesOrderHeader SOH 
JOIN SalesLT.Address A ON SOH.BillToAddressID = A.AddressID GROUP BY A.CountryRegion ORDER BY Rank;

--Total sales $ by country, state & city
SELECT SUM(SOH.SubTotal) AS Total_Sale_$, A.CountryRegion AS Country, A.StateProvince AS State, A.City FROM SalesLT.SalesOrderHeader SOH 
JOIN SalesLT.Address A ON SOH.BillToAddressID = A.AddressID GROUP BY A.CountryRegion, A.StateProvince, A.City;

--Total sales $ by customer (person) – ranked/sorted (highest to lowest)
--Using SOH
SELECT SUM(SOH.SubTotal) AS Total_Sales_$, COALESCE(C.LastName,'') + ', ' + C.FirstName  AS CustomerName, RANK() OVER (ORDER BY SUM(SOH.SubTotal) DESC) AS Rank
FROM SalesLT.SalesOrderHeader SOH 
JOIN SalesLT.Customer C ON SOH.CustomerID = C.CustomerID GROUP BY FirstName, LastName ORDER BY Rank;

--Using SOD
SELECT SUM(SOD.LineTotal) AS Total_Sales_$, COALESCE(C.LastName, '') + ', ' + C.FirstName AS CustomerName, RANK() OVER (ORDER BY SUM(SOD.LineTotal) DESC) AS Rank 
FROM SalesLT.SalesOrderDetail SOD 
JOIN SalesLT.SalesOrderHeader SOH ON SOD.SalesOrderID = SOH.SalesOrderID
JOIN SalesLT.Customer C ON C.CustomerID = SOH.CustomerID GROUP BY C.FirstName, C.LastName ORDER BY Rank;

--Total sales $ & by customer (company) – ranked/sorted (highest to lowest)
--Using SOH
SELECT SUM(SOH.SubTotal) AS Total_Sales_$, C.CompanyName, RANK() OVER (ORDER BY SUM(SOH.SubTotal) DESC) AS Rank FROM SalesLT.SalesOrderHeader SOH 
JOIN SalesLT.Customer C ON SOH.CustomerID = C.CustomerID GROUP BY C.CompanyName ORDER BY Rank;

--Using SOD
SELECT SUM(SOD.LineTotal) AS Total_Sales_$, C.CompanyName, RANK() OVER (ORDER BY SUM(SOD.LineTotal) DESC) AS Rank FROM SalesLT.SalesOrderDetail SOD
JOIN SalesLT.SalesOrderHeader SOH ON SOD.SalesOrderID = SOH.SalesOrderID
JOIN SalesLT.Customer C ON C.CustomerID = SOH.CustomerID GROUP BY C.CompanyName ORDER BY Rank;

--Sales $ by Company (Reseller)
--Using SOH
SELECT SUM(SOH.SubTotal) AS Total_Sales_$, C.CompanyName FROM SalesLT.SalesOrderHeader SOH 
JOIN SalesLT.Customer C ON SOH.CustomerID = C.CustomerID GROUP BY C.CompanyName;

--Using SOD
SELECT SUM(SOD.LineTotal) AS Total_Sales_$, C.CompanyName FROM SalesLT.SalesOrderDetail SOD
JOIN SalesLT.SalesOrderHeader SOH ON SOD.SalesOrderID = SOH.SalesOrderID
JOIN SalesLT.Customer C ON C.CustomerID = SOH.CustomerID GROUP BY C.CompanyName;

--Sales $ by product name – ranked/sorted (highest to lowest)
--Using SOH
SELECT SUM(SOH.SubTotal) AS Total_Sales_$, P.Name, RANK() OVER (ORDER BY SUM(SOH.SubTotal) DESC) AS Rank FROM SalesLT.SalesOrderHeader SOH 
JOIN SalesLT.SalesOrderDetail SOD ON SOH.SalesOrderID = SOD.SalesOrderID
JOIN SalesLT.Product P ON P.ProductID = SOD.ProductID GROUP BY P.Name ORDER BY Rank;

--Using SOD
SELECT SUM(SOD.LineTotal) AS Total_Sales_$, P.Name, RANK() OVER (ORDER BY SUM(SOD.LineTotal) DESC) AS Rank FROM SalesLT.SalesOrderDetail SOD
JOIN SalesLT.Product P ON P.ProductID = SOD.ProductID GROUP BY P.Name ORDER BY Rank;


--Sales $ by product category hierarchy – Product & vGetAllCategories
SELECT PPC.Name AS ParentProductCategory, PC.Name AS ProductCategory, P.Name AS ProductName, SUM(SOD.LineTotal) AS Total_Sales_$ FROM SalesLT.ProductCategory PC 
JOIN SalesLT.ProductCategory PPC ON PC.ProductCategoryID = PPC.ParentProductCategoryID
JOIN SalesLT.Product P ON P.ProductCategoryID = PPC.ProductCategoryID
JOIN SalesLT.SalesOrderDetail SOD ON SOD.ProductID = P.ProductID GROUP BY PPC.Name, PC.Name, P.Name ORDER BY SUM(SOD.LineTotal) DESC;

--Product Category Sales $ by Company (Reseller)
SELECT PPC.Name AS ParentProductCategory, PC.Name AS ProductCategory, C.CompanyName AS ProductName, SUM(SOD.LineTotal) AS Total_Sales_$ FROM SalesLT.ProductCategory PC 
JOIN SalesLT.ProductCategory PPC ON PC.ProductCategoryID = PPC.ParentProductCategoryID
JOIN SalesLT.Product P ON P.ProductCategoryID = PPC.ProductCategoryID
JOIN SalesLT.SalesOrderDetail SOD ON SOD.ProductID = P.ProductID 
JOIN SalesLT.SalesOrderHeader SOH ON SOH.SalesOrderID = SOD.SalesOrderID
JOIN SalesLT.Customer C ON C.CustomerID = SOH.CustomerID GROUP BY PPC.Name, PC.Name, C.CompanyName;
