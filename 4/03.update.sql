/* Задача 3
Написать скрипт, отмечающий несовершеннолетних пользователей как неактивных (поле is_active = true).
При необходимости предварительно добавить такое поле в таблицу profiles со значением по умолчанию = false (или 0)
*/

USE vk;

-- создание таблиц

-- наполнение нужными данными

-- скрипт самого задания
-- добавление столбца is_active, значение по умолчанию = false

/*DELIMITER $$
CREATE PROCEDURE Alter_Table()
BEGIN
    DECLARE _count INT;
    SET _count = (  SELECT COUNT(*) 
                    FROM INFORMATION_SCHEMA.COLUMNS
                    WHERE   TABLE_NAME = 'profiles' AND 
                            COLUMN_NAME = 'is_active');
    IF _count = 0 THEN
        ALTER TABLE profiles
            ADD is_active BOOL DEFAULT FALSE NULL;
    END IF;
END $$
DELIMITER ;*/ -- не сработало

SET @s = (SELECT IF(
    (SELECT COUNT(*)
        FROM INFORMATION_SCHEMA.COLUMNS
        WHERE table_name = 'profiles'
        AND table_schema = DATABASE()
        AND column_name = 'is_active'
    ) > 0,
    "SELECT 1",
    "ALTER TABLE profiles ADD is_active BOOL DEFAULT FALSE NULL"
));

PREPARE stmt FROM @s;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- скрипт отмечающий совершеннолетних пользователей как активных (поле is_active = true)
UPDATE profiles SET is_active=true
WHERE ((YEAR(CURRENT_DATE) - YEAR(birthday)) - (DATE_FORMAT(CURRENT_DATE, '%m%d') < DATE_FORMAT(birthday, '%m%d'))) > 18;



