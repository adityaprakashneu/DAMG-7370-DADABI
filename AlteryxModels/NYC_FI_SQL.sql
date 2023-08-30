/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      NYC_FI_DimensionalModel.DM1
 *
 * Date Created : Monday, February 13, 2023 21:13:23
 * Target DBMS : Microsoft SQL Server 2019
 */

/* 
 * TABLE: Dim_Contact 
 */

CREATE TABLE Dim_Contact(
    ContactSK    int            IDENTITY(1,1),
    Phone        char(12)       NULL,
    Email        varchar(50)    NULL,
    IsActive     char(5)        NULL,
    CONSTRAINT PK6 PRIMARY KEY NONCLUSTERED (ContactSK)
)

go


IF OBJECT_ID('Dim_Contact') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Contact >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Contact >>>'
go

/* 
 * TABLE: Dim_Date 
 */

CREATE TABLE Dim_Date(
    DateSK               int             NOT NULL,
    FullDateAK           date            NOT NULL,
    DayNumberOfWeek      int             NOT NULL,
    DayNameOfWeek        nvarchar(10)    NOT NULL,
    DayNumberOfMonth     int             NOT NULL,
    FiscalQuarter        int             NULL,
    FiscalYear           int             NULL,
    DayNumberOfYear      int             NOT NULL,
    WeekNumberOfYear     int             NOT NULL,
    MonthName            nvarchar(10)    NOT NULL,
    MonthNumberOfYear    int             NOT NULL,
    CalendarQuarter      int             NOT NULL,
    CalendarYear         smallint        NOT NULL,
    CONSTRAINT PK__Dim_Date__A4262D75D6BC5B9B PRIMARY KEY NONCLUSTERED (DateSK)
)

go


IF OBJECT_ID('Dim_Date') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Date >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Date >>>'
go

/* 
 * TABLE: Dim_Inspection 
 */

CREATE TABLE Dim_Inspection(
    InspectionSK            int              IDENTITY(1,1),
    InspectionType          varchar(59)      NULL,
    ViolationCode           char(5)          NULL,
    Action                  varchar(130)     NULL,
    ViolationDescription    nvarchar(254)    NULL,
    CrtiticalFlag           char(14)         NULL,
    Grade                   char(1)          NULL,
    Score                   tinyint          NULL,
    CONSTRAINT PK4 PRIMARY KEY NONCLUSTERED (InspectionSK)
)

go


IF OBJECT_ID('Dim_Inspection') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Inspection >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Inspection >>>'
go

/* 
 * TABLE: Dim_Location 
 */

CREATE TABLE Dim_Location(
    LocationKey      int             NOT NULL,
    BORO             varchar(13)     NULL,
    LocationPoint    bit             NULL,
    Latitude         float           NULL,
    Longitude        float           NULL,
    Building         nvarchar(10)    NULL,
    Street           varchar(40)     NULL,
    Zipcode          char(5)         NULL,
    CONSTRAINT PK5 PRIMARY KEY NONCLUSTERED (LocationKey)
)

go


IF OBJECT_ID('Dim_Location') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Location >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Location >>>'
go

/* 
 * TABLE: Dim_Restaurant 
 */

CREATE TABLE Dim_Restaurant(
    RestaurantSK    int          IDENTITY(1,1),
    CAMIS           int          NOT NULL,
    DBA             nchar(95)    NULL,
    CuisineDesc     nchar(30)    NULL,
    DBAFlag         char(10)     NOT NULL,
    ContactSK       int          NOT NULL,
    CONSTRAINT PK1 PRIMARY KEY NONCLUSTERED (RestaurantSK)
)

go


IF OBJECT_ID('Dim_Restaurant') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Restaurant >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Restaurant >>>'
go

/* 
 * TABLE: Fact_LicenseInspection 
 */

CREATE TABLE Fact_LicenseInspection(
    LocationKey       int         NOT NULL,
    InspectionDate    datetime    NULL,
    RecordDate        char(10)    NULL,
    GradeDate         datetime    NULL,
    RestaurantSK      int         NOT NULL,
    InspectionSK      int         NOT NULL,
    DateSK            int         NOT NULL
)

go


IF OBJECT_ID('Fact_LicenseInspection') IS NOT NULL
    PRINT '<<< CREATED TABLE Fact_LicenseInspection >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Fact_LicenseInspection >>>'
go

/* 
 * TABLE: Dim_Restaurant 
 */

ALTER TABLE Dim_Restaurant ADD CONSTRAINT RefDim_Contact1 
    FOREIGN KEY (ContactSK)
    REFERENCES Dim_Contact(ContactSK)
go


/* 
 * TABLE: Fact_LicenseInspection 
 */

ALTER TABLE Fact_LicenseInspection ADD CONSTRAINT RefDim_Location2 
    FOREIGN KEY (LocationKey)
    REFERENCES Dim_Location(LocationKey)
go

ALTER TABLE Fact_LicenseInspection ADD CONSTRAINT RefDim_Restaurant4 
    FOREIGN KEY (RestaurantSK)
    REFERENCES Dim_Restaurant(RestaurantSK)
go

ALTER TABLE Fact_LicenseInspection ADD CONSTRAINT RefDim_Inspection5 
    FOREIGN KEY (InspectionSK)
    REFERENCES Dim_Inspection(InspectionSK)
go

ALTER TABLE Fact_LicenseInspection ADD CONSTRAINT RefDim_Date6 
    FOREIGN KEY (DateSK)
    REFERENCES Dim_Date(DateSK)
go


