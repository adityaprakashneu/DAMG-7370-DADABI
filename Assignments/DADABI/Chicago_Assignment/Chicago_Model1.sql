/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      Chicago_DimensionalModel.DM1
 *
 * Date Created : Sunday, February 26, 2023 23:05:33
 * Target DBMS : Microsoft SQL Server 2019
 */

/* 
 * TABLE: Dim_Address 
 */

CREATE TABLE Dim_Address(
    Address_SK    int            NOT NULL,
    Address       varchar(51)    NULL,
    City          varchar(20)    NULL,
    State         char(2)        NULL,
    Zip           int            NULL,
    Latitude      char(18)       NULL,
    Longitude     char(18)       NULL,
    Location      char(40)       NULL,
    CONSTRAINT PK5 PRIMARY KEY CLUSTERED (Address_SK)
)

go


IF OBJECT_ID('Dim_Address') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Address >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Address >>>'
go

/* 
 * TABLE: Dim_Business 
 */

CREATE TABLE Dim_Business(
    Business_SK                 int             NOT NULL,
    [SITE NUMBER]               smallint        NULL,
    [DOING BUSINESS AS NAME]    varchar(128)    NULL,
    DI_CreateDate               datetime        NULL,
    DI_WorkFlowFileName         char(64)        NULL,
    DI_WorkFlowFileDIrectory    char(64)        NULL,
    CONSTRAINT PK13 PRIMARY KEY CLUSTERED (Business_SK)
)

go


IF OBJECT_ID('Dim_Business') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Business >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Business >>>'
go

/* 
 * TABLE: Dim_Business_Activity 
 */

CREATE TABLE Dim_Business_Activity(
    Business_Activity_SK        int             NOT NULL,
    [BUSINESS ACTIVITY ID]      varchar(81)     NULL,
    [BUSINESS ACTIVITY]         varchar(254)    NULL,
    DI_CreateDate               datetime        NULL,
    DI_WorkFlowFileName         char(64)        NULL,
    DI_WorkFlowFileDirectory    char(64)        NULL,
    CONSTRAINT PK15 PRIMARY KEY CLUSTERED (Business_Activity_SK)
)

go


IF OBJECT_ID('Dim_Business_Activity') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Business_Activity >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Business_Activity >>>'
go

/* 
 * TABLE: Dim_Business_Application 
 */

CREATE TABLE Dim_Business_Application(
    Business_Application_SK              int         NOT NULL,
    [APPLICATION TYPE]                   char(6)     NULL,
    [APPLICATION REQUIREMENTS COMPLETE]  char(10)    NULL,
    [CONDITIONAL APPROVAL]               char(1)     NULL,
    DI_CreateDate                        datetime    NULL,
    DI_WorkFlowFileName                  char(64)    NULL,
    DI_WorkFlowFileDirectory             char(64)    NULL,
    CONSTRAINT PK16 PRIMARY KEY CLUSTERED (Business_Application_SK)
)

go


IF OBJECT_ID('Dim_Business_Application') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Business_Application >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Business_Application >>>'
go

/* 
 * TABLE: Dim_Facility 
 */

CREATE TABLE Dim_Facility(
    Facility_SK                 int            NOT NULL,
    [Facility Type]             varchar(47)    NULL,
    DI_CreateDate               datetime       NULL,
    DI_WorkFlowFileName         char(64)       NULL,
    DI_WorkFlowFileDIrectory    char(64)       NULL,
    CONSTRAINT PK2 PRIMARY KEY CLUSTERED (Facility_SK)
)

go


IF OBJECT_ID('Dim_Facility') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Facility >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Facility >>>'
go

/* 
 * TABLE: Dim_FoodPlaces 
 */

CREATE TABLE Dim_FoodPlaces(
    FoodPlaces_SK               int            NOT NULL,
    [DBA Name]                  varchar(79)    NULL,
    [AKA Name]                  varchar(79)    NULL,
    DI_CreateDate               datetime       NULL,
    DI_WorkFlowFileName         char(64)       NULL,
    DI_WorkFlowFileDIrectory    char(64)       NULL,
    CONSTRAINT PK1 PRIMARY KEY CLUSTERED (FoodPlaces_SK)
)

go


IF OBJECT_ID('Dim_FoodPlaces') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_FoodPlaces >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_FoodPlaces >>>'
go

/* 
 * TABLE: Dim_Inspection_Results 
 */

