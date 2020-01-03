/*
2. Таблица users была неудачно спроектирована. Записи created_at и updated_at
были заданы типом VARCHAR и в них долгое время помещались значения в формате "20.10.2017 8:10".
Необходимо преобразовать поля к типу DATETIME, сохранив введеные ранее значения.
*/

USE shop;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at VARCHAR(255),
  updated_at VARCHAR(255)
) COMMENT = 'Покупатели';

INSERT INTO users (name, birthday_at, created_at, updated_at) VALUES
  ('Геннадий', '1990-10-05', '20.10.2017 8:10', '20.10.2017 8:10'),
  ('Наталья', '1984-11-12', '21.10.2017 9:10', '20.08.2018 8:10'),
  ('Александр', '1985-05-20', '22.10.2017 10:10', '21.10.2018 8:10'),
  ('Сергей', '1988-02-14', '23.10.2017 11:10', '20.10.2019 8:10'),
  ('Иван', '1998-01-12', '24.10.2017 12:10', '21.10.2019 8:10'),
  ('Мария', '1992-08-29', '25.10.2017 8:11', '01.01.2020 8:10');


-- приводим к DATETIME формату 'YYYY-MM-DD hh:mm:ss' 
 UPDATE users SET 
	created_at = DATE_FORMAT(STR_TO_DATE(created_at,'%d.%m.%Y %H:%m'), '%Y-%m-%d %H:%m:%s'),
	updated_at = DATE_FORMAT(STR_TO_DATE(updated_at,'%d.%m.%Y %H:%m'), '%Y-%m-%d %H:%m:%s')
;

-- заменяем формат столбцов
ALTER TABLE users MODIFY created_at datetime;
ALTER TABLE users MODIFY updated_at datetime;

 