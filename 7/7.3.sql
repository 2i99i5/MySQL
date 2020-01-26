/*
3. (по желанию) Пусть имеется таблица рейсов flights (id, from, to)
и таблица городов cities (label, name). Поля from, to и label содержат
английские названия городов, поле name — русское. Выведите список рейсов flights
с русскими названиями городов.
*/
-- создание таблиц
DROP TABLE IF EXISTS flights;
CREATE TABLE flights (
  id SERIAL PRIMARY KEY,
  `from` VARCHAR(255),
  `to` VARCHAR(255)
) ;

DROP TABLE IF EXISTS cities;
CREATE TABLE cities (
  `label` VARCHAR(255),
  `name` VARCHAR(255)
) ;

-- наполнение нужными данными
INSERT INTO flights 
	(`from`, `to`)
VALUES
  ('moscow', 'omsk'),
  ('novgorod', 'kazan'),
  ('irkutsk', 'moscow'),
  ('omsk', 'irkutsk'),
  ('moscow', 'kazan');

INSERT INTO cities VALUES
  ('moscow','Москва'),
  ('irkutsk','Иркутск'),
  ('novgorod','Новгород'),
  ('kazan','Казань'),
  ('omsk','Омск')
 ;

-- скрипт самого задания
select 
	f.id,
	c.name as `from`,
	ci.name as `to`
from flights f
left join cities c on c.label = f.`from`
left join cities ci on ci.label = f.`to`
order by f.id
;
