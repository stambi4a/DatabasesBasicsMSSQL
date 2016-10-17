--Task 1: Review Registering Procedure
--CREATE PROCEDURE usp_SubmitReview(@CustomerId INT, @ReviewContent VARCHAR(255), @ReviewGrade TINYINT, @AirlineName varchar(30)) 
--AS 
--BEGIN
--	IF NOT EXISTS (SELECT AirlineName FROM Airlines WHERE AirlineName = @AirlineName)
--	BEGIN
--		RAISERROR('Airline does not exist.', 16, 1)
--	END
--	ELSE
--	BEGIN
--		DECLARE @reviewId INT = (SELECT COUNT(reviewId) FROM CustomerReviews)
--		DECLARE @AirlineId INT = (SELECT AirlineId FROM Airlines WHERE AirlineName = @AirlineName)
--		INSERT INTO CustomerReviews
--		VALUES(@reviewId + 1, @ReviewContent, @ReviewGrade, @AirlineId, @CustomerId)
--	END
--END
--GO
--EXEC dbo.usp_SubmitReview 1, 'askljfhasjldhf', 2, 'Royal Aisdrline'

--Task 2: Ticket Purchase Procedure
--CREATE PROCEDURE usp_PurchaseTicket(@CustomerId INT, @FlightID INT, @TicketPrice DECIMAL(10,2),@Class VARCHAR(6), @Seat varchar(5))
--AS 
--BEGIN
--	DECLARE @CustomerDebit DECIMAL(10,2) = 
--	(SELECT Balance FROM CustomerBankAccounts 
--	INNER JOIN Customers
--	ON Customers.CustomerID = CustomerBankAccounts.CustomerID
--	WHERE Customers.CustomerId = @CustomerID)
--	IF (@CustomerDebit < @TicketPrice)
--	BEGIN
--		 RAISERROR('Insufficient bank account balance for ticket purchase.', 16, 1)
--	END
--	ELSE
--	BEGIN
--		DECLARE @TicketId INT = (SELECT COUNT(TicketID) FROM tickets)
--		INSERT INTO Tickets
--		VALUES
--		(@TicketId + 1, @TicketPrice, @Class, @Seat, @CustomerID, @FlightID);
--		UPDATE CustomerBankAccounts
--		SET Balance = Balance - @TicketPrice
--		WHERE CustomerId = @CustomerId
--	END
--END

--EXEC dbo.usp_PurchaseTicket 1, 4, 2000, 'First', '45-Q'
--UPDATE CustomerBankAccounts
--SET Balance = Balance + 2000
--WHERE CustomerId = 1