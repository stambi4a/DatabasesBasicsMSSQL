CREATE TABLE CustomerReviews(
ReviewID INT,
ReviewContent VARCHAR(255) NOT NULL,
ReviewGrade TINYINT CHECK (ReviewGrade BETWEEN 1 AND 10),
AirlineID INT,
CustomerID INT,
CONSTRAINT PK_CustomerReviews PRIMARY KEY(ReviewID),
CONSTRAINT FK_PK_CustomerReviews_Airlines FOREIGN KEY(AirlineID)
REFERENCES Airlines(AirlineID),
CONSTRAINT FK_PK_CustomerReviews_Customers FOREIGN KEY(CustomerID)
REFERENCES Customers(CustomerID)
)

CREATE TABLE CustomerBankAccounts(
AccountID INT,
AccountNumber VARCHAR(10) UNIQUE NOT NULL,
Balance DECIMAL(10,2) NOT NULL,
CustomerID INT,
CONSTRAINT PK_CustomerBankAccounts PRIMARY KEY(AccountID),
CONSTRAINT FK_CustomerBankAccounts_Customers FOREIGN KEY(CustomerID)
REFERENCES Customers(CustomerID)
)

 