CREATE TABLE Dim_Inspection_Results(
    Results_SK                  int            NOT NULL,
    Results                     varchar(20)    NULL,
    DI_CreateDate               datetime       NULL,
    DI_WorkFlowFileName         char(64)       NULL,
    DI_WorkFlowFileDirectory    char(64)       NULL,
    CONSTRAINT PK8 PRIMARY KEY CLUSTERED (Results_SK)
)

go


IF OBJECT_ID('Dim_Inspection_Results') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Inspection_Results >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Inspection_Results >>>'
go

/* 
 * TABLE: Dim_Inspection_Type 
 */

CREATE TABLE Dim_Inspection_Type(
    Inspection_Type_SK          int            NOT NULL,
    Inspection_Type             varchar(41)    NULL,
    DI_CreateDate               datetime       NULL,
    DI_WorkFlowFileName         char(64)       NULL,
    DI_WorkFlowFileDirectory    char(64)       NULL,
    CONSTRAINT PK7 PRIMARY KEY CLUSTERED (Inspection_Type_SK)
)

go


IF OBJECT_ID('Dim_Inspection_Type') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Inspection_Type >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Inspection_Type >>>'
go

/* 
 * TABLE: Dim_License 
 */

CREATE TABLE Dim_License(
    License_SK                  int         NOT NULL,
    License_Number              int         NULL,
    DI_CreateDate               datetime    NULL,
    DI_WorkFlowFileName         char(64)    NULL,
    DI_WorkFlowFileDirectory    char(64)    NULL,
    CONSTRAINT PK3 PRIMARY KEY CLUSTERED (License_SK)
)

go


IF OBJECT_ID('Dim_License') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_License >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_License >>>'
go

/* 
 * TABLE: Dim_License_Details 
 */

CREATE TABLE Dim_License_Details(
    License_Details_SK          int            NOT NULL,
    [LICENSE CODE]              smallint       NULL,
    [LICENSE DESCRIPTION]       varchar(60)    NULL,
    DI_CreateDate               datetime       NULL,
    DI_WorkFlowFileName         char(64)       NULL,
    DI_WorkFlowFileDirectory    char(64)       NULL,
    CONSTRAINT PK14 PRIMARY KEY CLUSTERED (License_Details_SK)
)

go


IF OBJECT_ID('Dim_License_Details') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_License_Details >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_License_Details >>>'
go

/* 
 * TABLE: Dim_License_Status 
 */

CREATE TABLE Dim_License_Status(
    License_Status_SK           int         NOT NULL,
    [LICENSE STATUS]            char(3)     NULL,
    DI_CreateDate               datetime    NULL,
    DI_WorkFlowFileName         char(64)    NULL,
    DI_WorkFlowFileDirectory    char(64)    NULL,
    CONSTRAINT PK17 PRIMARY KEY CLUSTERED (License_Status_SK)
)

go


IF OBJECT_ID('Dim_License_Status') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_License_Status >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_License_Status >>>'
go

/* 
 * TABLE: Dim_Location 
 */

CREATE TABLE Dim_Location(
    Location_SK                 int         NOT NULL,
    Latitude                    char(18)    NULL,
    Longitude                   char(18)    NULL,
    Location                    char(40)    NULL,
    DI_CreateDate               datetime    NULL,
    DI_WorkFlowFileName         char(64)    NULL,
    DI_WorkFlowFileDirectory    char(64)    NULL,
    CONSTRAINT PK4 PRIMARY KEY CLUSTERED (Location_SK)
)

go


IF OBJECT_ID('Dim_Location') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Location >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Location >>>'
go

/* 
 * TABLE: Dim_Owner 
 */

CREATE TABLE Dim_Owner(
    Owner_SK                    int             NOT NULL,
    [ACCOUNT NUMBER]            int             NULL,
    [LEGAL NAME]                varchar(117)    NULL,
    DI_CreateDate               datetime        NULL,
    DI_WorkFlowFileName         char(64)        NULL,
    DI_WorkFlowFileDIrectory    char(64)        NULL,
    CONSTRAINT PK12 PRIMARY KEY CLUSTERED (Owner_SK)
)

go


IF OBJECT_ID('Dim_Owner') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Owner >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Owner >>>'
go

/* 
 * TABLE: Dim_Risk 
 */

