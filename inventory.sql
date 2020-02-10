DROP DATABASE IF EXISTS inventory;
CREATE DATABASE inventory;
USE inventory;

DROP TABLE IF EXISTS fed_district;
CREATE TABLE fed_district (
	id tinyint UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
	name VARCHAR(255),
	short_name VARCHAR(4)
) COMMENT 'федеральный округа';

DROP TABLE IF EXISTS branches;
CREATE TABLE branches (
	id tinyint UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
	name VARCHAR(50),
	federal_id tinyint UNSIGNED NOT NULL COMMENT 'код федерального округа',
	FOREIGN KEY (federal_id) REFERENCES fed_district(id)
) COMMENT 'филиал';

DROP TABLE IF EXISTS `position`;
CREATE TABLE `position` (
	id tinyint UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
	name VARCHAR(100)
) COMMENT 'должность';

DROP TABLE IF EXISTS division;
CREATE TABLE division (
	id tinyint UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
	name VARCHAR(100),
	short_name VARCHAR(10)
) COMMENT 'отдел';

DROP TABLE IF EXISTS employee;
CREATE TABLE employee (
	id SERIAL PRIMARY KEY, -- SERIAL = BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE
    firstname VARCHAR(50),
    middlename VARCHAR(50),
    lastname VARCHAR(50),
    gender CHAR(1),
    birthday DATE,
    pos_id tinyint UNSIGNED NOT NULL COMMENT 'должность',
    division_id tinyint UNSIGNED NOT NULL COMMENT 'отдел',
    branch_id tinyint UNSIGNED NOT NULL COMMENT 'код филиала',
    email VARCHAR(120) UNIQUE,
    phone INT COMMENT 'внутренний номер формата 7хххххххх',
    `status` ENUM('active', 'fired', 'maternity leave'),
    created_at DATETIME DEFAULT NOW(),
    fired_at DATE DEFAULT NULL,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX users_phone_idx(phone),
    INDEX users_firstname_lastname_idx(firstname, lastname),
    FOREIGN KEY (branch_id) REFERENCES branches(id),
    FOREIGN KEY (pos_id) REFERENCES `position`(id),
    FOREIGN KEY (division_id) REFERENCES division(id)
) COMMENT 'сотрудник';

DROP TABLE IF EXISTS office_type;
CREATE TABLE office_type (
	id tinyint UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
	`type` VARCHAR(50)
) COMMENT 'вид подразделения';

DROP TABLE IF EXISTS offices;
CREATE TABLE offices (
	id int UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
	address VARCHAR(255),
	branch_id tinyint UNSIGNED NOT NULL COMMENT 'код филиала',
	office_type_id tinyint UNSIGNED NOT NULL COMMENT 'вид подразделения',
	FOREIGN KEY (branch_id) REFERENCES branches(id),
	FOREIGN KEY (office_type_id) REFERENCES office_type(id)
) COMMENT 'офис';

DROP TABLE IF EXISTS inventory_status;
CREATE TABLE inventory_status (
	id tinyint UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
	`status` VARCHAR(20)
) COMMENT 'статус техники';

DROP TABLE IF EXISTS buh_inventory;
CREATE TABLE buh_inventory (
	id SERIAL PRIMARY KEY,
    inv_num VARCHAR(20) NOT NULL UNIQUE COMMENT 'инвентарный номер',
    name VARCHAR(50) COMMENT 'наименование по бухгалтерии',
    buy_date DATE COMMENT 'дата постановки на учёт',
    office_id int UNSIGNED NOT NULL COMMENT 'местоположение техники',
    employee_id bigint UNSIGNED COMMENT 'ответственный сотрудник',
    status_id tinyint UNSIGNED NOT NULL COMMENT 'статус техники',
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX inv_num_idx(inv_num),    
    FOREIGN KEY (office_id) REFERENCES offices(id),
    FOREIGN KEY (employee_id) REFERENCES employee(id),
    FOREIGN KEY (status_id) REFERENCES inventory_status(id)
) COMMENT 'список техники по бухгалтерским документам';

