CREATE or ALTER PROCEDURE CreateGrade(
    @studentId INT,
	@courseId INT,
    @teacherID INT,
    @grade_grade INT,
    @gradeDate DATE)
AS
BEGIN
    INSERT INTO Grade ( StudentID, CourseID, TeacherID, Grade, CreatedDate)
    VALUES (@studentId, @courseId, @teacherID, @grade_grade, @gradeDate)

    SELECT COUNT(*) AS TotalGrades
    FROM Grade
    WHERE StudentID = @studentId

    SELECT MAX(Grade) AS MaxGrade
    FROM Grade
    WHERE StudentID =  @studentId AND TeacherID = @teacherID
END 
GO


