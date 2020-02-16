/*
Представления
*/

USE inventory;


-- скрипт самого задания
-- наклейки для техники
DROP VIEW IF EXISTS label;
CREATE VIEW label (num, name)
AS SELECT
	bi.inv_num,
	bi.name
FROM buh_inventory bi
WHERE bi.status_id not in (4, 5, 6)
ORDER BY bi.inv_num
;

-- наклейки для принтеров и мфу
DROP VIEW IF EXISTS label_printers;
CREATE VIEW label_printers (name, net_name, ip)
AS SELECT
	concat (m.mfr,' ',m.name),
	ii.net_name,
	ii.ipv4_addr
FROM it_inventory ii
JOIN model m ON m.id=ii.model_id
WHERE ii.type_id in (13,14,15,16)
;

SELECT * FROM label_printers;
SELECT * FROM label;