CREATE TABLE Dim_Risk(
    Risk_SK                     int         NOT NULL,
    Risk_Level                  char(15)    NULL,
    Risk_Description            char(15)    NULL,
    DI_CreateDate               datetime    NULL,
    DI_WorkFlowFileName         char(64)    NULL,
    DI_WorkFlowFileDirectory    char(64)    NULL,
    CONSTRAINT PK9 PRIMARY KEY CLUSTERED (Risk_SK)
)

go


IF OBJECT_ID('Dim_Risk') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Risk >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Risk >>>'
go

/* 
 * TABLE: Dim_Violation_Codes 
 */

CREATE TABLE Dim_Violation_Codes(
    Violation_Code_SK           int             NOT NULL,
    Violation_Code              int             NULL,
    Violation_Description       varchar(254)    NULL,
    DI_CreateDate               datetime        NULL,
    DI_WorkFlowFileName         char(64)        NULL,
    DI_WorkFlowFileDirectory    char(64)        NULL,
    CONSTRAINT PK6 PRIMARY KEY CLUSTERED (Violation_Code_SK)
)

go


IF OBJECT_ID('Dim_Violation_Codes') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Violation_Codes >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Violation_Codes >>>'
go

/* 
 * TABLE: Dim_Ward 
 */

CREATE TABLE Dim_Ward(
    Ward_SK                     int         NOT NULL,
    WARD                        tinyint     NULL,
    PRECINCT                    smallint    NULL,
    [WARD PRECINCT]             char(6)     NULL,
    SSA                         tinyint     NULL,
    [POLICE DISTRICT]           tinyint     NULL,
    DI_CreateDate               datetime    NULL,
    DI_WorkFlowFileName         char(64)    NULL,
    DI_WorkFlowFileDirectory    char(64)    NULL,
    CONSTRAINT PK18 PRIMARY KEY CLUSTERED (Ward_SK)
)

go


IF OBJECT_ID('Dim_Ward') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Ward >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Ward >>>'
go

/* 
 * TABLE: FCT_CHI_BUSINESS 
 */

CREATE TABLE FCT_CHI_BUSINESS(
    [LICENSE ID]                     int         NULL,
    Business_Application_SK          int         NOT NULL,
    Date_Issued                      datetime    NULL,
    License_Term_Start_Date          datetime    NULL,
    License_Term_Expiration_Date     datetime    NULL,
    [LICENSE APPROVED FOR ISSUANCE]  datetime    NULL,
    License_Status_Change_Date       datetime    NULL,
    Application_Created_Date         datetime    NULL,
    Payment_Date                     datetime    NULL,
    DI_CreateDate                    datetime    NULL,
    DI_WorkFlowFileName              char(64)    NULL,
    DI_WorkFlowFileDirectory         char(64)    NULL,
    Owner_SK                         int         NOT NULL,
    Ward_SK                          int         NOT NULL,
    License_Status_SK                int         NOT NULL,
    License_Details_SK               int         NOT NULL,
    Business_SK                      int         NOT NULL,
    Business_Activity_SK             int         NOT NULL,
    License_SK                       int         NOT NULL,
    Address_SK                       int         NOT NULL
)

go


IF OBJECT_ID('FCT_CHI_BUSINESS') IS NOT NULL
    PRINT '<<< CREATED TABLE FCT_CHI_BUSINESS >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE FCT_CHI_BUSINESS >>>'
go

/* 
 * TABLE: FCT_CHI_Food_Inspections 
 */

CREATE TABLE FCT_CHI_Food_Inspections(
    Inspection_SK               int         NOT NULL,
    Inspection_ID               int         NOT NULL,
    Inspection_Date             datetime    NOT NULL,
    Inspection_Date_SK          char(10)    NOT NULL,
    Address_SK                  int         NOT NULL,
    Location_SK                 int         NOT NULL,
    License_SK                  int         NOT NULL,
    Facility_SK                 int         NOT NULL,
    DI_CreateDate               datetime    NULL,
    DI_WorkFlowFileName         char(64)    NULL,
    DI_WorkFlowFileDirectory    char(64)    NULL,
    FoodPlaces_SK               int         NOT NULL,
    CONSTRAINT PK10 PRIMARY KEY CLUSTERED (Inspection_SK)
)

go


IF OBJECT_ID('FCT_CHI_Food_Inspections') IS NOT NULL
    PRINT '<<< CREATED TABLE FCT_CHI_Food_Inspections >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE FCT_CHI_Food_Inspections >>>'
