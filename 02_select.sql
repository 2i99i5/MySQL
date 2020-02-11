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

-- список сотрудников филиала, номер филиала записывается в переменную @branchid
SET @branchid = 1;
SELECT
	CONCAT(e.lastname, ' ', e.firstname, ' ', e.middlename) AS 'Cотрудник',
	p.name AS 'Должность',
	d.short_name AS 'Отдел',
	e.phone AS 'Телефон',
	e.email AS 'E-mail'
FROM employee e
JOIN `position`p ON p.id=e.pos_id
JOIN division d ON d.id=e.division_id
WHERE e.status = 'active' and e.branch_id = @branchid
ORDER BY e.division_id
;

-- количество сотрудников в отделах филиала, номер филиала записывается в переменную @branchid
SET @branchid = 1;
SELECT
	d.name,
	COUNT(*)
FROM employee e
JOIN division d ON d.id=e.division_id
WHERE e.status = 'active' and e.branch_id = @branchid
group by e.division_id
;
