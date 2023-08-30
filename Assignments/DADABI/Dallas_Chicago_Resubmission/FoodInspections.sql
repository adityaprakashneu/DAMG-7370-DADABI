/*

 * ER/Studio Data Architect SQL Code Generation

 * Project :      Model1.DM1

 *

 * Date Created : Monday, March 27, 2023 03:52:26

 * Target DBMS : Microsoft SQL Server 2019

 */



/* 

 * TABLE: Dim_Address 

 */



CREATE TABLE Dim_Address(

    Address_SK                  int            IDENTITY(1,1),

    Street_Address              varchar(51)    NULL,

    City                        varchar(20)    NULL,

    State                       char(2)        NULL,

    Zipcode                     char(10)       NULL,

    Location                    varchar(100)    NULL,

    DI_CreateDate               date           NULL,

    DI_WorkFlowFileName         char(64)       NULL,

    DI_WorkFlowFileDirectory    char(64)       NULL,

    CONSTRAINT PK6 PRIMARY KEY CLUSTERED (Address_SK)

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

    Business_SK             int            IDENTITY(1,1),

    Address_SK              int            NOT NULL,

    Doing_Business_As       varchar(90)    NULL,

    Also_Known_As           varchar(90)    NULL,

    License_Number          int            NULL,

    DI_CreateDate           date           NULL,

    DI_WorkFlowFileName     char(64)       NULL,

    DI_WorkFlowFileDirectory    char(64)       NULL,

    CONSTRAINT PK3 PRIMARY KEY CLUSTERED (Business_SK)

)



go





IF OBJECT_ID('Dim_Business') IS NOT NULL

    PRINT '<<< CREATED TABLE Dim_Business >>>'

ELSE

    PRINT '<<< FAILED CREATING TABLE Dim_Business >>>'

go



/* 

 * TABLE: Dim_Date 

 */



CREATE TABLE Dim_Date(

    Date_SK       char(10)    NOT NULL,

    Date          date        NULL,

    DayName       char(10)    NULL,

    DayOfMonth    char(10)    NULL,

    Month         char(20)    NULL,

    Quarter       char(10)    NULL,

    Year          int         NULL,

    CONSTRAINT PK12 PRIMARY KEY CLUSTERED (Date_SK)

)



go





IF OBJECT_ID('Dim_Date') IS NOT NULL

    PRINT '<<< CREATED TABLE Dim_Date >>>'

ELSE

    PRINT '<<< FAILED CREATING TABLE Dim_Date >>>'

go



/* 

 * TABLE: Dim_Facility 

 */



CREATE TABLE Dim_Facility(

    Facility_SK             int            IDENTITY(1,1),

    Facility_Type           varchar(47)    NULL,

    DI_CreateDate               date           NULL,

    DI_WorkFlowFileName         char(64)       NULL,

    DI_WorkFlowFileDirectory    char(64)       NULL,

    CONSTRAINT PK4 PRIMARY KEY CLUSTERED (Facility_SK)

)



go





IF OBJECT_ID('Dim_Facility') IS NOT NULL

    PRINT '<<< CREATED TABLE Dim_Facility >>>'

ELSE

    PRINT '<<< FAILED CREATING TABLE Dim_Facility >>>'

go



/* 

 * TABLE: Dim_Geo 

 */



CREATE TABLE Dim_Geo(

    Geo_SK                  int         IDENTITY(1,1),

    Location                char(100)    NULL,

    DI_CreateDate           date        NULL,

    DI_WorkFlowFileName     char(64)    NULL,

    DI_WorkFlowFileDirectory    char(64)    NULL,

    CONSTRAINT PK5 PRIMARY KEY CLUSTERED (Geo_SK)

)



go





IF OBJECT_ID('Dim_Geo') IS NOT NULL

    PRINT '<<< CREATED TABLE Dim_Geo >>>'

ELSE

    PRINT '<<< FAILED CREATING TABLE Dim_Geo >>>'

go



/* 

 * TABLE: Dim_InspectionType 

 */



CREATE TABLE Dim_InspectionType(

    InspectionType_SK       int            IDENTITY(1,1),

    Inspection_Type         varchar(41)    NULL,

    DI_CreateDate           date           NULL,

    DI_WorkFlowFileName     char(64)       NULL,

    DI_WorkFlowFileDirectory    char(64)       NULL,

    CONSTRAINT PK7 PRIMARY KEY CLUSTERED (InspectionType_SK)

)



go





IF OBJECT_ID('Dim_InspectionType') IS NOT NULL

    PRINT '<<< CREATED TABLE Dim_InspectionType >>>'

ELSE

    PRINT '<<< FAILED CREATING TABLE Dim_InspectionType >>>'

go



/* 

 * TABLE: Dim_Result 

 */



CREATE TABLE Dim_Result(

    Result_SK               int            IDENTITY(1,1),

    Result                  varchar(30)    NULL,

    DI_CreateDate           date           NULL,

    DI_WorkFlowFileName     char(64)       NULL,

    DI_WorkFlowFileDirectory    char(64)       NULL,

    CONSTRAINT PK9 PRIMARY KEY CLUSTERED (Result_SK)

)