DROP TABLE IF EXISTS tech_type;
CREATE TABLE tech_type (
	id tinyint UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
	name VARCHAR(100)
) COMMENT 'тип техники';

DROP TABLE IF EXISTS model;
CREATE TABLE model (
	id int UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
	mfr VARCHAR(50) COMMENT 'производитель',
	name VARCHAR(100) COMMENT 'наименование',
	partnum VARCHAR(50) COMMENT 'партномер'
) COMMENT 'модель техники';

DROP TABLE IF EXISTS it_inventory;
CREATE TABLE it_inventory (
	tech_id SERIAL PRIMARY KEY,
    type_id tinyint UNSIGNED NOT NULL COMMENT 'тип техники',
    model_id int UNSIGNED NOT NULL COMMENT 'модель',
    serialnum VARCHAR(50) COMMENT 'серийный номер',
    -- для сетевых устройств
    mac VARCHAR(12) COMMENT 'MAC адрес',
    ipv4_addr VARCHAR(15) COMMENT 'IP адрес',
    net_name VARCHAR(13) COMMENT 'Сетевое имя',
    FOREIGN KEY (type_id) REFERENCES tech_type(id),
    FOREIGN KEY (model_id) REFERENCES model(id),
    FOREIGN KEY (tech_id) REFERENCES buh_inventory(id)
    	ON UPDATE CASCADE
    	ON DELETE restrict
) COMMENT 'список техники для нужд Подразделения ИТ';

INSERT INTO fed_district VALUES
  (01, 'Центральный федеральный округ', 'ЦФО'),
  (02, 'Северо-Западный федеральный округ', 'СЗФО'),
  (03, 'Южный федеральный округ', 'ЮФО'),
  (04, 'Приволжский федеральный округ', 'ПФО'),
  (05, 'Уральский федеральный округ', 'УФО'),
  (06, 'Сибирский федеральный округ', 'СФО'),
  (07, 'Дальневосточный федеральный округ', 'ДВФО'),
  (08, 'Головной офис', 'ГО');
 
INSERT INTO branches VALUES
  (01, 'Адыгейский филиал', 03),
  (02, 'Башкирский филиал', 04),
  (03, 'Бурятский филиал', 06),
  (04, 'Алтайский филиал', 06),
  (05, 'Дагестанский филиал', 03),
  (06, 'Ингушетский филиал', 03),
  (07, 'Кабардино-Балкарский филиал', 03),
  (08, 'Калмыцский филиал', 03),
  (09, 'Карачаево-Черкесский филиал', 03),
  (10, 'Карельский филиал', 02),
  (11, 'Комский филиал', 02),
  (12, 'МарийЭлский филиал', 04),
  (13, 'Мордовский филиал', 04),
  (14, 'Якутский филиал', 07),
  (15, 'Северо-Осетинский филиал', 03),
  (16, 'Татарский филиал', 04),
  (17, 'Тывский филиал', 06),
  (18, 'Удмуртский филиал', 04),
  (19, 'Хакасский филиал', 06),
  (21, 'Чувашский филиал', 04),
  (77, 'Головной офис', 08);
  
INSERT INTO `position`(name) VALUES
  ('Директор'),
  ('Заместитель директора по розничным продажам'),
  ('Заместитель директора по корпоративным продажам'),
  ('Заместитель директора по корпоративной безопасности'),
  ('Администратор'),
  ('Секретарь'),
  ('Системный администратор'),
  ('Руководитель отдела'),
  ('Специалист'),
  ('Ведущий специалист'),
  ('Главный специалист'),
  ('Водитель'),
  ('Врач-эксперт');

INSERT INTO division (name, short_name) VALUES
  ('Административное подразделение', 'АП'),
  ('Подразделение ИТ', 'ПИТ'),
  ('Отдел розничных продаж', 'ОРП'),
  ('Отдел корпоративных продаж', 'ОКП'),
  ('Отдел партнерских продаж', 'ОПП'),
  ('Отдел урегулирования убытков по имущественным видам страхования', 'ОУУпоИВС'),
  ('Отдел урегулирования убытков по личным видам страхования', 'ОУУпоЛВС'),
  ('Отдел развития личного страхования', 'ОРЛС'),
  ('Отдел финансово-кассового обслуживания', 'ОФКО');

