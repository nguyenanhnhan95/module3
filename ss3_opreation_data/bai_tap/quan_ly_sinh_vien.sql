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
