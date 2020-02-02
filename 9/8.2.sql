/*
2. В таблице products есть два текстовых поля: name с названием товара и description
с его описанием. Допустимо присутствие обоих полей или одно из них. Ситуация,
когда оба поля принимают неопределенное значение NULL неприемлема. Используя триггеры,
добейтесь того, чтобы одно из этих полей или оба поля были заполнены.
При попытке присвоить полям NULL-значение необходимо отменить операцию.
*/

-- создание таблиц
DROP TABLE IF EXISTS products;
CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название',
  description TEXT COMMENT 'Описание',
  price DECIMAL (11,2) COMMENT 'Цена',
  catalog_id INT UNSIGNED,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY index_of_catalog_id (catalog_id)
) COMMENT = 'Товарные позиции';

-- наполнение нужными данными
INSERT INTO products
  (name, description, price, catalog_id)
VALUES
  ('Intel Core i3-8100', 'Процессор для настольных персональных компьютеров, основанных на платформе Intel.', 7890.00, 1),
  ('Intel Core i5-7400', 'Процессор для настольных персональных компьютеров, основанных на платформе Intel.', 12700.00, 1),
  ('AMD FX-8320E', 'Процессор для настольных персональных компьютеров, основанных на платформе AMD.', 4780.00, 1),
  ('AMD FX-8320', 'Процессор для настольных персональных компьютеров, основанных на платформе AMD.', 7120.00, 1),
  ('ASUS ROG MAXIMUS X HERO', 'Материнская плата ASUS ROG MAXIMUS X HERO, Z370, Socket 1151-V2, DDR4, ATX', 19310.00, 2),
  ('Gigabyte H310M S2H', 'Материнская плата Gigabyte H310M S2H, H310, Socket 1151-V2, DDR4, mATX', 4790.00, 2),
  ('MSI B250M GAMING PRO', 'Материнская плата MSI B250M GAMING PRO, B250, Socket 1151, DDR4, mATX', 5060.00, 2);

-- скрипт самого задания
DELIMITER //

DROP TRIGGER IF EXISTS products_check_update//
CREATE TRIGGER products_check_update BEFORE UPDATE ON products
FOR EACH ROW
BEGIN
  if (NEW.name is null and NEW.description is null) then
	SET NEW.name = COALESCE(NEW.name, OLD.name);
    SET NEW.description = COALESCE(NEW.description, OLD.description);
  end if; 
END//

DROP TRIGGER IF EXISTS products_check_ins// 
CREATE TRIGGER products_check before insert on products
for each row
BEGIN
	DECLARE msg varchar(255);
	if (NEW.name is null and NEW.description is null) then
      SET msg = 'Оба поля не могут быть Null';
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg; 
    end if;
END//

DELIMITER ;

UPDATE products SET 
name=null, description=null
WHERE id=2;

UPDATE products SET 
name='AMD FX-8320E(новый)', description=null
WHERE id=3;

INSERT INTO products
  (name, description, price, catalog_id)
VALUES
  (null, 'Атом', 500.00, 1),
  (NULL, NULL, 7890.00, 3);
 
INSERT INTO products
  (name, description, price, catalog_id)
VALUES
  (null, 'Атом', 500.00, 1);
 
select * from products p;