go

/* 
 * TABLE: FCT_CHI_Inspection_Violations 
 */

CREATE TABLE FCT_CHI_Inspection_Violations(
    Inspection_Violation_SK     int         NOT NULL,
    Inspection_SK               int         NOT NULL,
    Violation_Code_SK           int         NOT NULL,
    Inspection_Type_SK          int         NOT NULL,
    Results_SK                  int         NOT NULL,
    Risk_SK                     int         NOT NULL,
    DI_CreateDate               datetime    NULL,
    DI_WorkFlowFileName         char(64)    NULL,
    DI_WorkFlowFileDirectory    char(64)    NULL,
    CONSTRAINT PK11 PRIMARY KEY CLUSTERED (Inspection_Violation_SK)
)

go


IF OBJECT_ID('FCT_CHI_Inspection_Violations') IS NOT NULL
    PRINT '<<< CREATED TABLE FCT_CHI_Inspection_Violations >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE FCT_CHI_Inspection_Violations >>>'
go

/* 
 * INDEX: Ref1216 
 */

CREATE INDEX Ref1216 ON FCT_CHI_BUSINESS(Owner_SK)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('FCT_CHI_BUSINESS') AND name='Ref1216')
    PRINT '<<< CREATED INDEX FCT_CHI_BUSINESS.Ref1216 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX FCT_CHI_BUSINESS.Ref1216 >>>'
go

/* 
 * INDEX: Ref1318 
 */

CREATE INDEX Ref1318 ON FCT_CHI_BUSINESS(Business_SK)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('FCT_CHI_BUSINESS') AND name='Ref1318')
    PRINT '<<< CREATED INDEX FCT_CHI_BUSINESS.Ref1318 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX FCT_CHI_BUSINESS.Ref1318 >>>'
go

/* 
 * INDEX: Ref1419 
 */

CREATE INDEX Ref1419 ON FCT_CHI_BUSINESS(License_Details_SK)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('FCT_CHI_BUSINESS') AND name='Ref1419')
    PRINT '<<< CREATED INDEX FCT_CHI_BUSINESS.Ref1419 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX FCT_CHI_BUSINESS.Ref1419 >>>'
go

/* 
 * INDEX: Ref1820 
 */

CREATE INDEX Ref1820 ON FCT_CHI_BUSINESS(Ward_SK)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('FCT_CHI_BUSINESS') AND name='Ref1820')
    PRINT '<<< CREATED INDEX FCT_CHI_BUSINESS.Ref1820 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX FCT_CHI_BUSINESS.Ref1820 >>>'
go

/* 
 * INDEX: Ref1722 
 */

CREATE INDEX Ref1722 ON FCT_CHI_BUSINESS(License_Status_SK)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('FCT_CHI_BUSINESS') AND name='Ref1722')
    PRINT '<<< CREATED INDEX FCT_CHI_BUSINESS.Ref1722 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX FCT_CHI_BUSINESS.Ref1722 >>>'
go

/* 
 * INDEX: Ref1626 
 */

CREATE INDEX Ref1626 ON FCT_CHI_BUSINESS(Business_Application_SK)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('FCT_CHI_BUSINESS') AND name='Ref1626')
    PRINT '<<< CREATED INDEX FCT_CHI_BUSINESS.Ref1626 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX FCT_CHI_BUSINESS.Ref1626 >>>'
go

/* 
 * INDEX: Ref1527 
 */

CREATE INDEX Ref1527 ON FCT_CHI_BUSINESS(Business_Activity_SK)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('FCT_CHI_BUSINESS') AND name='Ref1527')
    PRINT '<<< CREATED INDEX FCT_CHI_BUSINESS.Ref1527 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX FCT_CHI_BUSINESS.Ref1527 >>>'
go

/* 
 * INDEX: Ref328 
 */

CREATE INDEX Ref328 ON FCT_CHI_BUSINESS(License_SK)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('FCT_CHI_BUSINESS') AND name='Ref328')
    PRINT '<<< CREATED INDEX FCT_CHI_BUSINESS.Ref328 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX FCT_CHI_BUSINESS.Ref328 >>>'
go

/* 
 * INDEX: Ref529 
 */

CREATE INDEX Ref529 ON FCT_CHI_BUSINESS(Address_SK)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('FCT_CHI_BUSINESS') AND name='Ref529')
    PRINT '<<< CREATED INDEX FCT_CHI_BUSINESS.Ref529 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX FCT_CHI_BUSINESS.Ref529 >>>'
