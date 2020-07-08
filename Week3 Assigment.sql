-- 1) Using a subquery, find the names of all the tracks for the album "Californication". 
-- What is the title of the 8th track?
	SELECT tr.Name, ab.Title
	FROM Tracks AS tr LEFT JOIN Albums AS ab
	ON tr.AlbumID = ab.AlbumID
	WHERE ab.Title = "Californication"
    
-- 2) Find the total number of invoices for each customer along with the customer's full name, city and email.
-- what is the email address of the 5th person, František Wichterlová? 
	SELECT FirstName, LastName, City, Email, COUNT(i.CustomerId) AS Invoices
	FROM Customers c INNER JOIN Invoices i 
	ON c.CustomerId = i.CustomerId
	GROUP BY c.CustomerId
    
-- 3) Retrieve the track name, album, artist, and trackID for all the albums.
-- What is the song title of trackID 12 from the "For Those About to Rock We Salute You" album?
	SELECT tr.Name,a.Name AS Artist, ab.Title AS Album, tr.TrackId
	FROM ((Tracks AS tr INNER JOIN Albums AS ab ON tr.AlbumId = ab.AlbumId)
	INNER JOIN Artists a ON a.ArtistId = ab.ArtistId)
    
-- 4) Retrieve a list with the managers last name, and the last name of the employees who report to him or her.
-- who are the reports for the manager named Mitchell?
	SELECT m.LastName AS Manager, e.LastName AS Employee
	FROM Employees e INNER JOIN Employees m 
	ON e.ReportsTo = m.EmployeeID
    
-- 5) Find the name and ID of the artists who do not have albums.

	SELECT Artists.Name AS Artist,
       	   Artists.ArtistId,
       	   Albums.Title AS Album
	FROM Artists LEFT JOIN Albums
	ON Artists.ArtistId = Albums.ArtistId
	WHERE Album IS NULL
    
-- 6) Use a UNION to create a list of all the employee's and customer's first names and last names ordered 
-- by the last name in descending order. Determine what is the last name of the 6th record? 

	select FirstName, LastName 
	from Employees  
	union
	select FirstName,LastName 
	from Customers
	order by LastName desc
    
-- 7) See if there are any customers who have a different city listed in their billing city 
-- versus their customer city.
	select Customers.FirstName,Customers.City,Invoices.BillingCity
	from Customers left join Invoices
	on Customers.CustomerId=Invoices.CustomerId
	where Customers.City<>Invoices.BillingCity









