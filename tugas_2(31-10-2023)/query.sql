-- Nama : Marcelinus Alvinanda Chrisantya
-- NRP : 5027221012

-- Soal 1

SELECT desc_task, name_course, name_lecturer
FROM akademik.lecturer
INNER JOIN akademik.task ON akademik.lecturer.id = akademik.task.id_dos
INNER JOIN akademik.course ON akademik.task.id = akademik.course.id
WHERE akademik.task.id_mhs = (
    SELECT id_mhs
    FROM task
    GROUP BY id_mhs
    ORDER BY COUNT(*) DESC
    LIMIT 1
);

-- Menghitung jumlah data
SELECT COUNT(*) AS total_row
FROM (
SELECT desc_task, name_course, name_lecturer
FROM akademik.lecturer
INNER JOIN akademik.task ON akademik.lecturer.id = akademik.task.id_dos
INNER JOIN akademik.course ON akademik.task.id = akademik.course.id
WHERE akademik.task.id_mhs = (
    SELECT id_mhs
    FROM task
    GROUP BY id_mhs
    ORDER BY COUNT(*) DESC
    LIMIT 1
)) AS subquery

-- Soal 2

SELECT name_course, name_lecturer
FROM course
INNER JOIN akademik.lecturer ON akademik.course.id = akademik.lecturer.id
WHERE akademik.course.id = (
    SELECT id_mk
    FROM akademik.task
    GROUP BY id_mk
    ORDER BY COUNT(DISTINCT desc_task) DESC
    LIMIT 1
    )

-- Menghitung jumlah data

SELECT COUNT(*) AS total_row
FROM (
SELECT name_course, name_lecturer
FROM course
INNER JOIN akademik.lecturer ON akademik.course.id = akademik.lecturer.id
WHERE akademik.course.id = (
    SELECT id_mk
    FROM akademik.task
    GROUP BY id_mk
    ORDER BY COUNT(DISTINCT desc_task) DESC
    LIMIT 1
)) AS subquery;

-- Soal 3

SELECT desc_task, name_course, name_lecturer
FROM akademik.task
INNER JOIN akademik.course ON akademik.task.id = akademik.course.id
INNER JOIN akademik.lecturer ON akademik.task.id = akademik.lecturer.id
WHERE akademik.task.id IN (
    SELECT id
    FROM akademik.task
    GROUP by id
   	HAVING AVG(akademik.task.score) BETWEEN 70 AND 80
) 
    
--  Menghitung jumlah data

SELECT COUNT(*) AS total_row
FROM (
SELECT desc_task, name_course, name_lecturer
FROM akademik.task
INNER JOIN akademik.course ON akademik.task.id = akademik.course.id
INNER JOIN akademik.lecturer ON akademik.task.id = akademik.lecturer.id
WHERE akademik.task.id IN (
    SELECT id
    FROM akademik.task
    GROUP by id
   	HAVING AVG(akademik.task.score) BETWEEN 70 AND 80
)) AS subquery;

-- Soal 4

SELECT name_student, nrp, score
FROM akademik.student
INNER JOIN akademik.task ON akademik.student.id = akademik.task.id_mhs
WHERE akademik.task.score < (
    SELECT AVG(score)
    FROM task
    WHERE desc_task LIKE "%car%"
    )
    
-- Menghitung jumlah data

SELECT COUNT(*) AS total_row
FROM (
SELECT name_student, nrp, score
FROM akademik.student
INNER JOIN akademik.task ON akademik.student.id = akademik.task.id_mhs
WHERE akademik.task.score < (
    SELECT AVG(score)
    FROM task
    WHERE desc_task LIKE "%car%"
)) AS subquery;

-- Soal 5

SELECT desc_task, name_course, name_lecturer
FROM akademik.task
INNER JOIN akademik.course ON akademik.course.id = akademik.task.id_mk
INNER JOIN akademik.lecturer ON akademik.lecturer.id = akademik.task.id_dos
GROUP BY akademik.task.id
HAVING AVG(score) < (
    SELECT AVG(score)
    FROM task
  	)

-- Menghitung jumlah data

SELECT count(*) AS total_row
FROM (
SELECT desc_task, name_course, name_lecturer
FROM akademik.task
INNER JOIN akademik.course ON akademik.course.id = akademik.task.id_mk
INNER JOIN akademik.lecturer ON akademik.lecturer.id = akademik.task.id_dos
GROUP BY akademik.task.id
HAVING AVG(score) < (
    SELECT AVG(score)
    FROM task
)) AS subquery; 