INSERT INTO employee
	(firstname, middlename, lastname, gender, birthday, pos_id, division_id, branch_id, email, phone, `status`, created_at, fired_at, updated_at) 
VALUES
	('Javon', 'et', 'Beer', 'm', '1988-10-23', 1, 1, 1, 'callie35@example.net', 700000167, 'active', '2018-10-06 21:20:24', null, '1979-10-23 15:14:39'),
	('Aletha', 'ipsum', 'O\'Hara', 'f', '1974-02-03', 2, 1, 1, 'estefania.carroll@example.org', null, 'fired', '1981-12-20 18:26:35', '1970-10-03', '1989-06-03 11:18:14'),
	('Laverna', 'consequatur', 'Blick', 'f', '1988-01-30', 3, 1, 1, 'alexandre.abernathy@example.org', 700000019, 'active', '1995-10-15 21:53:02', null, '1999-02-05 02:00:33'),
	('Bret', 'aut', 'Rath', 'f', '2012-07-17', 4, 1, 1, 'lacy.moen@example.net', null, 'fired', '2012-12-25 11:40:44', '1997-06-21', '0000-00-00 00:00:00'),
	('Keaton', 'voluptas', 'Rolfson', 'm', '1995-09-24', 5, 1, 1, 'bailee13@example.net', 700000059, 'active', '1973-01-24 06:08:03', null, '0000-00-00 00:00:00'),
	('Donald', 'sit', 'Hermiston', 'm', '2003-06-28', 6, 1, 1, 'adam.block@example.org', 700000171, 'active', '1976-12-10 21:28:06', null, '0000-00-00 00:00:00'),
	('Vella', 'dicta', 'Schmitt', 'f', '1980-05-15', 7, 2, 1, 'stanton.eliezer@example.net', 700000189, 'active', '1979-06-13 02:40:17', null, '0000-00-00 00:00:00'),
	('Alvah', 'consequatur', 'McClure', 'm', '2001-04-24', 8, 3, 1, 'murazik.tristin@example.com', 700000192, 'active', '2009-05-29 05:45:14', null, '2002-03-05 01:29:59'),
	('Judah', 'neque', 'Towne', 'm', '2009-12-03', 10, 3, 1, 'baumbach.rowena@example.com', null, 'fired', '1983-12-17 05:53:24', '2004-09-28', '0000-00-00 00:00:00'),
	('Sage', 'ab', 'Dickinson', 'f', '1970-10-22', 10, 3, 1, 'qcartwright@example.net', null, 'fired', '1998-12-31 07:58:24', '1978-05-31', '1984-07-08 03:53:20'),
	('Dalton', 'ut', 'Waelchi', 'm', '2000-06-13', 8, 4, 1, 'jake.waters@example.net', 700000149, 'active', '1970-03-16 16:19:36', null, '0000-00-00 00:00:00'),
	('Cali', 'nisi', 'Kiehn', 'f', '2010-05-23', 12, 3, 1, 'mac.hyatt@example.net', 700000114, 'active', '1983-04-12 21:29:08', null, '0000-00-00 00:00:00'),
	('Jonatan', 'sequi', 'Runolfsdottir', 'm', '1976-08-30', 13, 4, 1, 'angelica.schroeder@example.com', 700000092, 'active', '1987-06-04 22:42:09', null, '2001-03-31 22:41:21'),
	('Kira', 'non', 'Willms', 'f', '2004-07-28', 9, 4, 1, 'elian52@example.org', null, 'fired', '1990-04-20 15:26:36', '2013-01-18', '0000-00-00 00:00:00'),
	('Rosina', 'sapiente', 'Walsh', 'f', '2005-01-24', 10, 6, 1, 'nat.nitzsche@example.net', 700000073, 'active', '1998-03-06 23:23:47', null, '1994-10-09 08:04:33'),
	('Tate', 'voluptatem', 'Morar', 'f', '2002-04-27', 10, 7, 1, 'wwolf@example.com', 700000157, 'active', '2017-11-21 22:15:43', null, '0000-00-00 00:00:00'),
	('Christian', 'voluptas', 'Collins', 'm', '1980-02-01', 4, 4, 1, 'mcdermott.tito@example.com', null, 'fired', '1976-08-05 11:55:16', '2010-12-24', '2003-12-01 10:08:42'),
	('Dena', 'corporis', 'Mosciski', 'f', '1988-05-15', 5, 9, 1, 'lulu78@example.net', 700000058, 'active', '2005-05-22 21:19:49', null, '2000-04-20 04:23:01'),
	('Filomena', 'rem', 'Ruecker', 'f', '1976-04-06', 6, 5, 1, 'qadams@example.org', null, 'fired', '1975-03-12 15:23:07', '1996-05-02', '2015-12-26 21:50:56'),
	('Jennifer', 'a', 'Ward', 'f', '1971-12-15', 8, 6, 1, 'mraz.brice@example.net', 700000099, 'active', '1999-06-15 03:04:49', null, '0000-00-00 00:00:00'),
	('Lurline', 'cupiditate', 'Larkin', 'f', '2005-02-02', 8, 5, 1, 'nmonahan@example.net', null, 'fired', '1999-02-19 06:49:25', '1992-10-11', '1982-11-15 05:30:30'),
	('Judd', 'assumenda', 'Barton', 'f', '2011-08-10', 9, 4, 1, 'bianka.cremin@example.com', 700000162, 'active', '1979-11-12 18:06:45', null, '1984-02-09 02:38:26'),
	('Breanne', 'in', 'Hermann', 'f', '2013-12-15', 10, 5, 1, 'vlynch@example.net', 700000158, 'active', '1981-02-03 01:25:41', null, '1975-05-09 01:54:22'),
	('Amy', 'rem', 'Nicolas', 'f', '1979-04-21', 11, 4, 1, 'krajcik.elta@example.com', null, 'fired', '2019-12-22 06:14:47', '1981-04-09', '0000-00-00 00:00:00'),
	('Lessie', 'et', 'Schimmel', 'f', '2005-03-30', 12, 4, 1, 'heloise.kuvalis@example.net', null, 'maternity leave', '1999-05-12 15:28:35', null, '2017-03-03 15:08:54'),
	('Jerome', 'quo', 'Carroll', 'm', '1987-11-08', 13, 8, 1, 'prince.dare@example.org', 700000079, 'active', '2015-09-19 05:51:58', null, '2010-12-17 07:54:02'),
	('Birdie', 'et', 'Bosco', 'f', '2008-02-03', 11, 9, 1, 'naomi90@example.org', 700000191, 'active', '1986-08-05 12:58:27', null, '0000-00-00 00:00:00'),
	('Brielle', 'deleniti', 'Mertz', 'f', '1988-01-14', 2, 3, 1, 'fwisozk@example.net', 700000089, 'active', '1982-06-07 04:11:24', null, '1985-05-12 14:24:18'),
	('Owen', 'in', 'Moen', 'm', '1972-11-21', 9, 5, 1, 'kdoyle@example.com', 700000196, 'active', '2005-01-19 04:28:35', null, '0000-00-00 00:00:00'),
	('Madisyn', 'doloremque', 'Koch', 'f', '1973-05-04', 11, 3, 1, 'sbeatty@example.com', null, 'fired', '1980-07-12 11:41:45', '1972-01-12', '2008-03-17 16:11:49')
