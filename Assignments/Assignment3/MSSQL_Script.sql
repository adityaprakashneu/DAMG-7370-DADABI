/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      ReverseEngg_MySQL.DM1
 *
 * Date Created : Monday, January 30, 2023 00:35:27
 * Target DBMS : Microsoft SQL Server 2019
 */

/* 
 * TABLE: album 
 */

CREATE TABLE album(
    AlbumId     int             IDENTITY(1,1),
    Title       varchar(160)    NOT NULL,
    ArtistId    int             NOT NULL,
    CONSTRAINT PRIMARY PRIMARY KEY NONCLUSTERED (AlbumId)
)

go


IF OBJECT_ID('album') IS NOT NULL
    PRINT '<<< CREATED TABLE album >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE album >>>'
go

/* 
 * TABLE: artist 
 */

CREATE TABLE artist(
    ArtistId    int             IDENTITY(1,1),
    Name        varchar(120)    NULL,
    CONSTRAINT PRIMARY PRIMARY KEY NONCLUSTERED (ArtistId)
)

go


IF OBJECT_ID('artist') IS NOT NULL
    PRINT '<<< CREATED TABLE artist >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE artist >>>'
go

/* 
 * TABLE: customer 
 */

CREATE TABLE customer(
    CustomerId      int            IDENTITY(1,1),
    FirstName       varchar(40)    NOT NULL,
    LastName        varchar(20)    NOT NULL,
    Company         varchar(80)    NULL,
    Address         varchar(70)    NULL,
    City            varchar(40)    NULL,
    State           varchar(40)    NULL,
    Country         varchar(40)    NULL,
    PostalCode      varchar(10)    NULL,
    Phone           varchar(24)    NULL,
    Fax             varchar(24)    NULL,
    Email           varchar(60)    NOT NULL,
    SupportRepId    int            NULL,
    CONSTRAINT PRIMARY PRIMARY KEY NONCLUSTERED (CustomerId)
)

go


IF OBJECT_ID('customer') IS NOT NULL
    PRINT '<<< CREATED TABLE customer >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE customer >>>'
go

/* 
 * TABLE: employee 
 */

CREATE TABLE employee(
    EmployeeId    int            IDENTITY(1,1),
    LastName      varchar(20)    NOT NULL,
    FirstName     varchar(20)    NOT NULL,
    Title         varchar(30)    NULL,
    ReportsTo     int            NULL,
    BirthDate     datetime       NULL,
    HireDate      datetime       NULL,
    Address       varchar(70)    NULL,
    City          varchar(40)    NULL,
    State         varchar(40)    NULL,
    Country       varchar(40)    NULL,
    PostalCode    varchar(10)    NULL,
    Phone         varchar(24)    NULL,
    Fax           varchar(24)    NULL,
    Email         varchar(60)    NULL,
    CONSTRAINT PRIMARY PRIMARY KEY NONCLUSTERED (EmployeeId)
)

go


IF OBJECT_ID('employee') IS NOT NULL
    PRINT '<<< CREATED TABLE employee >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE employee >>>'
go

/* 
 * TABLE: genre 
 */

CREATE TABLE genre(
    GenreId    int             IDENTITY(1,1),
    Name       varchar(120)    NULL,
    CONSTRAINT PRIMARY PRIMARY KEY NONCLUSTERED (GenreId)
)

go


IF OBJECT_ID('genre') IS NOT NULL
    PRINT '<<< CREATED TABLE genre >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE genre >>>'
go

/* 
 * TABLE: invoice 
 */

CREATE TABLE invoice(
    InvoiceId            int               IDENTITY(1,1),
    CustomerId           int               NOT NULL,
    InvoiceDate          datetime          NOT NULL,
    BillingAddress       varchar(70)       NULL,
    BillingCity          varchar(40)       NULL,
    BillingState         varchar(40)       NULL,
    BillingCountry       varchar(40)       NULL,
    BillingPostalCode    varchar(10)       NULL,
    Total                decimal(10, 2)    NOT NULL,
    CONSTRAINT PRIMARY PRIMARY KEY NONCLUSTERED (InvoiceId)
)

go


IF OBJECT_ID('invoice') IS NOT NULL
    PRINT '<<< CREATED TABLE invoice >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE invoice >>>'
go

/* 
 * TABLE: invoiceline 
 */

CREATE TABLE invoiceline(
    InvoiceLineId    int               IDENTITY(1,1),
    InvoiceId        int               NOT NULL,
    TrackId          int               NOT NULL,
    UnitPrice        decimal(10, 2)    NOT NULL,
    Quantity         int               NOT NULL,
    CONSTRAINT PRIMARY PRIMARY KEY NONCLUSTERED (InvoiceLineId)
)