go

/* 
 * INDEX: Ref13 
 */

CREATE INDEX Ref13 ON FCT_CHI_Food_Inspections(FoodPlaces_SK)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('FCT_CHI_Food_Inspections') AND name='Ref13')
    PRINT '<<< CREATED INDEX FCT_CHI_Food_Inspections.Ref13 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX FCT_CHI_Food_Inspections.Ref13 >>>'
go

/* 
 * INDEX: Ref24 
 */

CREATE INDEX Ref24 ON FCT_CHI_Food_Inspections(Facility_SK)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('FCT_CHI_Food_Inspections') AND name='Ref24')
    PRINT '<<< CREATED INDEX FCT_CHI_Food_Inspections.Ref24 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX FCT_CHI_Food_Inspections.Ref24 >>>'
go

/* 
 * INDEX: Ref35 
 */

CREATE INDEX Ref35 ON FCT_CHI_Food_Inspections(License_SK)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('FCT_CHI_Food_Inspections') AND name='Ref35')
    PRINT '<<< CREATED INDEX FCT_CHI_Food_Inspections.Ref35 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX FCT_CHI_Food_Inspections.Ref35 >>>'
go

/* 
 * INDEX: Ref46 
 */

CREATE INDEX Ref46 ON FCT_CHI_Food_Inspections(Location_SK)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('FCT_CHI_Food_Inspections') AND name='Ref46')
    PRINT '<<< CREATED INDEX FCT_CHI_Food_Inspections.Ref46 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX FCT_CHI_Food_Inspections.Ref46 >>>'
go

/* 
 * INDEX: Ref57 
 */

CREATE INDEX Ref57 ON FCT_CHI_Food_Inspections(Address_SK)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('FCT_CHI_Food_Inspections') AND name='Ref57')
    PRINT '<<< CREATED INDEX FCT_CHI_Food_Inspections.Ref57 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX FCT_CHI_Food_Inspections.Ref57 >>>'
go

/* 
 * INDEX: Ref108 
 */

CREATE INDEX Ref108 ON FCT_CHI_Inspection_Violations(Inspection_SK)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('FCT_CHI_Inspection_Violations') AND name='Ref108')
    PRINT '<<< CREATED INDEX FCT_CHI_Inspection_Violations.Ref108 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX FCT_CHI_Inspection_Violations.Ref108 >>>'
go

/* 
 * INDEX: Ref69 
 */

CREATE INDEX Ref69 ON FCT_CHI_Inspection_Violations(Violation_Code_SK)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('FCT_CHI_Inspection_Violations') AND name='Ref69')
    PRINT '<<< CREATED INDEX FCT_CHI_Inspection_Violations.Ref69 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX FCT_CHI_Inspection_Violations.Ref69 >>>'
go

/* 
 * INDEX: Ref710 
 */

CREATE INDEX Ref710 ON FCT_CHI_Inspection_Violations(Inspection_Type_SK)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('FCT_CHI_Inspection_Violations') AND name='Ref710')
    PRINT '<<< CREATED INDEX FCT_CHI_Inspection_Violations.Ref710 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX FCT_CHI_Inspection_Violations.Ref710 >>>'
go

/* 
 * INDEX: Ref811 
 */

CREATE INDEX Ref811 ON FCT_CHI_Inspection_Violations(Results_SK)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('FCT_CHI_Inspection_Violations') AND name='Ref811')
    PRINT '<<< CREATED INDEX FCT_CHI_Inspection_Violations.Ref811 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX FCT_CHI_Inspection_Violations.Ref811 >>>'
go

/* 
 * INDEX: Ref912 
 */

CREATE INDEX Ref912 ON FCT_CHI_Inspection_Violations(Risk_SK)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('FCT_CHI_Inspection_Violations') AND name='Ref912')
    PRINT '<<< CREATED INDEX FCT_CHI_Inspection_Violations.Ref912 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX FCT_CHI_Inspection_Violations.Ref912 >>>'
go

/* 
 * TABLE: FCT_CHI_BUSINESS 
 */

ALTER TABLE FCT_CHI_BUSINESS ADD CONSTRAINT RefDim_Owner16 
    FOREIGN KEY (Owner_SK)
    REFERENCES Dim_Owner(Owner_SK)
