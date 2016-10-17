CREATE TABLE ArrivedFlights(
FlightID INT,
ArrivalTime DATETIME NOT NULL, 
Origin VARCHAR(50) NOT NULL,
Destination VARCHAR(50) NOT NULL,
Passengers INT NOT NULL,
CONSTRAINT PK_ArrivedFlights PRIMARY KEY(FlightId)
)
GO

--TASK (BONUS): Update Trigger
CREATE TRIGGER tr_Update_Flight_Status_Arrived ON Flights 
AFTER UPDATE
AS
BEGIN
	IF (SELECT Status FROM DELETED) != 'Arrived' AND (SELECT Status FROM INSERTED) = 'Arrived'
	BEGIN
		INSERT INTO ArrivedFlights
		VALUES
		((SELECT FlightID FROM INSERTED), 
		(SELECT ArrivalTime FROM INSERTED), 
		(SELECT AirportName FROM INSERTED 
		INNER JOIN Airports 
		ON Airports.AirportID = INSERTED.OriginAirportID),
		(SELECT AirportName FROM INSERTED 
		INNER JOIN Airports 
		ON Airports.AirportID = INSERTED.DestinationAirportID),
		(SELECT COUNT(Customers.CustomerID) FROM Customers
		INNER JOIN Tickets
		ON Tickets.CustomerID = Customers.CustomerID
		INNER JOIN INSERTED
		ON INSERTED.FlightId = Tickets.FlightId))
	END
END
GO

--UPDATE Flights
--SET Status = 'Arrived'
--WHERE FLightID = 1