go


IF OBJECT_ID('invoiceline') IS NOT NULL
    PRINT '<<< CREATED TABLE invoiceline >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE invoiceline >>>'
go

/* 
 * TABLE: mediatype 
 */

CREATE TABLE mediatype(
    MediaTypeId    int             IDENTITY(1,1),
    Name           varchar(120)    NULL,
    CONSTRAINT PRIMARY PRIMARY KEY NONCLUSTERED (MediaTypeId)
)

go


IF OBJECT_ID('mediatype') IS NOT NULL
    PRINT '<<< CREATED TABLE mediatype >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE mediatype >>>'
go

/* 
 * TABLE: playlist 
 */

CREATE TABLE playlist(
    PlaylistId    int             IDENTITY(1,1),
    Name          varchar(120)    NULL,
    CONSTRAINT PRIMARY PRIMARY KEY NONCLUSTERED (PlaylistId)
)

go


IF OBJECT_ID('playlist') IS NOT NULL
    PRINT '<<< CREATED TABLE playlist >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE playlist >>>'
go

/* 
 * TABLE: playlisttrack 
 */

CREATE TABLE playlisttrack(
    PlaylistId    int    NOT NULL,
    TrackId       int    NOT NULL,
    CONSTRAINT PRIMARY PRIMARY KEY NONCLUSTERED (PlaylistId, TrackId)
)

go


IF OBJECT_ID('playlisttrack') IS NOT NULL
    PRINT '<<< CREATED TABLE playlisttrack >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE playlisttrack >>>'
go

/* 
 * TABLE: track 
 */

CREATE TABLE track(
    TrackId         int               IDENTITY(1,1),
    Name            varchar(200)      NOT NULL,
    AlbumId         int               NULL,
    MediaTypeId     int               NOT NULL,
    GenreId         int               NULL,
    Composer        varchar(220)      NULL,
    Milliseconds    int               NOT NULL,
    Bytes           int               NULL,
    UnitPrice       decimal(10, 2)    NOT NULL,
    CONSTRAINT PRIMARY PRIMARY KEY NONCLUSTERED (TrackId)
)

go


IF OBJECT_ID('track') IS NOT NULL
    PRINT '<<< CREATED TABLE track >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE track >>>'
go

/* 
 * TABLE: album 
 */

ALTER TABLE album ADD CONSTRAINT FK_AlbumArtistId 
    FOREIGN KEY (ArtistId)
    REFERENCES artist(ArtistId)
go


/* 
 * TABLE: customer 
 */

ALTER TABLE customer ADD CONSTRAINT FK_CustomerSupportRepId 
    FOREIGN KEY (SupportRepId)
    REFERENCES employee(EmployeeId)
go


/* 
 * TABLE: employee 
 */

ALTER TABLE employee ADD CONSTRAINT FK_EmployeeReportsTo 
    FOREIGN KEY (ReportsTo)
    REFERENCES employee(EmployeeId)
go


/* 
 * TABLE: invoice 
 */

ALTER TABLE invoice ADD CONSTRAINT FK_InvoiceCustomerId 
    FOREIGN KEY (CustomerId)
    REFERENCES customer(CustomerId)
go


/* 
 * TABLE: invoiceline 
 */

ALTER TABLE invoiceline ADD CONSTRAINT FK_InvoiceLineInvoiceId 
    FOREIGN KEY (InvoiceId)
    REFERENCES invoice(InvoiceId)
go

ALTER TABLE invoiceline ADD CONSTRAINT FK_InvoiceLineTrackId 
    FOREIGN KEY (TrackId)
    REFERENCES track(TrackId)
go


/* 
 * TABLE: playlisttrack 
 */

ALTER TABLE playlisttrack ADD CONSTRAINT FK_PlaylistTrackPlaylistId 
    FOREIGN KEY (PlaylistId)
    REFERENCES playlist(PlaylistId)
go

ALTER TABLE playlisttrack ADD CONSTRAINT FK_PlaylistTrackTrackId 
    FOREIGN KEY (TrackId)
    REFERENCES track(TrackId)
go


/* 
 * TABLE: track 
 */

ALTER TABLE track ADD CONSTRAINT FK_TrackAlbumId 
    FOREIGN KEY (AlbumId)
    REFERENCES album(AlbumId)
go

ALTER TABLE track ADD CONSTRAINT FK_TrackGenreId 
    FOREIGN KEY (GenreId)
    REFERENCES genre(GenreId)
go

ALTER TABLE track ADD CONSTRAINT FK_TrackMediaTypeId 
    FOREIGN KEY (MediaTypeId)
    REFERENCES mediatype(MediaTypeId)
go


