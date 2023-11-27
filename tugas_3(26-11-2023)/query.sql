-- Marcelinus Alvinanda Chrisantya
-- 5027221012 / SBD Kelas B

-- 1. Index



-- 2. Transaction 



-- 3. View
CREATE VIEW NilaiMahasiswa AS
SELECT student.id, name_student, name_course, score
FROM task
INNER JOIN student ON task.id_mhs = student.id
INNER JOIN course ON task.id_mk = course.id;


-- 4. Stored Procedure
DELIMITER $$
CREATE PROCEDURE HapusTask(IN id_task INT)
BEGIN 
	DELETE FROM task 
    WHERE id = id_task;
END $$
DELIMITER ;


-- 5. Trigger
DELIMITER $$
CREATE TRIGGER add_task_logging
AFTER INSERT ON task
FOR EACH ROW
BEGIN
	INSERT INTO log_task (id_mhs, id_mk, id_dos, waktu)
    VALUES (NEW.id_mhs, NEW.id_mk, NEW.id_dos, NOW());
END $$
DELIMITER ;
