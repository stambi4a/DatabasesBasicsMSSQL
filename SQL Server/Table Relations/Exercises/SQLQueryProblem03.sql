CREATE TABLE Students (
StudentID INT PRIMARY KEY NOT NULL,
Name VARCHAR(50)
)

CREATE TABLE StudentsExams(
StudentID INT NOT NULL,
ExamID INT NOT NULL
)

CREATE TABLE Exams(
ExamID INT PRIMARY KEY NOT NULL,
Name VARCHAR(50)
)

INSERT Students
(StudentID, Name) VALUES(1, 'Mila')
INSERT Students
(StudentID, Name) VALUES(2, 'Toni')
INSERT Students
(StudentID, Name) VALUES(3, 'Ron')

INSERT Exams
(ExamID, Name) VALUES(101, 'Spring MVC')
INSERT Exams
(ExamID, Name) VALUES(102, 'Neo4j')
INSERT Exams
(ExamID, Name) VALUES(103, 'Oracle 11g')

INSERT StudentsExams
(StudentID, ExamID) VALUES(1, 101)
INSERT StudentsExams
(StudentID, ExamID) VALUES(1, 102)
INSERT StudentsExams
(StudentID, ExamID) VALUES(2, 101)
INSERT StudentsExams
(StudentID, ExamID) VALUES(3, 103)
INSERT StudentsExams
(StudentID, ExamID) VALUES(2, 102)
INSERT StudentsExams
(StudentID, ExamID) VALUES(2, 103)


ALTER TABLE StudentsExams
ADD PRIMARY KEY(StudentID, ExamID)

ALTER TABLE StudentsExams
ADD FOREIGN KEY(StudentID)
REFERENCES Students(StudentID)

ALTER TABLE StudentsExams
ADD FOREIGN KEY(ExamID)
REFERENCES Exams(ExamID)

SELECT COUNT(*)
  FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
 WHERE TABLE_NAME = 'Students'
SELECT COUNT(*)
  FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
 WHERE TABLE_NAME = 'StudentsExams'
SELECT COUNT(*)
  FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
 WHERE TABLE_NAME = 'Exams'