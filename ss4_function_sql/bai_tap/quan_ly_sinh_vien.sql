use quan_ly_sinh_vien;
SELECT 
    ss.id_subject,
    ss.sub_name,
    ss.credit,
    ss.status,
    MAX(ss.credit)
FROM
    subject_student ss
GROUP BY ss.id_subject;

SELECT 
    ss.id_subject,
    ss.sub_name,
    ss.credit,
    MAX(m.mark) AS 'max point'
FROM
    subject_student ss
        JOIN
    mark m ON m.sub_id = ss.id_subject
GROUP BY ss.id_subject
LIMIT 1;

SELECT 
    s.id_student,
    s.name_student,
    s.address,
    s.phone,
    s.status,
    s.id_class,
    AVG(m.mark) AS 'average'
FROM
    student s
        JOIN
    mark m ON s.id_student = m.id_student
GROUP BY s.id_student , s.name_student;

