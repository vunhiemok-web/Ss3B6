      
-- CREATE DATABASE online_learning;
USE online_learning;
-- KHỞI TẠO CÁC ĐỐI TƯỢNG
DROP TABLE Score;
DROP TABLE Enrollment;
DROP TABLE Course;
DROP TABLE Teacher;
DROP TABLE Student;

CREATE TABLE Student (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    birth_date DATE,
    email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Teacher (
    teacher_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Course (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(150) NOT NULL,
    description TEXT,
    total_sessions INT NOT NULL,
    teacher_id INT
);

CREATE TABLE Enrollment (
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enroll_date DATE NOT NULL,

    PRIMARY KEY (student_id, course_id),

    CONSTRAINT fk_enrollment_student
        FOREIGN KEY (student_id)
        REFERENCES Student(student_id),

    CONSTRAINT fk_enrollment_course
        FOREIGN KEY (course_id)
        REFERENCES Course(course_id)
);

CREATE TABLE Score (
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    midterm_score DECIMAL(4,2),
    final_score DECIMAL(4,2),

    PRIMARY KEY (student_id, course_id),

    CONSTRAINT fk_score_student
        FOREIGN KEY (student_id)
        REFERENCES Student(student_id) ON DELETE CASCADE,

    CONSTRAINT fk_score_course
        FOREIGN KEY (course_id)
        REFERENCES Course(course_id) ON DELETE CASCADE, 

    CONSTRAINT check_midterm_score
        CHECK (midterm_score BETWEEN 0 AND 10),

    CONSTRAINT check_final_score
        CHECK (final_score BETWEEN 0 AND 10)
);


-- PHẦN THÊM DỮ LIỆU VÀO CHO ĐỐI TƯỢNG
INSERT INTO Student (full_name, birth_date, email) VALUES
('Nguyễn Khánh Hưng', '2006-01-01', 'khanhhung.it@gmail.com'),
('Hoàng Long', '2006-05-12', 'hoanglong@gmail.com'),
('Nguyên Thiên Phú', '2006-08-20', 'thienphu@gmail.com'),
('Huỳnh Anh Tuấn', '2006-11-30', 'anhtuan@gmail.com'),
('Lương Hoàng Phúc', '2006-02-15', 'hoangphuc@gmail.com');

INSERT INTO Teacher (full_name, email) VALUES
('Trần Quốc Tuấn', 'tuantq@onlinelearning.edu.vn'),
('Phạm Minh Đức', 'ducmh@onlinelearning.edu.vn'),
('Lê Thị Lan', 'lanlt@onlinelearning.edu.vn'),
('Ngô Bảo Châu', 'chaunb@onlinelearning.edu.vn'),
('Đặng Thái Sơn', 'sondt@onlinelearning.edu.vn');

INSERT INTO Course (course_name, description, total_sessions, teacher_id) VALUES
('Lập trình Web Cơ bản', 'Học HTML, CSS, JS', 12, 1),
('Cấu trúc dữ liệu', 'Giải thuật và cấu trúc dữ liệu', 15, 1),
('Cơ sở dữ liệu SQL', 'Thiết kế và truy vấn DB', 10, 2),
('Lập trình Python', 'Ứng dụng AI và Computer Vision', 20, 3),
('Thiết kế UI/UX', 'Phong cách Cyberpunk & Glassmorphism', 8, 4);

INSERT INTO Enrollment (student_id, course_id, enroll_date) VALUES
(1, 1, '2026-04-01'),
(1, 5, '2026-04-02'),
(2, 1, '2026-04-01'),
(3, 3, '2026-04-05'),
(4, 4, '2026-04-10');

INSERT INTO Score (student_id, course_id, midterm_score, final_score) VALUES
(1, 1, 9.5,5),
(1, 5, 10.0,9.5),
(2, 1, 8.0,9.0),
(3, 3, 5.0, 4.0),
(4, 4, 8.5,10);

-- Phần cập nhật dữ liệu hoặc xóa
-- 1. Cập nhật Email cho sinh viên (Ví dụ: Nguyễn Khánh Hưng đổi email mới)
UPDATE Student 
SET email = 'khanhhung.new2026@gmail.com' 
WHERE student_id = 1;

-- 2. Cập nhật Mô tả cho khóa học (Ví dụ: Làm cho khóa Web trở nên hấp dẫn hơn)
UPDATE Course 
SET description = 'Học HTML5, CSS3, JavaScript ES6 và ReactJS thực chiến' 
WHERE course_id = 1;

-- 3. Cập nhật Điểm cuối kỳ (Ví dụ: Chấm phúc khảo cho sinh viên 3, môn 3 từ 4.0 lên 6.0)
UPDATE Score 
SET final_score = 6.0 
WHERE student_id = 3 AND course_id = 3;


-- Giả sử: Sinh viên 4 (Huỳnh Anh Tuấn) muốn hủy đăng ký khóa 4 (Python)
-- Bước A: Xóa điểm liên quan trước (vì bảng Score tham chiếu tới Enrollment)
DELETE FROM Score 
WHERE student_id = 4 AND course_id = 4;

-- Bước B: Xóa lượt đăng ký (Enrollment)
DELETE FROM Enrollment 
WHERE student_id = 4 AND course_id = 4;

SELECT * FROM Student;
SELECT * FROM Teacher;
SELECT * FROM Course;
SELECT * FROM Enrollment;
SELECT * FROM Score;