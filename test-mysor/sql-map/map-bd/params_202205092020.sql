INSERT INTO components.params (id,name,req,"type",description) VALUES
	 (4,'id',true,1,'уникальное значение'),
	 (5,'key_main',true,2,'колонка с уникальными значениями в таблице'),
	 (6,'checkbox_td',false,3,'указывает есть ли checkbox у таблицы'),
	 (7,'screen_visible',true,3,'показывает является ли компонент потомком скрина'),
	 (8,'name',false,2,'имя/заголовок компонента'),
	 (9,'title',false,2,'хинт у компонента'),
	 (10,'text',false,2,'текст у компонента'),
	 (11,'errors',false,4,'служебная переменная ошибки для form'),
	 (12,'values',false,4,'служебная переменная значении для form'),
	 (13,'type_table',true,2,'указывает тип таблицы (клиент/сервер)');
INSERT INTO components.params (id,name,req,"type",description) VALUES
	 (14,'url',false,2,'url-адрес'),
	 (15,'children',false,5,'массив потомков'),
	 (16,'type',false,2,'указывает тип чего либо'),
	 (17,'page',false,1,'указывает номер страницы по дефолту'),
	 (18,'limit',false,1,'указывает количество элементов на странице'),
	 (19,'arrows_pagination',false,3,'показывает нужны ли кнопки вперед/назад в пагинации');