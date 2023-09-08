--Calculate the count of all grades per Teacher in the system
SELECT 
TeacherID,
count(Grade) AS GradeCount
FROM Grade g
GROUP BY TeacherID
ORDER BY TeacherID

--Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100)
SELECT 
TeacherID,
count(Grade) AS GradeCount
FROM Grade g
WHERE StudentID < 100
GROUP BY TeacherID
ORDER BY TeacherID

--Find the Maximal Grade, and the Average Grade per Student on all grades in the system
SELECT
[StudentID],
max(Grade) AS MaxGrade,
avg (Grade) AS AvgGrade
FROM Grade
GROUP BY  StudentID

--Calculate the count of all grades per Teacher in the system and filter only grade count greater then 200
SELECT 
TeacherID,
count(Grade) AS GradeCount
FROM Grade g
GROUP BY TeacherID
HAVING count(Grade) >200
ORDER BY TeacherID

--Find the Grade Count, Maximal Grade, and the Average Grade per Student on all grades in the
--system. Filter only records where Maximal Grade is equal to Average Grade. (Calculate statistics for
--all students, but display only those with above-average results.)
SELECT 
StudentID,
count(Grade) AS GradeCount,
max(Grade) AS MaxGrade,
avg (Grade) AS AvgGrade
FROM Grade g
GROUP BY StudentID
HAVING max(Grade) = avg (Grade)

--List Student First Name and Last Name next to the other details from previous query
SELECT 
s.FirstName AS StudentFirstName,
s.LastName AS StudentLastName,
g.StudentID,
COUNT(g.Grade) AS GradeCount,
MAX(g.Grade) AS MaxGrade, 
AVG(g.Grade) AS AvgGrade
FROM Grade g
JOIN Student s ON g.StudentID = s.ID
GROUP BY s.FirstName, s.LastName, g.StudentID
HAVING MAX(g.Grade) = AVG(g.Grade)
GO

--Create new view (vv_StudentGrades) that will List all StudentIds and count of Grades per student
DROP VIEW IF  EXISTS vv_StudentGrades
GO

CREATE VIEW vv_StudentGrades
AS
SELECT StudentID, 
COUNT(ID) AS GradeCount
FROM Grade
GROUP BY StudentID
GO

--Change the view to show Student First and Last Names instead of StudentID
ALTER VIEW vv_StudentGrades AS
SELECT s.FirstName AS StudentFirstName,
s.LastName AS StudentLastName, 
g.StudentID,
COUNT(g.ID) AS GradeCount
FROM Grade g
JOIN Student s ON g.StudentID = s.ID
GROUP BY s.FirstName, s.LastName, g.StudentID

--List all rows from view ordered by biggest Grade Count
SELECT *
FROM vv_StudentGrades
ORDER BY GradeCount DESC