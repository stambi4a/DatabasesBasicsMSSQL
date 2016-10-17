

--SELECT * INTO TicketsCopy FROM Tickets

--SELECT * FROM Airlines
--INNER JOIN Flights
--ON Flights.AirlineID = Airlines.AirlineID
--INNER JOIN Tickets ON tickets.FlightId = flights.FlightID
--WHERE Rating = (SELECT MAX(Rating) FROM Airlines)