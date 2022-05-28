INSERT INTO handbook.type_history ("name") VALUES
	('чтение'),
	('создание'),
	('удаление'),
	('изменения');

INSERT INTO handbook.gender ("name") VALUES
	('мужской'),
	('женский');

INSERT INTO handbook."event" ("name", description) VALUES
	('click', 'событие происходящие при клике левой кнопки мыши'), 
	('focus', 'событие происходящие когда элемент получил фокус');

INSERT INTO handbook.typevar ("name") VALUES('int');
INSERT INTO handbook.typevar ("name") VALUES('string');
INSERT INTO handbook.typevar ("name") VALUES('boolean');
INSERT INTO handbook.typevar ("name") VALUES('object');
INSERT INTO handbook.typevar ("name") VALUES('array');
