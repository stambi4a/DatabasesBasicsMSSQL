--BACKUP DATABASE [Softuni] TO  DISK = N'E:\SoftUni\Databases\Basics\Data Definition and Datatypes\Exercises\softuni-backup.bak' WITH NOFORMAT, NOINIT,  NAME = N'Softuni-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
--GO

--DECLARE @Name VARCHAR(50);
--DECLARE @FileName VARCHAR(200)

--SET @FileName = N'E:\SoftUni\Databases\Basics\Data Definition and Datatypes\Exercises\softuni-backup.bak';
--SET @Name = N'Softuni'

--BACKUP DATABASE @Name TO  DISK = @FileName
--GO
--USE Master
--DROP DATABASE Softuni

--DECLARE @Name VARCHAR(50);
--DECLARE @FileName VARCHAR(200)

--SET @FileName = N'E:\SoftUni\Databases\Basics\Data Definition and Datatypes\Exercises\softuni-backup.bak';
--SET @Name = N'Softuni'

--RESTORE DATABASE @Name FROM DISK = @FileName