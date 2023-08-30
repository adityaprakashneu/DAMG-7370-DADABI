--Answer the following questions (using SQL & Power BI)

--a. How many rows in target table?
SELECT COUNT(*) AS Total_Number_Of_Records 
FROM [dbo].[ProductPriceHistorySCD]

SELECT * FROM [dbo].[ProductPriceHistorySCD]

--b. How many unique products are being tracked?
SELECT COUNT(DISTINCT([ProductName])) AS UniqueProducts 
FROM [dbo].[ProductPriceHistorySCD]

--c. How many products have more than 1 price?
SELECT COUNT(DISTINCT lp.[ProductName]) AS Products_Having_More_Than_1_ListPrice FROM 
	(SELECT [ProductName] FROM [dbo].[ProductPriceHistorySCD] 
		GROUP BY [ProductName] 
		HAVING COUNT([ListPrice])>1) as lp;

--d. What is the list of current product prices? (list product, price, start date of that price and what price version)
SELECT ph.[ProductID], ph.[ListPrice], ph.[scd_start], ph.[scd_version], ph.[scd_active]
FROM [dbo].[ProductPriceHistorySCD] ph
WHERE ph.[scd_active] = 1

--e. What is the product(s) with the maximum price? (list product, price, start date of that price and what price version)
SELECT ph.[ProductID], ph.[ProductName], ph.[ListPrice], ph.[scd_start], ph.[scd_version], ph.[scd_active]
FROM [dbo].[ProductPriceHistorySCD] ph
WHERE ph.[scd_active] = 1 AND 
		ph.[ListPrice] = (SELECT MAX (pph.[ListPrice]) FROM [dbo].[ProductPriceHistorySCD] pph)

--f. What is the product(s) with the minimum price? (list product, price, start date of that price and what price version)
SELECT ph.[ProductID], ph.[ListPrice], ph.[scd_start], ph.[scd_version], ph.[scd_active]
FROM [dbo].[ProductPriceHistorySCD] ph
WHERE ph.[scd_active] = 1 AND
		ph.[ListPrice] = (SELECT MIN(pph.[ListPrice]) FROM [dbo].[ProductPriceHistorySCD] pph)

--g. What is the price history for “HL Road Frame - Red, 62”?
SELECT ph.[ProductID], ph.[ProductName], ph.[ListPrice], 
		ph.[scd_start], ph.[scd_version], ph.[scd_active]
FROM [dbo].[ProductPriceHistorySCD] ph
WHERE ph.[ProductName] = 'HL Road Frame - Red, 62'

--h. How many products had a price change in 2020?
SELECT COUNT(DISTINCT pc.[ProductID]) AS Price_Change_In_2020 
FROM (SELECT pr.[ProductID], pr.[ProductName], pr.[ListPrice], 
		pr.[scd_start], pr.[scd_version], pr.[scd_active]
			FROM [dbo].[ProductPriceHistorySCD] pr
WHERE YEAR(scd_end) = 2020) as pc

----------------------------------------------------------------------------------




drop TABLE  ProductPriceHistorySCD
;
CREATE TABLE  ProductPriceHistorySCD
(   
    SCD_SK int  not null identity(1,1),
	ProductID int NOT NULL,    -- called the durable key
	ProductName varchar(50) NOT NULL,
	ListPrice Numeric(19,4) NOT NULL,

	scd_start datetime not null,
	scd_end datetime  null,
	scd_version int not null,
	scd_active int not null,

	DI_JobID varchar(20) null,
	DI_CreateDate date default getdate() not null

PRIMARY KEY  (SCD_SK)
)
;