/*
2.(по желанию) Создайте SQL-запрос, который помещает в таблицу users миллион записей.
*/
-- создание таблиц
DROP TABLE IF EXISTS samples;
create table samples (
	id serial primary key,
	name varchar(255) comment 'Имя покупателя',
	birthday_at DATE comment 'Дата рождения',
	created_at datetime default current_timestamp,
	updated_at datetime default current_timestamp on update current_timestamp
) comment = 'Покупатели';

-- наполнение нужными данными
INSERT INTO samples (name, birthday_at) VALUES
  ('Геннадий', '1990-10-05'),
  ('Наталья', '1984-11-12'),
  ('Александр', '1985-05-20'),
  ('Сергей', '1988-02-14'),
  ('Иван', '1998-01-12'),
  ('Мария', '1992-08-29'),
  ('Аркадий', '1984-03-17'),
  ('Ольга', '1985-07-10'),
  ('Владимир', '1988-06-12'),
  ('Екатерина', '1992-09-20');

-- скрипт самого задания
insert into
	users (name, birthday_at)
 select
	fst.name,
	fst.birthday_at
from
	samples as fst,
	samples as snd,
	samples as thd,
	samples as fth,
	samples as fif,
	samples as sth;

select count(*) from users;