go





IF OBJECT_ID('Dim_Result') IS NOT NULL

    PRINT '<<< CREATED TABLE Dim_Result >>>'

ELSE

    PRINT '<<< FAILED CREATING TABLE Dim_Result >>>'

go



/* 

 * TABLE: Dim_Risk 

 */



CREATE TABLE Dim_Risk(

    Risk_SK                 int         IDENTITY(1,1),

    Risk                    char(15)    NULL,

    DI_CreateDate           date        NULL,

    DI_WorkFlowFileName     char(64)    NULL,

    DI_WorkFlowFileDirectory    char(64)    NULL,

    CONSTRAINT PK8 PRIMARY KEY CLUSTERED (Risk_SK)

)



go





IF OBJECT_ID('Dim_Risk') IS NOT NULL

    PRINT '<<< CREATED TABLE Dim_Risk >>>'

ELSE

    PRINT '<<< FAILED CREATING TABLE Dim_Risk >>>'

go



/* 

 * TABLE: Dim_Violation 

 */



CREATE TABLE Dim_Violation(

    Violation_SK             int             IDENTITY(1,1),

    Violation_Code           int             NULL,

    Violation_Description    varchar(254)    NULL,

    DI_CreateDate            date            NULL,

    DI_WorkFlowFileName      char(64)        NULL,

    DI_WorkFlowDirectory     char(64)        NULL,

    CONSTRAINT PK10 PRIMARY KEY CLUSTERED (Violation_SK)

)



go





IF OBJECT_ID('Dim_Violation') IS NOT NULL

    PRINT '<<< CREATED TABLE Dim_Violation >>>'

ELSE

    PRINT '<<< FAILED CREATING TABLE Dim_Violation >>>'

go



/* 

 * TABLE: FCT_FoodInspections 

 */



CREATE TABLE FCT_FoodInspections(

    Inspection_SK           int         IDENTITY(1,1),

    InspectionDateSK        char(10)    NOT NULL,

    Business_SK             int         NOT NULL,

    Facility_SK             int         NOT NULL,

    Geo_SK                  int         NOT NULL,

    InspectionType_SK       int         NOT NULL,

    Risk_SK                 int         NOT NULL,

    Result_SK               int         NOT NULL,

    InspectionID            int         NULL,

    NumberOfViolations      int         NULL,

    InspectionScore         int         NULL,

    DI_CreateDate           date        NULL,

    DI_WorkFlowFileName     char(64)    NULL,

    DI_WorkFlowDirectory    char(64)    NULL,

    CONSTRAINT PK1 PRIMARY KEY CLUSTERED (Inspection_SK)

)



go





IF OBJECT_ID('FCT_FoodInspections') IS NOT NULL

    PRINT '<<< CREATED TABLE FCT_FoodInspections >>>'

ELSE

    PRINT '<<< FAILED CREATING TABLE FCT_FoodInspections >>>'

go



/* 

 * TABLE: FCT_InspectionViolation 

 */



CREATE TABLE FCT_InspectionViolation(

    InspectionViolations_SK    int             IDENTITY(1,1),

    Violation_SK               int             NOT NULL,

    Inspection_SK              int             NOT NULL,

    Comments                   varchar(max)    NULL,

    DI_CreateDate              date            NULL,

    DI_WorkFlowFileName        char(64)        NULL,

    DI_WorkFlowDirectory       char(64)        NULL,

    CONSTRAINT PK2 PRIMARY KEY CLUSTERED (InspectionViolations_SK)

)



go





IF OBJECT_ID('FCT_InspectionViolation') IS NOT NULL

    PRINT '<<< CREATED TABLE FCT_InspectionViolation >>>'

ELSE

    PRINT '<<< FAILED CREATING TABLE FCT_InspectionViolation >>>'

go



/* 

 * INDEX: Ref61 

 */



CREATE INDEX Ref61 ON Dim_Business(Address_SK)

go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('Dim_Business') AND name='Ref61')

    PRINT '<<< CREATED INDEX Dim_Business.Ref61 >>>'

ELSE

    PRINT '<<< FAILED CREATING INDEX Dim_Business.Ref61 >>>'

go



/* 

 * INDEX: Ref32 

 */



CREATE INDEX Ref32 ON FCT_FoodInspections(Business_SK)

go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('FCT_FoodInspections') AND name='Ref32')

    PRINT '<<< CREATED INDEX FCT_FoodInspections.Ref32 >>>'

ELSE

    PRINT '<<< FAILED CREATING INDEX FCT_FoodInspections.Ref32 >>>'

go



/* 

 * INDEX: Ref43 

 */



CREATE INDEX Ref43 ON FCT_FoodInspections(Facility_SK)

go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('FCT_FoodInspections') AND name='Ref43')

    PRINT '<<< CREATED INDEX FCT_FoodInspections.Ref43 >>>'

ELSE

    PRINT '<<< FAILED CREATING INDEX FCT_FoodInspections.Ref43 >>>'

go



/* 

 * INDEX: Ref54 

 */



CREATE INDEX Ref54 ON FCT_FoodInspections(Geo_SK)