;

INSERT INTO office_type (`type`) VALUES
  ('Головной офис'),
  ('Дополнительный офис'),
  ('Отделение'),
  ('Удаленное рабочее место'),
  ('Точка продаж'),
  ('Агент')
;

INSERT INTO offices (address, branch_id, office_type_id) VALUES
  ('РА, г.Майкоп, ул. 12 марта, 3', 1, 1),
  ('РА, г.Майкоп, ул. Некрасова, 293', 1, 4)
;

INSERT INTO inventory_status (`status`) VALUES
  ('эксплуатация'),
  ('на складе'),
  ('сломано'),
  ('списано'),
  ('утилизировано'),
  ('продано')
;

INSERT INTO buh_inventory
	(inv_num, name, buy_date, office_id, employee_id, status_id) 
VALUES
	('01-00000101', 'Системный блок  HP600G4', '2018-09-12', 1, 1, 1),
	('01-00000102', 'Монитор  HP22"', '2018-09-12', 1, 1, 1),
	('01-00000103', 'Системный блок  HP600G4', '2018-09-12', 1, 3, 1),
	('01-00000104', 'Монитор  HP22"', '2018-09-12', 1, 3, 1),
	('01-00000105', 'Системный блок  HP600G4', '2018-09-12', 1, 5, 1),
	('01-00000106', 'Монитор  HP22"', '2018-09-12', 1, 5, 1),
	('01-00000107', 'Системный блок  HP600G4', '2018-09-12', 1, 6, 1),
	('01-00000108', 'Монитор  HP22"', '2018-09-12', 1, 6, 1),
	('01-00000109', 'Системный блок  HP600G4', '2018-09-12', 1, 7, 1),
	('01-00000110', 'Монитор  HP22"', '2018-09-12', 1, 7, 1),
	('01-00000111', 'Системный блок  HP600G4', '2018-09-12', 1, 8, 1),
	('01-00000112', 'Монитор  HP22"', '2018-09-12', 1, 8, 1),
	('01-00000113', 'Системный блок  HP600G4', '2018-09-12', 1, 11, 1),
	('01-00000114', 'Монитор  HP22"', '2018-09-12', 1, 11, 1),
	('01-00000115', 'Системный блок  HP600G4', '2018-09-12', 1, 12, 1),
	('01-00000116', 'Монитор  HP22"', '2018-09-12', 1, 12, 1),
	('01-00000117', 'Системный блок  HP600G4', '2018-09-12', 1, 15, 1),
	('01-00000118', 'Монитор  HP22"', '2018-09-12', 1, 15, 3),
	('01-00000119', 'Системный блок  HP600G4', '2018-09-12', 1, 16, 3),
	('01-00000120', 'Монитор  HP22"', '2018-09-12', 1, 16, 1),
	('01-00000121', 'Системный блок  HP600G4', '2018-09-12', 1, 18, 1),
	('01-00000122', 'Монитор  HP22"', '2018-09-12', 1, 18, 1),
	('01-00000123', 'МФУ HP LJ 426', '2018-09-12', 1, 20, 1),
	('01-00000124', 'МФУ HP LJ 426', '2019-09-12', 1, 22, 2),
	('01-00000125', 'МФУ HP LJ 426', '2017-09-12', 2, 23, 1),
	('01-00000126', 'Сервер HP Proliant D380GLG6', '2018-09-12', 1, 1, 1),
	('01-00000127', 'Системный блок  HP600G4', '2018-09-12', 2, 28, 1),
	('01-00000128', 'Монитор  HP22"', '2018-09-12', 2, 28, 1)
