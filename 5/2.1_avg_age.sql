/*
1. Подсчитайте средний возраст пользователей в таблице users
*/

USE shop;

-- создание таблиц
DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Покупатели';

-- наполнение нужными данными
INSERT INTO users (name, birthday_at) VALUES
  ('Геннадий', '1990-10-05'),
  ('Наталья', '1984-11-12'),
  ('Александр', '1985-05-20'),
  ('Сергей', '1988-02-14'),
  ('Иван', '1998-01-12'),
  ('Мария', '1992-08-29');
 
-- скрипт самого задания
/*
SELECT
  name,
  (TO_DAYS(NOW()) - TO_DAYS(birthday_at))/365.25 AS age
FROM
  users;
*/

-- Средний возраст 30,0356‬
SELECT
  ROUND(AVG((TO_DAYS(NOW()) - TO_DAYS(birthday_at))/365.25), 2) AS avg_age
FROM
  users;

 