go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('FCT_FoodInspections') AND name='Ref54')

    PRINT '<<< CREATED INDEX FCT_FoodInspections.Ref54 >>>'

ELSE

    PRINT '<<< FAILED CREATING INDEX FCT_FoodInspections.Ref54 >>>'

go



/* 

 * INDEX: Ref75 

 */



CREATE INDEX Ref75 ON FCT_FoodInspections(InspectionType_SK)

go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('FCT_FoodInspections') AND name='Ref75')

    PRINT '<<< CREATED INDEX FCT_FoodInspections.Ref75 >>>'

ELSE

    PRINT '<<< FAILED CREATING INDEX FCT_FoodInspections.Ref75 >>>'

go



/* 

 * INDEX: Ref86 

 */



CREATE INDEX Ref86 ON FCT_FoodInspections(Risk_SK)

go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('FCT_FoodInspections') AND name='Ref86')

    PRINT '<<< CREATED INDEX FCT_FoodInspections.Ref86 >>>'

ELSE

    PRINT '<<< FAILED CREATING INDEX FCT_FoodInspections.Ref86 >>>'

go



/* 

 * INDEX: Ref98 

 */



CREATE INDEX Ref98 ON FCT_FoodInspections(Result_SK)

go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('FCT_FoodInspections') AND name='Ref98')

    PRINT '<<< CREATED INDEX FCT_FoodInspections.Ref98 >>>'

ELSE

    PRINT '<<< FAILED CREATING INDEX FCT_FoodInspections.Ref98 >>>'

go



/* 

 * INDEX: Ref1211 

 */



CREATE INDEX Ref1211 ON FCT_FoodInspections(InspectionDateSK)

go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('FCT_FoodInspections') AND name='Ref1211')

    PRINT '<<< CREATED INDEX FCT_FoodInspections.Ref1211 >>>'

ELSE

    PRINT '<<< FAILED CREATING INDEX FCT_FoodInspections.Ref1211 >>>'

go



/* 

 * INDEX: Ref107 

 */



CREATE INDEX Ref107 ON FCT_InspectionViolation(Violation_SK)

go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('FCT_InspectionViolation') AND name='Ref107')

    PRINT '<<< CREATED INDEX FCT_InspectionViolation.Ref107 >>>'

ELSE

    PRINT '<<< FAILED CREATING INDEX FCT_InspectionViolation.Ref107 >>>'

go



/* 

 * INDEX: Ref19 

 */



CREATE INDEX Ref19 ON FCT_InspectionViolation(Inspection_SK)

go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('FCT_InspectionViolation') AND name='Ref19')

    PRINT '<<< CREATED INDEX FCT_InspectionViolation.Ref19 >>>'

ELSE

    PRINT '<<< FAILED CREATING INDEX FCT_InspectionViolation.Ref19 >>>'

go



/* 

 * TABLE: Dim_Business 

 */



ALTER TABLE Dim_Business ADD CONSTRAINT RefDim_Address1 

    FOREIGN KEY (Address_SK)

    REFERENCES Dim_Address(Address_SK)

go





/* 

 * TABLE: FCT_FoodInspections 

 */



ALTER TABLE FCT_FoodInspections ADD CONSTRAINT RefDim_Business2 

    FOREIGN KEY (Business_SK)

    REFERENCES Dim_Business(Business_SK)

go



ALTER TABLE FCT_FoodInspections ADD CONSTRAINT RefDim_Facility3 

    FOREIGN KEY (Facility_SK)

    REFERENCES Dim_Facility(Facility_SK)

go



ALTER TABLE FCT_FoodInspections ADD CONSTRAINT RefDim_Geo4 

    FOREIGN KEY (Geo_SK)

    REFERENCES Dim_Geo(Geo_SK)

go



ALTER TABLE FCT_FoodInspections ADD CONSTRAINT RefDim_InspectionType5 

    FOREIGN KEY (InspectionType_SK)

    REFERENCES Dim_InspectionType(InspectionType_SK)

go



ALTER TABLE FCT_FoodInspections ADD CONSTRAINT RefDim_Risk6 

    FOREIGN KEY (Risk_SK)

    REFERENCES Dim_Risk(Risk_SK)

go



ALTER TABLE FCT_FoodInspections ADD CONSTRAINT RefDim_Result8 

    FOREIGN KEY (Result_SK)

    REFERENCES Dim_Result(Result_SK)

go



ALTER TABLE FCT_FoodInspections ADD CONSTRAINT RefDim_Date11 

    FOREIGN KEY (InspectionDateSK)

    REFERENCES Dim_Date(Date_SK)

go





/* 

 * TABLE: FCT_InspectionViolation 

 */



ALTER TABLE FCT_InspectionViolation ADD CONSTRAINT RefDim_Violation7 

    FOREIGN KEY (Violation_SK)

    REFERENCES Dim_Violation(Violation_SK)

go



ALTER TABLE FCT_InspectionViolation ADD CONSTRAINT RefFCT_FoodInspections9 

    FOREIGN KEY (Inspection_SK)

    REFERENCES FCT_FoodInspections(Inspection_SK)

go





