/*
триггер
*/

USE inventory;


-- скрипт самого задания
-- триггер изменяет статус сотрудника на 'fired', когда устанавливается дата увольнения
DELIMITER //
DROP TRIGGER IF EXISTS quit//
CREATE TRIGGER quit BEFORE UPDATE ON employee
FOR EACH ROW
BEGIN
	if new.fired_at IS NOT null then
		SET NEW.status = 'fired';
	end if;
END//

DELIMITER ;

UPDATE employee
	SET fired_at='2020-02-15'
	WHERE id=28;