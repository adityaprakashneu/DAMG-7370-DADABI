--
-- ER/Studio Data Architect SQL Code Generation
-- Project :      ReverseEngg_MySQL.DM1
--
-- Date Created : Monday, January 30, 2023 14:04:27
-- Target DBMS : PostgreSQL 10.x-12.x
--

-- 
-- TABLE: album 
--

CREATE TABLE album(
    "AlbumId"   integer         GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    "Title"     varchar(160)    NOT NULL,
    "ArtistId"  integer         NOT NULL,
    CONSTRAINT PRIMARY PRIMARY KEY ("AlbumId")
)
;



-- 
-- TABLE: artist 
--

CREATE TABLE artist(
    "ArtistId"  integer         GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    "Name"      varchar(120),
    CONSTRAINT PRIMARY PRIMARY KEY ("ArtistId")
)
;



-- 
-- TABLE: customer 
--

CREATE TABLE customer(
    "CustomerId"    integer        GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    "FirstName"     varchar(40)    NOT NULL,
    "LastName"      varchar(20)    NOT NULL,
    "Company"       varchar(80),
    "Address"       varchar(70),
    "City"          varchar(40),
    "State"         varchar(40),
    "Country"       varchar(40),
    "PostalCode"    varchar(10),
    "Phone"         varchar(24),
    "Fax"           varchar(24),
    "Email"         varchar(60)    NOT NULL,
    "SupportRepId"  integer,
    CONSTRAINT PRIMARY PRIMARY KEY ("CustomerId")
)
;



-- 
-- TABLE: employee 
--

CREATE TABLE employee(
    "EmployeeId"  integer                      GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    "LastName"    varchar(20)                  NOT NULL,
    "FirstName"   varchar(20)                  NOT NULL,
    "Title"       varchar(30),
    "ReportsTo"   integer,
    "BirthDate"   time without time zone(6),
    "HireDate"    time without time zone(6),
    "Address"     varchar(70),
    "City"        varchar(40),
    "State"       varchar(40),
    "Country"     varchar(40),
    "PostalCode"  varchar(10),
    "Phone"       varchar(24),
    "Fax"         varchar(24),
    "Email"       varchar(60),
    CONSTRAINT PRIMARY PRIMARY KEY ("EmployeeId")
)
;



-- 
-- TABLE: genre 
--

CREATE TABLE genre(
    "GenreId"  integer         GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    "Name"     varchar(120),
    CONSTRAINT PRIMARY PRIMARY KEY ("GenreId")
)
;



-- 
-- TABLE: invoice 
--

CREATE TABLE invoice(
    "InvoiceId"          integer                      GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    "CustomerId"         integer                      NOT NULL,
    "InvoiceDate"        time without time zone(6)    NOT NULL,
    "BillingAddress"     varchar(70),
    "BillingCity"        varchar(40),
    "BillingState"       varchar(40),
    "BillingCountry"     varchar(40),
    "BillingPostalCode"  varchar(10),
    "Total"              decimal(10, 2)               NOT NULL,
    CONSTRAINT PRIMARY PRIMARY KEY ("InvoiceId")
)
;



-- 
-- TABLE: invoiceline 
--

CREATE TABLE invoiceline(
    "InvoiceLineId"  integer           GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    "InvoiceId"      integer           NOT NULL,
    "TrackId"        integer           NOT NULL,
    "UnitPrice"      decimal(10, 2)    NOT NULL,
    "Quantity"       integer           NOT NULL,
    CONSTRAINT PRIMARY PRIMARY KEY ("InvoiceLineId")
)
;



-- 
-- TABLE: mediatype 
--

CREATE TABLE mediatype(
    "MediaTypeId"  integer         GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    "Name"         varchar(120),
    CONSTRAINT PRIMARY PRIMARY KEY ("MediaTypeId")
)
;



-- 
-- TABLE: playlist 
--

CREATE TABLE playlist(
    "PlaylistId"  integer         GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    "Name"        varchar(120),
    CONSTRAINT PRIMARY PRIMARY KEY ("PlaylistId")
)
;



-- 
-- TABLE: playlisttrack 
--

CREATE TABLE playlisttrack(
    "PlaylistId"  integer    NOT NULL,
    "TrackId"     integer    NOT NULL,
    CONSTRAINT PRIMARY PRIMARY KEY ("PlaylistId", "TrackId")
)
;



-- 
-- TABLE: track 
--

CREATE TABLE track(
    "TrackId"       integer           GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    "Name"          varchar(200)      NOT NULL,
    "AlbumId"       integer,
    "MediaTypeId"   integer           NOT NULL,
    "GenreId"       integer,
    "Composer"      varchar(220),
    "Milliseconds"  integer           NOT NULL,
    "Bytes"         integer,
    "UnitPrice"     decimal(10, 2)    NOT NULL,
    CONSTRAINT PRIMARY PRIMARY KEY ("TrackId")
)
;



-- 
-- TABLE: album 
--

ALTER TABLE album ADD CONSTRAINT FK_AlbumArtistId 
    FOREIGN KEY ("ArtistId")
    REFERENCES artist("ArtistId")
;


-- 
-- TABLE: customer 
--

ALTER TABLE customer ADD CONSTRAINT FK_CustomerSupportRepId 
    FOREIGN KEY ("SupportRepId")
    REFERENCES employee("EmployeeId")
;


-- 
-- TABLE: employee 
--

ALTER TABLE employee ADD CONSTRAINT FK_EmployeeReportsTo 
    FOREIGN KEY ("ReportsTo")
    REFERENCES employee("EmployeeId")
;


-- 
-- TABLE: invoice 
--

ALTER TABLE invoice ADD CONSTRAINT FK_InvoiceCustomerId 
    FOREIGN KEY ("CustomerId")
    REFERENCES customer("CustomerId")
;


-- 
-- TABLE: invoiceline 
--

ALTER TABLE invoiceline ADD CONSTRAINT FK_InvoiceLineInvoiceId 
    FOREIGN KEY ("InvoiceId")
    REFERENCES invoice("InvoiceId")
;

ALTER TABLE invoiceline ADD CONSTRAINT FK_InvoiceLineTrackId 
    FOREIGN KEY ("TrackId")
    REFERENCES track("TrackId")
;


-- 
-- TABLE: playlisttrack 
--

ALTER TABLE playlisttrack ADD CONSTRAINT FK_PlaylistTrackPlaylistId 
    FOREIGN KEY ("PlaylistId")
    REFERENCES playlist("PlaylistId")
;

ALTER TABLE playlisttrack ADD CONSTRAINT FK_PlaylistTrackTrackId 
    FOREIGN KEY ("TrackId")
    REFERENCES track("TrackId")
;


-- 
-- TABLE: track 
--

ALTER TABLE track ADD CONSTRAINT FK_TrackAlbumId 
    FOREIGN KEY ("AlbumId")
    REFERENCES album("AlbumId")
;

ALTER TABLE track ADD CONSTRAINT FK_TrackGenreId 
    FOREIGN KEY ("GenreId")
    REFERENCES genre("GenreId")
;

ALTER TABLE track ADD CONSTRAINT FK_TrackMediaTypeId 
    FOREIGN KEY ("MediaTypeId")
    REFERENCES mediatype("MediaTypeId")
;


