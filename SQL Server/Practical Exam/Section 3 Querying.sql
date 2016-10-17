----Task 1 Extract All Tickets
--SELECT TicketID, Price, Class, Seat FROM Tickets
--ORDER BY ticketId ASC

----Task 2: Extract All Customers 
--SELECT CustomerID, CONCAT(Firstname,' ', LastName) AS FullName, Gender FROM Customers
--ORDER BY Fullname, CustomerID

----Task 3: Extract Delayed Flights
--SELECT FlightID, DepartureTime, ArrivalTime FROM Flights
--WHERE Status = 'Delayed'
--ORDER BY FlightId ASC

----Task 4: Extract Top 5 Most Highly Rated Airlines which have any Flights
--SELECT TOP 5 Airlines.AirlineID, AirlineName, Nationality, Rating FROM  Airlines
--WHERE AirlineID IN (SELECT AirlineID FROM Flights)
--ORDER BY Rating DESC, Airlines.AirlineID

----Task 5: Extract all Tickets with price below 5000, for First Class
--SELECT TicketID, AirportName AS Destination, CONCAT(FirstName, ' ', LastName) AS CustomerName FROM Tickets
--INNER JOIN Flights
--ON Flights.FlightID = Tickets.FlightID
--INNER JOIN Airports 
--ON Airports.AirportId = Flights.DEstinationAirportID
--INNER JOIN Customers 
--ON Customers.CustomerID = Tickets.CustomerID
--WHERE Price < 5000 AND Class = 'First'

----Task 6: Extract all Customers which are departing from their Home Town
--SELECT DISTINCT c.CustomerID, CONCAT(c.FirstName, ' ', c.LastName) AS FullName FROM Tickets
--INNER JOIN Customers c
--ON c.CustomerID = Tickets.CustomerID
--INNER JOIN Flights
--ON Flights.FlightID = Tickets.FlightID
--INNER JOIN Airports
--ON Airports.AirportID = Flights.OriginAirportID
--INNER JOIN Towns
--ON Towns.TownID = Airports.TownID
--INNER JOIN Towns AS t
--ON t.TownId = c.HomeTownID
--INNER JOIN Customers cs
--ON cs.CustomerID = c.CustomerId
--INNER JOIN Towns ts
--ON Towns.TownId = cs.HomeTownID 
--ORDER BY CustomerID ASC

----Task 7: Extract all Customers which will fly
--SELECT Customers.CustomerID, CONCAT(FirstName, ' ', LastName) AS FullName, DATEDIFF(YEAR,  DateOfBirth, CAST('2016-001-01 00:00:00' AS DATETIME)) AS Age FROM Customers
--INNER JOIN Tickets
--ON Tickets.CustomerId = Customers.CustomerId
--INNER JOIN Flights 
--ON Flights.FlightID = Tickets.FlightID
--WHERE Status = 'Departing'
--ORDER BY Age, CustomerID ASC

----Task 8: Extract Top 3 Customers which have Delayed Flights
--SELECT TOP 3 Customers.CustomerID, CONCAT(FirstName, ' ', LastName) AS FullName, Price AS TicketPrice, AirportName AS Destination FROM Customers
--INNER JOIN Tickets
--ON Customers.CustomerId = Tickets.CustomerId
--INNER JOIN Flights 
--ON Flights.FlightId = Tickets.FlightId
--INNER JOIN Airports 
--ON Airports.AirportID = Flights.DestinationAirportID
--WHERE Status = 'Delayed'
--ORDER BY Price DESC

----Task 9: Extract the Last 5 Flights, which are departing.
--SELECT TOP 5 FlightID, DepartureTime, Arrivaltime, Origin, Destination FROM Flights
--INNER JOIN (SELECT Airports.AirportId, AirportName AS Origin FROM Airports) AS a
--ON a.AirportId = Flights.OriginAirportId
--INNER JOIN (SELECT Airports.AirportId, AirportName AS Destination FROM Airports) AS d
--ON d.AirportId = Flights.DestinationAirportId
--WHERE Status = 'Departing'
--ORDER BY DepartureTime ASC, FlightID

----Task 10: Extract all Customers below 21 years, which have already flew at least once
--SELECT DISTINCT Customers.CustomerID, CONCAT(FirstName, ' ', LastName) AS FullName, DATEDIFF(YEAR,  DateOfBirth, CAST('2016-001-01 00:00:00' AS DATETIME)) AS Age FROM Customers
--INNER JOIN Tickets
--ON Tickets.CustomerId = Customers.CustomerId
--INNER JOIN Flights 
--ON Flights.FlightID = Tickets.FlightID
--WHERE Status = 'Arrived' AND DATEDIFF(YEAR,  DateOfBirth, CAST('2016-001-01 00:00:00' AS DATETIME)) < 21
--ORDER BY Age, CustomerID ASC

----TASK 11.Extract all Airports and the Count of People departing from them
--SELECT AirportID, AirportName, Count(Customers.CustomerId) AS Passengers FROM Flights
--INNER JOIN Airports
--ON Flights.OriginAirportId = Airports.AirportId
--INNER JOIN Tickets
--ON tickets.FlightId = Flights.FlightID
--INNER JOIN Customers
--ON Customers.CustomerID = Tickets.CustomerId
--WHERE Status = 'Departing'
--GROUP By AirportID, AirportName