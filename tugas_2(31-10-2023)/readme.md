# Dokumentasi Tugas 2 Kelas SBD B

    Marcelinus Alvinanda Chrisantya
    5027221012
    Sistem Basis Data B

# Konten

- [Soal 1](#soal-1)

- [Soal 2](#soal-2)

- [Soal 3](#soal-3)

- [Soal 4](#soal-4)

# Soal 1 

Tampilkan deskripsi tugas, nama mata kuliah, dan nama dosen dari tugas yang paling banyak dikerjakan oleh mahasiswa

## Query
```
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
```
- Query untuk menyelesaikan soal

```
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
```

- Query untuk menghitung jumlah data

## Dokumentasi

![image](https://github.com/J0see1/J0see1.github.io/assets/134209563/e8d13579-3472-4941-ab3e-2735211919a1)

![image](https://github.com/J0see1/J0see1.github.io/assets/134209563/71ba2a60-4d81-457b-bf34-d5a8e1812b56)

# Soal 2

Tampilkan nama mata kuliah dan nama dosen yang memiliki paling banyak jenis tugas

## Query 

```
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
```
- Query untuk menyelesaikan soal

```
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
```

- Query untuk menghitung jumlah data

## Dokumentasi

![image](https://github.com/J0see1/J0see1.github.io/assets/134209563/fa558dfd-68c1-4ed3-81e2-21107327d726)

![image](https://github.com/J0see1/J0see1.github.io/assets/134209563/4dbecdf1-d4b0-4742-994f-13962b88797c)

# Soal 3

Tampilkan deskripsi tugas, nama mata kuliah, dan nama dosen dari tugas yang memiliki rata-rata nilai antara 70 sampai 80

## Query 

```
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
```
- Query untuk menyelesaikan soal

```
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
```
- Query untuk menghitung jumlah data

## Dokumentasi

![image](https://github.com/J0see1/J0see1.github.io/assets/134209563/90d48ee8-4c19-48a8-b73a-afeedcd1cd47)

![image](https://github.com/J0see1/J0see1.github.io/assets/134209563/60d98a10-b19e-4765-b702-27d03fa52bbf)

# Soal 4

Tampilkan nama mahasiswa, NRP, dan nilai yang memiliki nilai dibawah rata-rata pada tugas yang memiliki kata 'car' di deskripsi

## Query 

```
SELECT name_student, nrp, score
FROM akademik.student
INNER JOIN akademik.task ON akademik.student.id = akademik.task.id_mhs
WHERE akademik.task.score < (
    SELECT AVG(score)
    FROM task
    WHERE desc_task LIKE "%car%"
    )
```
- Query untuk menyelesaikan soal

```
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
```
- Query untuk menghitung jumlah data

## Dokumentasi

![image](https://github.com/J0see1/J0see1.github.io/assets/134209563/ce8ace4c-ec22-4f00-80ae-59b8f4c781e2)

![image](https://github.com/J0see1/J0see1.github.io/assets/134209563/9b2e86ea-28dc-4151-8aa9-ed47afa65c08)

# Soal 5

Tampilkan deskripsi tugas, nama mata kuliah, dan nama dosen dari tugas yang memiliki nilai rata-rata dibawah rata-rata nilai semua tugas

## Query

```
SELECT desc_task, name_course, name_lecturer
FROM akademik.task
INNER JOIN akademik.course ON akademik.course.id = akademik.task.id_mk
INNER JOIN akademik.lecturer ON akademik.lecturer.id = akademik.task.id_dos
GROUP BY akademik.task.id
HAVING AVG(score) < (
    SELECT AVG(score)
    FROM task
  	)
```
- Query untuk menyelesaikan soal

```
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
```
- Query untuk menghitung jumlah data

## Dokumentasi

![image](https://github.com/J0see1/J0see1.github.io/assets/134209563/ae95d093-5903-4a0b-8e5f-b4f901c1b970)

![image](https://github.com/J0see1/J0see1.github.io/assets/134209563/77a4fb45-a191-4740-8cde-e89312671cdf)
