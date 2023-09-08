--Declare scalar variable for storing FirstName values
--Assign value ‘Antonio’ to the FirstName variable
--Find all Students having FirstName same as the variable
DECLARE @FirstName NVARCHAR(100)
SET @FirstName = 'Antonio'

SELECT 
*
FROM Student s
WHERE s.FirstName = @FirstName


--Declare table variable that will contain StudentId, StudentName and DateOfBirth
--Fill the table variable with all Female students

DECLARE @StudentTable TABLE
(StudentID int, StudentName NVARCHAR(50), DateOfBirth DATE)

INSERT INTO @StudentTable
SELECT ID, FirstName, DateOfBirth from Student
WHERE Gender = 'F'

SELECT 
*
FROM @StudentTable


--Declare temp table that will contain LastName and EnrolledDate columns
--Fill the temp table with all Male students having First Name starting with ‘A’
--Retrieve the students from the table which last name is with 7 characters

DROP TABLE IF EXISTS  #TempStudentTable

CREATE TABLE #TempStudentTable
(LastName NVARCHAR(50), EnrolledDate DATE)

INSERT INTO #TempStudentTable
SELECT LastName,EnrolledDate FROM dbo.Student
WHERE Gender = 'M' and FirstName like 'A%' and LEN(FirstName) <= 7

SELECT 
* 
FROM #TempStudentTable
GO



-- Find all teachers whose FirstName length is less than 5 and
--the first 3 characters of their FirstName and LastName are the same

CREATE FUNCTION dbo.fn_CompareFirstAndLastName ()
RETURNS VARCHAR(50)
AS
BEGIN
DECLARE @Result VARCHAR(50)
SELECT @Result = t.FirstName + ' ' + t.LastName 
FROM dbo.Teacher t
WHERE LEN(t.FirstName) < 5 and substring (t.FirstName,1,3) = substring (t.LastName,1,3) 
RETURN @Result
END

SELECT dbo.fn_CompareFirstAndLastName()

