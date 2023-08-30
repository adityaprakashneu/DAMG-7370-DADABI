-- SCD Product Price ad Cost History
-- r sherman
-- 2022-03-04


-----  SQL Server or Azure SQL ------------------------------------------------------

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
drop TABLE  ProductCostHistorySCD
;
CREATE TABLE  ProductCostHistorySCD
(   
    SCD_SK int  not null identity(1,1),
	ProductID int NOT NULL,    -- called the durable key
	ProductName varchar(50) NOT NULL,
	StandardCost Numeric(19,4) NOT NULL,

	scd_start datetime not null,
	scd_end datetime  null,
	scd_version int not null,
	scd_active int not null,

	DI_JobID varchar(20) null,
	DI_CreateDate date default getdate() not null
PRIMARY KEY  (SCD_SK)
)
;

-----  MySQL ------------------------------------------------------

drop TABLE  ProductPriceHistorySCD
;
CREATE TABLE  ProductPriceHistorySCD
(   
    SCD_SK int  not null auto_increment,
	ProductID int NOT NULL,  
	ProductName varchar(50) NOT NULL,
	ListPrice Numeric(19,4) NOT NULL,

	scd_start datetime(3) not null,
	scd_end datetime(3)  null,
	scd_version int not null,
	scd_active int not null,

	DI_JobID varchar(20) null,
	DI_CreateDate datetime default current_timestamp not null,
PRIMARY KEY  (SCD_SK)
);

drop TABLE  ProductCostHistorySCD
;
CREATE TABLE  ProductCostHistorySCD
(   
    SCD_SK int  not null auto_increment,
	ProductID int NOT NULL,   
	ProductName varchar(50) NOT NULL,
	StandardCost Numeric(19,4) NOT NULL,

	scd_start datetime(3) not null,
	scd_end datetime(3)  null,
	scd_version int not null,
	scd_active int not null,

	DI_JobID varchar(20) null,
	DI_CreateDate datetime default current_timestamp not null,
PRIMARY KEY  (SCD_SK)
)
;