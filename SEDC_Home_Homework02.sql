USE SEDCHome

--○ Find all Students with FirstName = Antonio
SELECT * FROM Student
WHERE FirstName = 'Antonio'

--○ Find all Students with DateOfBirth greater than ‘01.01.1999’
SELECT * FROM Student
WHERE DateOfBirth > '01.01.1999'

--○ Find all Students with LastName starting With ‘J’ enrolled in January/1998
SELECT * FROM Student
WHERE LastName LIKE 'J%'
and EnrolledDate >= '01.01.1998'
and EnrolledDate <= '01.31.1998'

--○ List all Students ordered by FirstName
SELECT * FROM Student
ORDER BY FirstName

--○ List all Teacher Last Names and Student Last Names in single result set.
SELECT LastName FROM Student
UNION ALL
SELECT LastName FROM Teacher

--Remove duplicates
SELECT LastName FROM Student
UNION 
SELECT LastName FROM Teacher

--○ Create Foreign key constraints from diagram or with script
ALTER TABLE Grade
ADD CONSTRAINT FK_Grade_Student
FOREIGN KEY (StudentID)
REFERENCES Student(ID)

--○ List all possible combinations of Courses names and AchievementType names that can be passed by student
SELECT
Course.[Name] AS Courses,
AchievementType.[Name] AS AchievementTypeName
FROM Course 
CROSS JOIN AchievementType 

--○ List all Teachers without exam Grade
SELECT  Teacher.FirstName,Teacher.LastName , Teacher.ID
FROM Teacher 
LEFT JOIN Grade  ON Teacher.ID = Grade.TeacherID
WHERE Grade.Comment IS NULL --OR Grade.ID IS NULL


