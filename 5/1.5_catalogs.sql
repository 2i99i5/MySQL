/*
5.(по желанию) Из таблицы catalogs извлекаются записи при помощи запроса.
SELECT * FROM catalogs WHERE id IN (5, 1, 2);
Отсортируйте записи в порядке, заданном в списке IN.
*/

USE shop;

-- создание таблиц
DROP TABLE IF EXISTS catalogs;
CREATE TABLE catalogs (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название раздела',
  UNIQUE unique_name(name(10))
) COMMENT = 'Разделы интернет-магазина';

-- наполнение нужными данными
INSERT INTO catalogs VALUES
  (NULL, 'Процессоры'),
  (NULL, 'Материнские платы'),
  (NULL, 'Видеокарты'),
  (NULL, 'Жесткие диски'),
  (NULL, 'Оперативная память');

-- скрипт самого задания
SELECT 
  * 
FROM 
  catalogs 
WHERE 
  id IN (5, 1, 2)
ORDER by 
	field(id, 5, 1, 2);