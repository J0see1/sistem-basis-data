# Dokumentasi Tugas Kelas SBD

# Konten

- [Soal 1](#soal-1)

- [Soal 2](#soal-2)

- [Soal 3](#soal-3)

- [Soal 4](#soal-4)

# Soal 1 
- Display all the names of students, task descriptions, course names, and lecturer names of students who have completed the task

## Query

```sql
SELECT name_student, desc_task, score, name_course, name_lecturer
FROM akademik.student 
INNER JOIN akademik.task ON akademik.student.id = akademik.task.id_mhs
INNER JOIN akademik.lecturer ON akademik.task.id = akademik.lecturer.id
INNER JOIN akademik.course ON akademik.task.id = akademik.course.id
```

- Query untuk menyelesaikan soal

```sql
SELECT COUNT(*) as total_rows
FROM (
    SELECT name_student, desc_task, score, name_course, name_lecturer
    FROM akademik.student 
    INNER JOIN akademik.task ON akademik.student.id = akademik.task.id_mhs
    INNER JOIN akademik.lecturer ON akademik.task.id = akademik.lecturer.id
    INNER JOIN akademik.course ON akademik.task.id = akademik.course.id
) as subquery;

```

- Query untuk menghitung jumlah data

## Dokumentasi

![image](https://github.com/J0see1/KPP-BMS/assets/134209563/cf48ba82-ac22-49b2-8c7e-685dee3dadcf)

- Dokumentasi query penyelesaian soal 

![image](https://github.com/J0see1/KPP-BMS/assets/134209563/f026ac15-21af-44ee-af28-a66a1c10609b)

- Dokumentasi query menghitung jumlah data

# Soal 2

- Display the names of students, task descriptions, course names, and lecturer names of students who have completed the task and the task was assigned by an instructor whose name starts with "H"

## Query 

```sql
SELECT name_student, desc_task, score, name_course, name_lecturer
FROM akademik.student
INNER JOIN akademik.task ON akademik.student.id = akademik.task.id_mhs
INNER JOIN akademik.lecturer ON akademik.task.id = akademik.lecturer.id
INNER JOIN akademik.course ON akademik.task.id = akademik.course.id
WHERE name_lecturer LIKE 'H%';
```

- Query untuk menyelesaikan soal

```sql
SELECT COUNT(*) as total_rows
FROM (
    SELECT name_student, desc_task, score, name_course, name_lecturer
    FROM akademik.student
    INNER JOIN akademik.task ON akademik.student.id = akademik.task.id_mhs
    INNER JOIN akademik.lecturer ON akademik.task.id = akademik.lecturer.id
    INNER JOIN akademik.course ON akademik.task.id = akademik.course.id
    WHERE name_lecturer LIKE 'H%'
) as subquery;
```

- Query untuk menghitung jumlah data

## Dokumentasi

![image](https://github.com/J0see1/KPP-BMS/assets/134209563/45879cc9-c6d9-41d4-982b-d08db61310cb)

- Dokumentasi query penyelesaian soal 

![image](https://github.com/J0see1/KPP-BMS/assets/134209563/d6735bea-dc8a-4812-ac06-982582a6bb29)

- Dokumentasi query menghitung jumlah data


# Soal 3

- Display the names of students, task descriptions, course names, and lecturer names of students who have completed the task with a task score between 60 and 80, sorted from the smallest score

## Query 

```sql
SELECT name_student, desc_task, score, name_course, name_lecturer
FROM akademik.student
INNER JOIN akademik.task ON akademik.student.id = akademik.task.id_mhs
INNER JOIN akademik.lecturer ON akademik.task.id = akademik.lecturer.id
INNER JOIN akademik.course ON akademik.task.id = akademik.course.id
WHERE score BETWEEN 60 AND 80
ORDER BY score ASC;
```

- Query untuk menyelesaikan soal

```sql
SELECT COUNT(*) as total_rows
FROM (
    SELECT name_student, desc_task, score, name_course, name_lecturer
    FROM akademik.student
    INNER JOIN akademik.task ON akademik.student.id = akademik.task.id_mhs
    INNER JOIN akademik.lecturer ON akademik.task.id = akademik.lecturer.id
    INNER JOIN akademik.course ON akademik.task.id = akademik.course.id
    WHERE score BETWEEN 60 AND 80
    ORDER BY score ASC
) as subquery;
```

- Query untuk menghitung jumlah data

## Dokumentasi

![image](https://github.com/J0see1/KPP-BMS/assets/134209563/8ce5bfbb-fc5f-4c7b-8a75-ee930a94c4b4)

- Dokumentasi query penyelesaian soal 

![image](https://github.com/J0see1/KPP-BMS/assets/134209563/a6e79587-bc50-44d2-98ef-1fe1d4008f26)

- Dokumentasi query menghitung jumlah data


# Soal 4

- Display the names and NRP of students who have never completed any tasks at all

## Query 

```sql
SELECT name_student, nrp
FROM akademik.student
LEFT JOIN akademik.task ON akademik.student.id = akademik.task.id
WHERE akademik.task.id IS NULL;
```

- Query untuk menyelesaikan soal

```sql
SELECT COUNT(*) as total_rows
FROM (
    SELECT name_student, nrp
    FROM akademik.student
    LEFT JOIN akademik.task ON akademik.student.id = akademik.task.id
    WHERE akademik.task.id IS NULL
) as subquery;
```

- Query untuk menghitung jumlah data

## Dokumentasi

![image](https://github.com/J0see1/KPP-BMS/assets/134209563/17f9fad7-4aec-4fea-a37c-a3c15b7e43fb)

- Dokumentasi query penyelesaian soal 

![image](https://github.com/J0see1/KPP-BMS/assets/134209563/6c44f4cc-cd83-4064-a60e-12c204485caa)

- Dokumentasi query menghitung jumlah data