;

INSERT INTO model (mfr, name, partnum) VALUES
  ('HP', 'HP ProDesk 600 G4', '3XW93EA'),
  ('HP', 'HP 22er', 'T3M72AA#ABA'),
  ('HP', 'HP LaserJet Pro M426fdn', 'F6W17A'),
  ('HP', 'HP ProLiant DL380 G6', '491324-421')
 ;

INSERT INTO tech_type (name) VALUES
  ('Серверное оборудование.сервер'),
  ('Серверное оборудование.ИБП'),
  ('Серверное оборудование.система резервного копирования'),
  ('Сетевое оборудование.коммутатор'),
  ('Сетевое оборудование.маршрутизатор'),
  ('Сетевое оборудование.модем'),
  ('Сетевое оборудование.USB-модем'),
  ('Компьютерное оборудование.Системный блок'),
  ('Компьютерное оборудование.Мониор'),
  ('Компьютерное оборудование.Ноутбук'),
  ('Компьютерное оборудование.Моноблок'),
  ('Компьютерное оборудование.ИБП'),
  ('Оргтехника.МФУ монохромный'),
  ('Оргтехника.МФУ цветной'),
  ('Оргтехника.принтер монохромный'),
  ('Оргтехника.принтер цветной'),
  ('Оргтехника.сканер планшетный'),
  ('Оргтехника.сканер поточный'),
  ('Оргтехника.уничтожитель бумаги'),
  ('Телефония.Телефон'),
  ('Телефония.мобильный телефон'),
  ('Телефония.Факс'),
  ('Телефония.АТС'),
  ('Прочее.фотоаппарат'),
  ('Прочее.телевизор'),
  ('Прочее.проектор')
