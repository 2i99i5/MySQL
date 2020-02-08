/*
Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах users,
catalogs и products в таблицу logs помещается время и дата создания записи,
название таблицы, идентификатор первичного ключа и содержимое поля name.
*/
-- создание таблиц
DROP TABLE IF EXISTS logs;
create table logs (
	tablename VARCHAR(255) COMMENT 'Название таблицы',
	external_id INT COMMENT 'Первичный ключ таблицы tablename',
	name VARCHAR(255) COMMENT 'Поле name таблицы tablename',
	created_at DATETIME default current_timestamp
) COMMENT = 'Журнал интернет-магазина' ENGINE=Archive;

-- наполнение нужными данными


-- скрипт самого задания
DELIMITER //
DROP trigger IF EXISTS log_after_insert_to_users//
create trigger log_after_insert_to_users after insert on users
for each row begin
	insert into logs (tablename, external_id, name) values ('users', new.id, new.name);
end//
DROP trigger IF EXISTS log_after_insert_to_catalogs//
create trigger log_after_insert_to_catalogs after insert on catalogs
for each row begin
	insert into logs (tablename, external_id, name) values ('catalogs', new.id, new.name);
end//
DROP trigger IF EXISTS log_after_insert_to_products//
create trigger log_after_insert_to_products after insert on products
for each row begin
	insert into logs (tablename, external_id, name) values ('products', new.id, new.name);
end//

DELIMITER ;
INSERT INTO users (name, birthday_at) VALUES
  ('Валерий', '1990-10-05');
 
INSERT INTO products
  (name, description, price, catalog_id)
VALUES
  ('ASROCK', 'Материнская плата ASROCK, Socket 1155, DDR4, mATX', 6060.00, 2);
 
INSERT INTO catalogs VALUES
  (NULL, 'Блоки питания');
 
select * from logs;

