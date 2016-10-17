CREATE TABLE Persons (
PersonID INT NOT NULL,
FirstName VARCHAR(200),
Salary MONEY,
PassportID INT
)

INSERT Persons 
(PersonID, FirstName, Salary, PassportID)
VALUES(1, 'Roberto', 43300.00, 102)
INSERT Persons 
(PersonID, FirstName, Salary, PassportID)
VALUES(2, 'Tom', 56100.00, 101)
INSERT Persons 
(PersonID, FirstName, Salary, PassportID)
VALUES(3, 'Yana', 60200.00, 101)

CREATE TABLE Passports (
PassportID INT NOT NULL,
PAssportNumber VARCHAR(max)
)

INSERT Passports
(PassportId, PassportNumber) VALUES(101, 'N34FG21B')
INSERT Passports
(PassportId, PassportNumber) VALUES(102, 'K65LO4R7')
INSERT Passports
(PassportId, PassportNumber) VALUES(103, 'K65LO4R7')

ALTER TABLE Persons
ADD PRIMARY KEY (PersonID)

ALTER TABLE Passports
ADD PRIMARY KEY (PassportID)

ALTER TABLE Persons
ADD FOREIGN KEY(PassportID) 
REFERENCES PAssports(PassportID)