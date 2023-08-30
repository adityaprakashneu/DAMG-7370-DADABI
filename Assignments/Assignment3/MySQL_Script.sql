--
-- ER/Studio Data Architect SQL Code Generation
-- Project :      ReverseEngg_MySQL.DM1
--
-- Date Created : Monday, January 30, 2023 14:05:13
-- Target DBMS : MySQL 8.x
--

-- 
-- TABLE: album 
--

CREATE TABLE album(
    AlbumId     INT             AUTO_INCREMENT,
    Title       VARCHAR(160)    NOT NULL,
    ArtistId    INT             NOT NULL,
    PRIMARY KEY (AlbumId)
)ENGINE=INNODB
;



-- 
-- TABLE: artist 
--

CREATE TABLE artist(
    ArtistId    INT             AUTO_INCREMENT,
    Name        VARCHAR(120),
    PRIMARY KEY (ArtistId)
)ENGINE=INNODB
;



-- 
-- TABLE: customer 
--

CREATE TABLE customer(
    CustomerId      INT            AUTO_INCREMENT,
    FirstName       VARCHAR(40)    NOT NULL,
    LastName        VARCHAR(20)    NOT NULL,
    Company         VARCHAR(80),
    Address         VARCHAR(70),
    City            VARCHAR(40),
    State           VARCHAR(40),
    Country         VARCHAR(40),
    PostalCode      VARCHAR(10),
    Phone           VARCHAR(24),
    Fax             VARCHAR(24),
    Email           VARCHAR(60)    NOT NULL,
    SupportRepId    INT,
    PRIMARY KEY (CustomerId)
)ENGINE=INNODB
;



-- 
-- TABLE: employee 
--

CREATE TABLE employee(
    EmployeeId    INT            AUTO_INCREMENT,
    LastName      VARCHAR(20)    NOT NULL,
    FirstName     VARCHAR(20)    NOT NULL,
    Title         VARCHAR(30),
    ReportsTo     INT,
    BirthDate     DATETIME,
    HireDate      DATETIME,
    Address       VARCHAR(70),
    City          VARCHAR(40),
    State         VARCHAR(40),
    Country       VARCHAR(40),
    PostalCode    VARCHAR(10),
    Phone         VARCHAR(24),
    Fax           VARCHAR(24),
    Email         VARCHAR(60),
    PRIMARY KEY (EmployeeId)
)ENGINE=INNODB
;



-- 
-- TABLE: genre 
--

CREATE TABLE genre(
    GenreId    INT             AUTO_INCREMENT,
    Name       VARCHAR(120),
    PRIMARY KEY (GenreId)
)ENGINE=INNODB
;



-- 
-- TABLE: invoice 
--

CREATE TABLE invoice(
    InvoiceId            INT               AUTO_INCREMENT,
    CustomerId           INT               NOT NULL,
    InvoiceDate          DATETIME          NOT NULL,
    BillingAddress       VARCHAR(70),
    BillingCity          VARCHAR(40),
    BillingState         VARCHAR(40),
    BillingCountry       VARCHAR(40),
    BillingPostalCode    VARCHAR(10),
    Total                DECIMAL(10, 2)    NOT NULL,
    PRIMARY KEY (InvoiceId)
)ENGINE=INNODB
;



-- 
-- TABLE: invoiceline 
--

CREATE TABLE invoiceline(
    InvoiceLineId    INT               AUTO_INCREMENT,
    InvoiceId        INT               NOT NULL,
    TrackId          INT               NOT NULL,
    UnitPrice        DECIMAL(10, 2)    NOT NULL,
    Quantity         INT               NOT NULL,
    PRIMARY KEY (InvoiceLineId)
)ENGINE=INNODB
;



-- 
-- TABLE: mediatype 
--

CREATE TABLE mediatype(
    MediaTypeId    INT             AUTO_INCREMENT,
    Name           VARCHAR(120),
    PRIMARY KEY (MediaTypeId)
)ENGINE=INNODB
;



-- 
-- TABLE: playlist 
--

CREATE TABLE playlist(
    PlaylistId    INT             AUTO_INCREMENT,
    Name          VARCHAR(120),
    PRIMARY KEY (PlaylistId)
)ENGINE=INNODB
;



-- 
-- TABLE: playlisttrack 
--

CREATE TABLE playlisttrack(
    PlaylistId    INT    NOT NULL,
    TrackId       INT    NOT NULL,
    PRIMARY KEY (PlaylistId, TrackId)
)ENGINE=INNODB
;



-- 
-- TABLE: track 
--

