/*
1. Создайте хранимую функцию hello(), которая будет возвращать приветствие,
в зависимости от текущего времени суток. С 6:00 до 12:00 функция должна возвращать
фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать фразу "Добрый день",
с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".
*/

-- создание таблиц


-- наполнение нужными данными


-- скрипт самого задания
DELIMITER //

DROP FUNCTION IF EXISTS hello//
CREATE FUNCTION hello (t TIME)
RETURNS VARCHAR(12) DETERMINISTIC
BEGIN
  DECLARE say varchar (12);
  CASE
    WHEN (t >='06:00:00' AND t <'12:00:00')
    THEN SET say = 'Доброе утро';
    WHEN (t >='12:00:00' AND t <'18:00:00')
    THEN SET say = 'Добрый день';
    WHEN (t >='18:00:00' AND t <='23:59:59')
    THEN SET say = 'Добрый вечер';
    ELSE SET say = 'Доброй ночи';
  end CASE;
  RETURN say;
END//

SELECT hello('07:00:55')//
SELECT hello('14:30:07')//
SELECT hello('23:50:00')//
SELECT hello('00:00:00')//
SELECT hello(CURTIME())//