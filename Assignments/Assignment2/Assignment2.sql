--Q1
SELECT SUM(il.UnitPrice) as Total_Sales FROM chinook.InvoiceLine il;

--Q2
SELECT c.Country, SUM(il.UnitPrice) as Total_Sales, RANK() OVER(ORDER BY SUM(il.UnitPrice) DESC) AS Rank
FROM chinook.InvoiceLine il 
JOIN chinook.Invoice i ON il.InvoiceId = i.InvoiceId
JOIN chinook.Customer c ON c.CustomerId = i.CustomerId
GROUP BY c.Country
ORDER BY Rank

--Q3
SELECT c.Country, c.State, c.City, SUM(il.UnitPrice) as Total_Sales
FROM chinook.InvoiceLine il 
JOIN chinook.Invoice i ON il.InvoiceId = i.InvoiceId
JOIN chinook.Customer c ON c.CustomerId = i.CustomerId
GROUP BY c.Country, c.State, c.City

--Q4
SELECT c.LastName + ', ' + c.FirstName AS CustomerName, SUM(il.UnitPrice) as Total_Sales, RANK() OVER(ORDER BY SUM(il.UnitPrice) DESC) AS Rank
FROM chinook.InvoiceLine il 
JOIN chinook.Invoice i ON il.InvoiceId = i.InvoiceId
JOIN chinook.Customer c ON c.CustomerId = i.CustomerId
GROUP BY c.LastName, c.FirstName
ORDER BY Rank

--Q5
SELECT a.Name AS Artist_Name, SUM(il.UnitPrice) as Total_Sales, RANK() OVER(ORDER BY SUM(il.UnitPrice) DESC) AS Rank
FROM chinook.InvoiceLine il 
JOIN chinook.Track tr ON tr.TrackId = il.TrackId
JOIN chinook.Album al ON al.AlbumId = tr.AlbumId
JOIN chinook.Artist a ON a.ArtistId = al.ArtistId
GROUP BY a.Name
ORDER BY Rank

--Q6
SELECT a.Title as Album_Name, SUM(il.UnitPrice) as Total_Sales
FROM chinook.InvoiceLine il
JOIN chinook.Track tr ON il.TrackId = tr.TrackId
JOIN chinook.Album a ON a.AlbumId = tr.AlbumId
GROUP BY a.Title

--Q7
SELECT e.LastName + ', ' +  e.FirstName AS EmployeeName, SUM(il.UnitPrice) AS TotalSales
FROM chinook.InvoiceLine il
JOIN chinook.Invoice i ON il.InvoiceId = i.InvoiceId
JOIN chinook.Customer c ON i.CustomerId = c.CustomerId
JOIN chinook.Employee e ON e.EmployeeId = c.SupportRepId
GROUP BY e.LastName, e.FirstName

--Q8
SELECT mt.Name, SUM(tr.TrackId) AS Total_Tracks, SUM(il.UnitPrice) AS Total_Sales
FROM chinook.InvoiceLine il
JOIN chinook.Track tr ON il.TrackId = tr.TrackId
JOIN chinook.MediaType mt ON tr.MediaTypeId = mt.MediaTypeId
GROUP BY mt.Name

--Q9
SELECT c.LastName + ', ' + c.FirstName AS CustomerName, SUM(il.UnitPrice) as Total_Sales
FROM chinook.InvoiceLine il 
JOIN chinook.Invoice i ON il.InvoiceId = i.InvoiceId
JOIN chinook.Customer c ON c.CustomerId = i.CustomerId
GROUP BY c.LastName, c.FirstName

--Q10
SELECT g.Name, SUM(il.UnitPrice) AS Total_Sales
FROM chinook.InvoiceLine il
JOIN chinook.Track tr ON il.TrackId = tr.TrackId
JOIN chinook.Genre g ON g.GenreId = tr.GenreId
GROUP BY g.Name