create database quan_ly_sinh_vien;
use quan_ly_sinh_vien;
CREATE TABLE class (
    id_class INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name_class VARCHAR(60) NOT NULL,
    start_date DATETIME NOT NULL,
    Status BIT
);
CREATE TABLE student (
    id_student INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name_student VARCHAR(30) NOT NULL,
    address VARCHAR(50),
    phone VARCHAR(20),
    status BIT,
    id_class INT NOT NULL,
    FOREIGN KEY (id_class)
        REFERENCES class (id_class)
);
CREATE TABLE subject_student (
    id_subject INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    sub_name VARCHAR(30) NOT NULL,
    credit TINYINT NOT NULL DEFAULT 1 CHECK (credit >= 1),
    status BIT DEFAULT 1
);
CREATE TABLE mark (
    id_mark INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    sub_id INT NOT NULL,
    id_student INT NOT NULL,
    mark FLOAT DEFAULT 0 CHECK (mark BETWEEN 0 AND 100),
    exam_times TINYINT DEFAULT 1,
    UNIQUE (sub_id , id_student),
    FOREIGN KEY (sub_id)
        REFERENCES subject_student (id_subject),
    FOREIGN KEY (id_student)
        REFERENCES student (id_student)
);
INSERT INTO class
VALUES (1, 'A1', '2008-12-20', 1);
INSERT INTO class
VALUES (2, 'A2', '2008-12-22', 1);
INSERT INTO class
VALUES (3, 'B3', current_date, 0);

INSERT INTO student (name_student, address, phone, status, id_class)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO student (name_student, address, status, id_class)
VALUES ('Hoa', 'Hai phong', 1, 1);
INSERT INTO student (name_student, address, phone, status, id_class)
VALUES ('Manh', 'HCM', '0123123123', 0, 2);

INSERT INTO subject_student
VALUES (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);
       
INSERT INTO mark (sub_id, id_student, mark, exam_times)
VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);
       
SELECT 
    *
FROM
    student
WHERE
    name_student LIKE 'h%';

SELECT 
    name_class
FROM
    class
WHERE
    MONTH(start_date) = 12;

SELECT 
    *
FROM
    subject_student
WHERE
    credit > 3 AND credit < 5; 

UPDATE student 
SET 
    id_class = 2
WHERE
    id_student = 1;

SELECT 
    name_student, mark, sub_name
FROM
    mark
        JOIN
    student ON mark.id_student = student.id_student
        JOIN
    subject_student ON mark.sub_id = subject_student.id_subject
ORDER BY mark DESC , sub_name;