;

INSERT INTO it_inventory (type_id, model_id, serialnum, mac, ipv4_addr, net_name) VALUES
  (8, 1, 'CZC156783V2', '013576ABF321', '192.168.1.100', 'W00-0100-0101'),
  (9, 2, 'CVB3214BG45', NULL, NULL, NULL),
  (8, 1, 'CZC156783V3', '013576ABF322', '192.168.1.101', 'W00-0100-0002'),
  (9, 2, 'CVB3214BG45', NULL, NULL, NULL),
  (8, 1, 'CZC156783V4', '013576ABF323', '192.168.1.102', 'W00-0100-0002'),
  (9, 2, 'CVB3214BG45', NULL, NULL, NULL),
  (8, 1, 'CZC156783V5', '013576ABF324', '192.168.1.103', 'W00-0100-0003'),
  (9, 2, 'CVB3214BG45', NULL, NULL, NULL),
  (8, 1, 'CZC156783V6', '013576ABF325', '192.168.1.104', 'W00-0100-0004'),
  (9, 2, 'CVB3214BG45', NULL, NULL, NULL),
  (8, 1, 'CZC156783V7', '013576ABF326', '192.168.1.105', 'W00-0100-0005'),
  (9, 2, 'CVB3214BG45', NULL, NULL, NULL),
  (8, 1, 'CZC156783V8', '013576ABF327', '192.168.1.106', 'W00-0100-0006'),
  (9, 2, 'CVB3214BG45', NULL, NULL, NULL),
  (8, 1, 'CZC156783V9', '013576ABF328', '192.168.1.107', 'W00-0100-0007'),
  (9, 2, 'CVB3214BG45', NULL, NULL, NULL),
  (8, 1, 'CZC156783C2', '013576ABF329', '192.168.1.108', 'W00-0100-0008'),
  (9, 2, 'CVB3214BG45', NULL, NULL, NULL),
  (8, 1, 'CZC156783C3', '013576ABF320', '192.168.1.109', 'W00-0100-0009'),
  (9, 2, 'CVB3214BG45', NULL, NULL, NULL),
  (8, 1, 'CZC156783C4', '013576ABF32A', '192.168.1.110', 'W00-0100-0010'),
  (9, 2, 'CVB3214BG45', NULL, NULL, NULL),
  (13, 3, 'CZB159993V2', '013551ABF321', '192.168.1.111', 'P00-0100-0001'),
  (13, 3, 'CZB159993V3', '013551ABF331', '192.168.1.112', 'P00-0100-0002'),
  (13, 3, 'CZB159993V4', '013551ABF341', '192.168.1.113', 'P00-0100-0003'),
  (1, 4, 'HVB156783C4', '45B676ABF321', '192.168.1.2', 'S00-0100-0001'),
  (8, 1, 'CZC156783C5', '013576ABF32A', '192.168.1.114', 'W00-0100-0011'),
  (9, 2, 'CVB3215BG45', NULL, NULL, NULL)
 ;