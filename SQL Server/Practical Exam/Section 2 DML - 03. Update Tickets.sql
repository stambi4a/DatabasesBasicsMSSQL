UPDATE Tickets
SET Price = Price * 1.5
WHERE TicketID IN (SELECT TicketID FROM TicketsCopy
INNER JOIN Flights
ON Flights.FlightID = Tickets.FlightID
INNER JOIN Airlines
ON Airlines.AirlineID = Flights.AirlineID
WHERE Rating = (SELECT MAX(Rating) fROM Airlines))