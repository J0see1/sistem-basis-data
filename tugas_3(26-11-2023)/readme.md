# Dokumentasi Tugas 3 Kelas SBD B

    Marcelinus Alvinanda Chrisantya
    5027221012
    Sistem Basis Data B

# Konten

- [Soal 1](#soal-1)

- [Soal 2](#soal-2)

- [Soal 3](#soal-3)

- [Soal 4](#soal-4)

- [Soal 5](#soal-5)

# Soal 1

Index

```
CREATE INDEX id ON task(desc_task)

SELECT *
FROM task
USE INDEX(id)
WHERE id = 1;
```

## Dokumentasi

![image](https://github.com/J0see1/pweb-payload-cms-P19-2023/assets/134209563/42bd3b39-4bff-4600-b87d-1880a2afb58e)

ketika tidak menggunakan index

![image](https://github.com/J0see1/pweb-payload-cms-P19-2023/assets/134209563/5b2992a2-90cc-487c-a967-796d9f347a92)

ketika menggunakan index

# Soal 2

Transaction

```
START TRANSACTION;

UPDATE student SET name_student = "Joko Suseno" WHERE id = "2";

COMMIT;
```

## Dokumentasi

![image](https://github.com/J0see1/pweb-payload-cms-P19-2023/assets/134209563/0d1edc07-419b-4ad1-8e1b-55b75fa58ec8)

sebelum commit

![image](https://github.com/J0see1/pweb-payload-cms-P19-2023/assets/134209563/97974e22-9405-4e4b-be6d-93c529d6fecd)

setelah commit


# Soal 3

View

```
CREATE VIEW NilaiMahasiswa AS
SELECT student.id, name_student, name_course, score
FROM task
INNER JOIN student ON task.id_mhs = student.id
INNER JOIN course ON task.id_mk = course.id;
```

## Dokumentasi

![image](https://github.com/J0see1/pweb-payload-cms-P19-2023/assets/134209563/5746dd7e-3745-4a29-9d96-28c95ee0d863)

output seluruh kolom view NilaiMahasiswa

# Soal 4

Stored Procedure

```
DELIMITER $$
CREATE PROCEDURE HapusTask(IN id_task INT)
BEGIN 
	DELETE FROM task 
    WHERE id = id_task;
END $$
DELIMITER ;
```

## Dokumentasi

![image](https://github.com/J0see1/pweb-payload-cms-P19-2023/assets/134209563/d7b1f83c-e0d9-4fd5-a4c0-b78a1f537450)

struktur awal table task

![image](https://github.com/J0see1/pweb-payload-cms-P19-2023/assets/134209563/dfec4eae-56ca-4f84-adc2-cda29991becb)

procedure berhasil dijalankan

![image](https://github.com/J0see1/pweb-payload-cms-P19-2023/assets/134209563/3ae86935-11dc-4c4b-9eda-254639d3be34)

setelah procedure HapusTask dijalankan

# Soal 5

Trigger

```
DELIMITER $$
CREATE TRIGGER add_task_logging
AFTER INSERT ON task
FOR EACH ROW
BEGIN
	INSERT INTO log_task (id_mhs, id_mk, id_dos, waktu)
    VALUES (NEW.id_mhs, NEW.id_mk, NEW.id_dos, NOW());
END $$
DELIMITER ;
```

## Dokumentasi

![image](https://github.com/J0see1/pweb-payload-cms-P19-2023/assets/134209563/06e93ad0-be75-49d1-b0e5-6e396b93f2df)

kondisi awal tabel log_task

![image](https://github.com/J0see1/pweb-payload-cms-P19-2023/assets/134209563/7862ade1-1a79-4bbc-9f61-baff321cdb62)

penambahan data pada tabel task

![image](https://github.com/J0see1/pweb-payload-cms-P19-2023/assets/134209563/22b0ffe0-6592-4182-ba92-3eb269c43a64)

kondisi tabel log_task setelah trigger aktif