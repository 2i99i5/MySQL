/*
2. Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели.
Следует учесть, что необходимы дни недели текущего года, а не года рождения.
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
  ('Мария', '1992-08-29'),
  ('Високос', '2000-02-29');

-- скрипт самого задания
-- для 2019 года
SELECT
  DAYNAME(CAST(CONCAT(2019, SUBSTRING(birthday_at FROM 5)) as DATE)) as `day_2019`,
  count(*)
FROM
  users
group by
  `day_2019`;
 
-- для 2020 года
SELECT
  DAYNAME(CAST(CONCAT(2020, SUBSTRING(birthday_at FROM 5)) as DATE)) as `day_2020`,
  count(*)
FROM
  users
group by
  `day_2020`
order by
  `day_2020`;

 