/*
Характерные запросы к БД
*/

USE inventory;


-- скрипт самого задания
-- список техники в конкретном офисе, номер офиса записывается в переменную @of_id
SET @of_id = 1;
SELECT
	bi.inv_num AS 'Инвентарный номер',
	bi.name AS 'Наименование',
	CONCAT(e.lastname, ' ', e.firstname) AS 'Cотрудник',
	o.address AS 'Адрес'
FROM buh_inventory bi
JOIN offices o ON o.id=bi.office_id
JOIN employee e ON e.id=bi.employee_id
WHERE bi.office_id = @of_id AND bi.status_id not in (4, 5, 6)
ORDER BY e.lastname
;
