/*
3. (по желанию) Подсчитайте произведение чисел в столбце таблицы
*/

USE shop;

-- создание таблиц
DROP TABLE IF EXISTS num;
CREATE TABLE num (
  id SERIAL PRIMARY KEY
);

-- наполнение нужными данными
INSERT INTO num (id) VALUES
  (NULL),
  (NULL),
  (NULL),
  (NULL),
  (NULL);
 
-- скрипт самого задания
-- экспонента суммы логарифмов чисел равна произведению этих чисел
SELECT 
  exp(SUM(log(id))) as factorial
FROM 
  num;

DROP TABLE IF EXISTS num;

 