go

ALTER TABLE FCT_CHI_BUSINESS ADD CONSTRAINT RefDim_Business18 
    FOREIGN KEY (Business_SK)
    REFERENCES Dim_Business(Business_SK)
go

ALTER TABLE FCT_CHI_BUSINESS ADD CONSTRAINT RefDim_License_Details19 
    FOREIGN KEY (License_Details_SK)
    REFERENCES Dim_License_Details(License_Details_SK)
go

ALTER TABLE FCT_CHI_BUSINESS ADD CONSTRAINT RefDim_Ward20 
    FOREIGN KEY (Ward_SK)
    REFERENCES Dim_Ward(Ward_SK)
go

ALTER TABLE FCT_CHI_BUSINESS ADD CONSTRAINT RefDim_License_Status22 
    FOREIGN KEY (License_Status_SK)
    REFERENCES Dim_License_Status(License_Status_SK)
go

ALTER TABLE FCT_CHI_BUSINESS ADD CONSTRAINT RefDim_Business_Application26 
    FOREIGN KEY (Business_Application_SK)
    REFERENCES Dim_Business_Application(Business_Application_SK)
go

ALTER TABLE FCT_CHI_BUSINESS ADD CONSTRAINT RefDim_Business_Activity27 
    FOREIGN KEY (Business_Activity_SK)
    REFERENCES Dim_Business_Activity(Business_Activity_SK)
go

ALTER TABLE FCT_CHI_BUSINESS ADD CONSTRAINT RefDim_License28 
    FOREIGN KEY (License_SK)
    REFERENCES Dim_License(License_SK)
go

ALTER TABLE FCT_CHI_BUSINESS ADD CONSTRAINT RefDim_Address29 
    FOREIGN KEY (Address_SK)
    REFERENCES Dim_Address(Address_SK)
go


/* 
 * TABLE: FCT_CHI_Food_Inspections 
 */

ALTER TABLE FCT_CHI_Food_Inspections ADD CONSTRAINT RefDim_FoodPlaces3 
    FOREIGN KEY (FoodPlaces_SK)
    REFERENCES Dim_FoodPlaces(FoodPlaces_SK)
go

ALTER TABLE FCT_CHI_Food_Inspections ADD CONSTRAINT RefDim_Facility4 
    FOREIGN KEY (Facility_SK)
    REFERENCES Dim_Facility(Facility_SK)
go

ALTER TABLE FCT_CHI_Food_Inspections ADD CONSTRAINT RefDim_License5 
    FOREIGN KEY (License_SK)
    REFERENCES Dim_License(License_SK)
go

ALTER TABLE FCT_CHI_Food_Inspections ADD CONSTRAINT RefDim_Location6 
    FOREIGN KEY (Location_SK)
    REFERENCES Dim_Location(Location_SK)
go

ALTER TABLE FCT_CHI_Food_Inspections ADD CONSTRAINT RefDim_Address7 
    FOREIGN KEY (Address_SK)
    REFERENCES Dim_Address(Address_SK)
go


/* 
 * TABLE: FCT_CHI_Inspection_Violations 
 */

ALTER TABLE FCT_CHI_Inspection_Violations ADD CONSTRAINT RefFCT_CHI_Food_Inspections8 
    FOREIGN KEY (Inspection_SK)
    REFERENCES FCT_CHI_Food_Inspections(Inspection_SK)
go

ALTER TABLE FCT_CHI_Inspection_Violations ADD CONSTRAINT RefDim_Violation_Codes9 
    FOREIGN KEY (Violation_Code_SK)
    REFERENCES Dim_Violation_Codes(Violation_Code_SK)
go

ALTER TABLE FCT_CHI_Inspection_Violations ADD CONSTRAINT RefDim_Inspection_Type10 
    FOREIGN KEY (Inspection_Type_SK)
    REFERENCES Dim_Inspection_Type(Inspection_Type_SK)
go

ALTER TABLE FCT_CHI_Inspection_Violations ADD CONSTRAINT RefDim_Inspection_Results11 
    FOREIGN KEY (Results_SK)
    REFERENCES Dim_Inspection_Results(Results_SK)
go

ALTER TABLE FCT_CHI_Inspection_Violations ADD CONSTRAINT RefDim_Risk12 
    FOREIGN KEY (Risk_SK)
    REFERENCES Dim_Risk(Risk_SK)
go


