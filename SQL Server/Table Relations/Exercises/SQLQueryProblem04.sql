CREATE TABLE Teachers(
TeacherId INT PRIMARY KEY NOT NULL,
Name VARCHAR(50),
ManagerID INT
)

INSERT Teachers 
(TeacherId, Name, ManagerID)
VALUES(101, 'John', NULL)
INSERT Teachers 
(TeacherId, Name, ManagerID)
VALUES(102, 'Maya', 106)
INSERT Teachers 
(TeacherId, Name, ManagerID)
VALUES(103, 'Silvia', 106)
INSERT Teachers 
(TeacherId, Name, ManagerID)
VALUES(104, 'Ted', 105)
INSERT Teachers 
(TeacherId, Name, ManagerID)
VALUES(105, 'Mark', 101)
INSERT Teachers 
(TeacherId, Name, ManagerID)
VALUES(106, 'Greta', 101)

ALTER TABLE Teachers
ADD FOREIGN KEY(ManagerID)
REFERENCES Teachers(TeacherID)

SELECT COUNT(*)
  FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
 WHERE TABLE_NAME = 'Teachers'