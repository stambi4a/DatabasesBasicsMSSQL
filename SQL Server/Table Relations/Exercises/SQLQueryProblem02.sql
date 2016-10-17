CREATE TABLE Manufacturers (
ManufacturerId INT NOT NULL,
Name VARCHAR(200),
EstablishedON DATE 
)

CREATE TABLE Models (
ModelID INT NOT NULL,
Name VARCHAR(200),
ManufacturerID INT 
)

INSERT Manufacturers
(ManufacturerID, Name, EstablishedON)
VALUES(1, 'BMW', '07/03/1916')
INSERT Manufacturers
(ManufacturerID, Name, EstablishedON)
VALUES(2, 'BMW', '01/01/2003')
INSERT Manufacturers
(ManufacturerID, Name, EstablishedON)
VALUES(3, 'BMW', '01/05/1966')

INSERT Models
(ModelID, Name, ManufacturerID)
VALUES(101, 'X1', 1)
INSERT Models
(ModelID, Name, ManufacturerID)
VALUES(102, 'i6', 1)
INSERT Models
(ModelID, Name, ManufacturerID)
VALUES(103, 'Model S', 2)
INSERT Models
(ModelID, Name, ManufacturerID)
VALUES(104, 'Model X', 2)
INSERT Models
(ModelID, Name, ManufacturerID)
VALUES(105, 'Model 3', 2)
INSERT Models
(ModelID, Name, ManufacturerID)
VALUES(106, 'Nova', 3)

ALTER TABLE Manufacturers
ADD CONSTRAINT PK_ManufacturerID PRIMARY KEY(ManufacturerID)

ALTER TABLE Models
ADD CONSTRAINT PK_ModelsID PRIMARY KEY(ModelID)

ALTER TABLE Models
ADD CONSTRAINT FK_Models_Manufacturers FOREIGN KEY(ManufacturerID)
REFERENCES Manufacturers(ManufacturerID)
