-- importing customer table

CREATE TABLE Customers(
CustomerId  VARCHAR(5)PRIMARY KEY  NOT NULL,
FirstName VARCHAR(20),
LastName VARCHAR(20),
Address TEXT,
City VARCHAR(20),
Country VARCHAR (20),
Postalcode TEXT,
Phone TEXT,
E_mail TEXT,
SupportRepId VARCHAR(5)
);


--viewing customer table
SELECT * FROM Customers;


--importing invoice table
CREATE TABLE Invoice(
Invoiceid VARCHAR(5) PRIMARY KEY NOT NULL,
Customerid VARCHAR(5)  REFERENCES Customers(customerid) NOT NULL,
InvoiceDate DATE,
BillingADDRESS TEXT,
BillingCity TEXT,
BillingCountry TEXT,
Total DECIMAL(10,2)

);

--Viewing invoice table
SELECT * FROM Invoice;


--import artist table
CREATE TABLE ARTISTS(
Artistid VARCHAR(5) PRIMARY KEY NOT NULL,
Name TEXT
);

--VIEW artist table
SELECT * FROM ARTISTS;

--create album table
CREATE TABLE ALBUM(
AlbumId VARCHAR(5) PRIMARY KEY NOT NULL,
Title TEXT,
ArtistId VARCHAR(5) REFERENCES Artists(Artistid) NOT NULL
);

--view Album table
SELECT * FROM ALBUM;


--import Genre Table
CREATE Table Genre(
GenreId VARCHAR(5) PRIMARY KEY NOT NULL,
Name TEXT);

--import MediaType Table
CREATE Table MediaType(
MediaTypeId VARCHAR(5) PRIMARY KEY NOT NULL,
Name TEXT
);

--view mdiatype table
SELECT  *FROM  MEDIAtYPE;


--import playlists Table
CREATE TABLE Playlists(
PlaylistId VARCHAR(5) PRIMARY KEY NOT NULL,
Name TEXT
);

--view playlists table
SELECT * FROM Playlists;

--create and import TrackTable
CREATE TABLE TRACK(
TrackID VARCHAR(5) PRIMARY KEY NOT NULL,
Name TEXT,
AlbumID VARCHAR(5) REFERENCES Album(AlbumId) not null,
MediaTypeId VARCHAR(5) REFERENCES MediaType(MediaTypeId) NOT NULL,
GenreId VARCHAR(5) REFERENCES Genre(GenreID) NOT NULL,
Composer TEXT,
Milliseconds INT,
Byes INT,
UnitPrice DECIMAL(10,2)
);

--VIEW TRACKTABLE
SELECT * FROM Track;

--create playlisttrack  table
CREATE TABLE PLAYLISTTRACK(
PlaylistId VARCHAR(10) REFERENCES Playlists(Playlistid) NOT NULL,
TrackId VARCHAR(10) REFERENCES Track(TrackId) NOT NULL
);

--VIEW PlayListTrackTable
SELECT * FROM PlaylistTrack;

--create and import invoicelinetable
CREATE TABLE Invoice_Line(
InvoiceLineId VARCHAR(10) PRIMARY KEY NOT NULL,
InvoiceId VARCHAR(10) REFERENCES InvoiCe(invoiceid) NOT NULL,
Trackid  VARCHAR(10) REFERENCES Track(Trackid) NOT NULL,
UnitPrice DECIMAL(10,2),
Quantity int
);

---view invoiceline table
SELECT * FROM INVOICE_lINE;

--import employee table
CREATE TABLE EMPLOYEE(
EmployeeId VARCHAR(5) PRIMARY KEY NOT NULL,
LastName TEXT,
FirstName TEXT,
TITLE TEXT,
ReportsTo TEXT,
BirthDate DATE,
HireDATE DATE,
ADDRESS TEXT,
CITY TEXT,
STATE TEXT,
COUNTRY TEXT,
POSTALCODE TEXT,
PHONE TEXT,
FAX TEXT,
E_MAIL TEXT);

--view employeetable
SELECT * FROM EMPLOYEE;
