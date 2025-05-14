CREATE FUNCTION dbo.return_instructor_location (@InstructorName NVARCHAR(100))
RETURNS TABLE
AS
RETURN
(
    SELECT 
        i.Name AS InstructorName,
        c.Title AS CourseTitle,
        c.Semester AS CourseSemester,
        c.Year AS CourseYear,
        cl.Building AS ClassroomBuilding,
        cl.RoomNumber AS ClassroomRoomNumber
    FROM 
        Instructors i
    JOIN 
        Enrollments e ON i.InstructorID = e.InstructorID
    JOIN 
        Courses c ON e.CourseID = c.CourseID
    JOIN 
        Classrooms cl ON c.ClassroomID = cl.ClassroomID
    WHERE 
        i.Name = @InstructorName
);


