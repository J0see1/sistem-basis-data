-- soal 1
SELECT name_student, desc_task, score, name_course, name_lecturer
FROM akademik.student 
INNER JOIN akademik.task ON akademik.student.id = akademik.task.id_mhs
INNER JOIN akademik.lecturer ON akademik.task.id = akademik.lecturer.id
INNER JOIN akademik.course ON akademik.task.id = akademik.course.id

-- menghitung jumlah siswa
SELECT COUNT(*) as total_rows
FROM (
    SELECT name_student, desc_task, score, name_course, name_lecturer
    FROM akademik.student 
    INNER JOIN akademik.task ON akademik.student.id = akademik.task.id_mhs
    INNER JOIN akademik.lecturer ON akademik.task.id = akademik.lecturer.id
    INNER JOIN akademik.course ON akademik.task.id = akademik.course.id
) as subquery;


-- soal 2
SELECT name_student, desc_task, score, name_course, name_lecturer
FROM akademik.student
INNER JOIN akademik.task ON akademik.student.id = akademik.task.id_mhs
INNER JOIN akademik.lecturer ON akademik.task.id = akademik.lecturer.id
INNER JOIN akademik.course ON akademik.task.id = akademik.course.id
WHERE name_lecturer LIKE 'H%';

-- menghitung jumlah siswa
SELECT COUNT(*) as total_rows
FROM (
SELECT name_student, desc_task, score, name_course, name_lecturer
FROM akademik.student
INNER JOIN akademik.task ON akademik.student.id = akademik.task.id_mhs
INNER JOIN akademik.lecturer ON akademik.task.id = akademik.lecturer.id
INNER JOIN akademik.course ON akademik.task.id = akademik.course.id
WHERE name_lecturer LIKE 'H%';
) as subquery;

-- soal 3
SELECT name_student, desc_task, score, name_course, name_lecturer
FROM akademik.student
INNER JOIN akademik.task ON akademik.student.id = akademik.task.id_mhs
INNER JOIN akademik.lecturer ON akademik.student.id = akademik.task.id_mhs
INNER JOIN akademik.course ON akademik.student.id = akademik.task.id_mhs
WHERE score BETWEEN 60 AND 80
ORDER BY score ASC;

-- soal 4
SELECT akademik.student.id, nrp, name_student
FROM akademik.student
LEFT JOIN akademik.task ON akademik.student.id = akademik.task.id_mhs
WHERE id_mhs IS NULL;