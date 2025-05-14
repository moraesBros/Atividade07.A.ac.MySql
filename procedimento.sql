CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(100)
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    title VARCHAR(100),
    department VARCHAR(100),
    semester VARCHAR(10),
    year INT
);

CREATE TABLE grades (
    grade_id INT PRIMARY KEY,
    grade VARCHAR(5),
    numeric_score INT
);

CREATE TABLE enrollments (
    student_id INT,
    course_id INT,
    grade_id INT,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id),
    FOREIGN KEY (grade_id) REFERENCES grades(grade_id)
);

--criar procedimentos

CREATE PROCEDURE student_grade_points(IN input_grade VARCHAR(5))
BEGIN
    SELECT 
        s.name AS student_name,
        s.department AS student_department,
        c.title AS course_title,
        c.department AS course_department,
        c.semester AS course_semester,
        c.year AS course_year,
        g.grade AS alphanumeric_score,
        g.numeric_score AS numeric_score
    FROM 
        students s
    JOIN 
        enrollments e ON s.student_id = e.student_id
    JOIN 
        courses c ON e.course_id = c.course_id
    JOIN 
        grades g ON e.grade_id = g.grade_id
    WHERE 
        g.grade = input_grade;
END

-- uso

CALL student_grade_points('A+');

