/*
4. (по желанию) Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае.
Месяцы заданы в виде списка английских названий ('may', 'august').
*/

USE shop;

-- создание таблиц
DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at VARCHAR(255) COMMENT 'Дата рождения',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Покупатели';

-- наполнение нужными данными
INSERT INTO users (name, birthday_at) VALUES
  ('Геннадий', '05 may 1989'),
  ('Наталья', '12 june 1970'),
  ('Александр', '20 may 1999'),
  ('Сергей', '14 december 2004'),
  ('Иван', '12 august 1991'),
  ('Мария', '29 may 1955');
 
-- скрипт самого задания
select
  *
from 
  users
where 
  birthday_at regexp '(may|august)';