CREATE TABLE track(
    TrackId         INT               AUTO_INCREMENT,
    Name            VARCHAR(200)      NOT NULL,
    AlbumId         INT,
    MediaTypeId     INT               NOT NULL,
    GenreId         INT,
    Composer        VARCHAR(220),
    Milliseconds    INT               NOT NULL,
    Bytes           INT,
    UnitPrice       DECIMAL(10, 2)    NOT NULL,
    PRIMARY KEY (TrackId)
)ENGINE=INNODB
;



-- 
-- INDEX: IFK_AlbumArtistId 
--

CREATE INDEX IFK_AlbumArtistId ON album(ArtistId)
;
-- 
-- INDEX: IFK_CustomerSupportRepId 
--

CREATE INDEX IFK_CustomerSupportRepId ON customer(SupportRepId)
;
-- 
-- INDEX: IFK_EmployeeReportsTo 
--

CREATE INDEX IFK_EmployeeReportsTo ON employee(ReportsTo)
;
-- 
-- INDEX: IFK_InvoiceCustomerId 
--

CREATE INDEX IFK_InvoiceCustomerId ON invoice(CustomerId)
;
-- 
-- INDEX: IFK_InvoiceLineInvoiceId 
--

CREATE INDEX IFK_InvoiceLineInvoiceId ON invoiceline(InvoiceId)
;
-- 
-- INDEX: IFK_InvoiceLineTrackId 
--

CREATE INDEX IFK_InvoiceLineTrackId ON invoiceline(TrackId)
;
-- 
-- INDEX: IFK_PlaylistTrackTrackId 
--

CREATE INDEX IFK_PlaylistTrackTrackId ON playlisttrack(TrackId)
;
-- 
-- INDEX: IFK_TrackAlbumId 
--

CREATE INDEX IFK_TrackAlbumId ON track(AlbumId)
;
-- 
-- INDEX: IFK_TrackGenreId 
--

CREATE INDEX IFK_TrackGenreId ON track(GenreId)
;
-- 
-- INDEX: IFK_TrackMediaTypeId 
--

CREATE INDEX IFK_TrackMediaTypeId ON track(MediaTypeId)
;
-- 
-- TABLE: album 
--

ALTER TABLE album ADD CONSTRAINT FK_AlbumArtistId 
    FOREIGN KEY (ArtistId)
    REFERENCES artist(ArtistId)
;


-- 
-- TABLE: customer 
--

ALTER TABLE customer ADD CONSTRAINT FK_CustomerSupportRepId 
    FOREIGN KEY (SupportRepId)
    REFERENCES employee(EmployeeId)
;


-- 
-- TABLE: employee 
--

ALTER TABLE employee ADD CONSTRAINT FK_EmployeeReportsTo 
    FOREIGN KEY (ReportsTo)
    REFERENCES employee(EmployeeId)
;


-- 
-- TABLE: invoice 
--

ALTER TABLE invoice ADD CONSTRAINT FK_InvoiceCustomerId 
    FOREIGN KEY (CustomerId)
    REFERENCES customer(CustomerId)
;


-- 
-- TABLE: invoiceline 
--

ALTER TABLE invoiceline ADD CONSTRAINT FK_InvoiceLineInvoiceId 
    FOREIGN KEY (InvoiceId)
    REFERENCES invoice(InvoiceId)
;

ALTER TABLE invoiceline ADD CONSTRAINT FK_InvoiceLineTrackId 
    FOREIGN KEY (TrackId)
    REFERENCES track(TrackId)
;


-- 
-- TABLE: playlisttrack 
--

ALTER TABLE playlisttrack ADD CONSTRAINT FK_PlaylistTrackPlaylistId 
    FOREIGN KEY (PlaylistId)
    REFERENCES playlist(PlaylistId)
;

ALTER TABLE playlisttrack ADD CONSTRAINT FK_PlaylistTrackTrackId 
    FOREIGN KEY (TrackId)
    REFERENCES track(TrackId)
;


-- 
-- TABLE: track 
--

ALTER TABLE track ADD CONSTRAINT FK_TrackAlbumId 
    FOREIGN KEY (AlbumId)
    REFERENCES album(AlbumId)
;

ALTER TABLE track ADD CONSTRAINT FK_TrackGenreId 
    FOREIGN KEY (GenreId)
    REFERENCES genre(GenreId)
;

ALTER TABLE track ADD CONSTRAINT FK_TrackMediaTypeId 
    FOREIGN KEY (MediaTypeId)
    REFERENCES mediatype(MediaTypeId)
;


