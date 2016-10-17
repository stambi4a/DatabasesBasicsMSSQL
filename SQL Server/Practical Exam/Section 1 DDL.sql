CREATE TABLE Flights(
FlightID INT,
DepartureTime DATETIME NOT NULL,
ArrivalTime DATETIME NOT NULL,
Status VARCHAR(9) CHECK (Status ='Departing' OR Status='Delayed' OR Status='Arrived' OR Status='Cancelled'),
OriginAirportID INT,
DestinationAirportID INT,
AirlineID INT,
CONSTRAINT PK_Flights PRIMARY KEY (FlightID),
CONSTRAINT FK_Flights_OriginalAirports FOREIGN KEY(OriginAirportID)
REFERENCES Airports(AirportID),
CONSTRAINT FK_Flights_DEstinationAirports FOREIGN KEY(DestinationAirportID)
REFERENCES Airports(AirportID),
CONSTRAINT FK_Flights_Airlines FOREIGN KEY(AirlineID)
REFERENCES Airlines(AirlineID)
)

CREATE TABLE Tickets(
TicketID INT,
Price DECIMAL(8,2) NOT NULL,
Class VARCHAR(6) CHECK (Class ='First' OR Class='Second' OR Class='Third'),
Seat VARCHAR(5) NOT NULL,
CustomerID INT,
FlightID INT,
CONSTRAINT PK_Tickets PRIMARY KEY(TicketID),
CONSTRAINT FK_Tickets_Customers FOREIGN KEY(CustomerID)
REFERENCES Customers(CustomerID),
CONSTRAINT FK_Tickets_Flights FOREIGN KEY(FlightID)
REFERENCES Flights(FlightID)
)