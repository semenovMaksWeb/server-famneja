INSERT INTO handbook."event" ("name", description, "date") VALUES('click', 'событие происходящие при клике левой кнопки мыши', NULL);
INSERT INTO handbook."event" ("name", description, "date") VALUES('focus', 'событие происходящие когда элемент получил фокус', NULL);

INSERT INTO handbook.function_front ("name", description) VALUES('api', 'сделать запрос на бэк');
INSERT INTO handbook.function_front ("name", description) VALUES('delete_table_row', 'удалить строки с таблицы');
INSERT INTO handbook.function_front ("name", description) VALUES('reset_values_form', 'сбросить значение у всей формы');
INSERT INTO handbook.function_front ("name", description) VALUES('add_table_row', 'добавить строку в таблицу');
INSERT INTO handbook.function_front ("name", description) VALUES('router_push', 'переотправить пользователя');
INSERT INTO handbook.function_front ("name", description) VALUES('update_manual', 'перезапросить справочник');
INSERT INTO handbook.function_front ("name", description) VALUES('reset_value_form_key', 'сбросить значение у ключа формы');
INSERT INTO handbook.function_front ("name", description) VALUES('add_rows_values_form', 'добавить значение в  rows компоненте в форме');
INSERT INTO handbook.function_front ("name", description) VALUES('delete_rows_values_form', 'удалить значение в  rows компоненте в форме');
INSERT INTO handbook.function_front ("name", description) VALUES('update_values_form', 'заполнить форму данными');
INSERT INTO handbook.function_front ("name", description) VALUES('refresh_table', 'обновляет таблицу по строчно');

INSERT INTO handbook.typevar ("name") VALUES('int');
INSERT INTO handbook.typevar ("name") VALUES('string');
INSERT INTO handbook.typevar ("name") VALUES('boolean');
INSERT INTO handbook.typevar ("name") VALUES('object');
INSERT INTO handbook.typevar ("name") VALUES('array');


INSERT INTO components.component ("name", description, active) VALUES('table', 'Компонент таблица', true);
INSERT INTO components.component ("name", description, active) VALUES('button', 'Компонент кнопка', true);
INSERT INTO components.component ("name", description, active) VALUES('container', 'Компонент контейнер', true);
INSERT INTO components.component ("name", description, active) VALUES('form', 'Компонент форма', true);
INSERT INTO components.component ("name", description, active) VALUES('fieldset', 'Компонент группировка элементов (используется в форме)', true);
INSERT INTO components.component ("name", description, active) VALUES('input', 'Компонент ввод значение (используется в форме)', true);
INSERT INTO components.component ("name", description, active) VALUES('select', 'Компонент выплывающий список (используется в форме)', true);
INSERT INTO components.component ("name", description, active) VALUES('rows', 'Компонент с дублирующимися элементами (используется в форме)', true);
INSERT INTO components.component ("name", description, active) VALUES('ref_button', 'Кнопка которая является ссылкой на другой скрин', true);


INSERT INTO tes.roles ("name") VALUES('супер_пользователь');
INSERT INTO tes.roles ("name") VALUES('конфигуратор');
INSERT INTO tes.roles ("name") VALUES('разработчик');


INSERT INTO components.params ("name", req, "type", description) VALUES('name', false, 2, 'имя/заголовок компонента');
INSERT INTO components.params ("name", req, "type", description) VALUES('title', false, 2, 'хинт у компонента');
INSERT INTO components.params ("name", req, "type", description) VALUES('text', false, 2, 'текст у компонента');
INSERT INTO components.params ("name", req, "type", description) VALUES('errors', false, 4, 'служебная переменная ошибки для form');
INSERT INTO components.params ("name", req, "type", description) VALUES('values', false, 4, 'служебная переменная значении для form');
INSERT INTO components.params ("name", req, "type", description) VALUES('key_main', true, 2, 'Колонка с уникальными значениями в таблице');
INSERT INTO components.params ("name", req, "type", description) VALUES('checkbox_td', false, 3, 'Рисовать ли checkbox у таблицы');
INSERT INTO components.params ("name", req, "type", description) VALUES('type_table', true, 2, 'Тип таблицы');
INSERT INTO components.params ("name", req, "type", description) VALUES('limit', false, 1, 'Указывает количество элементов на странице');  
INSERT INTO components.params ("name", req, "type", description) VALUES('val_type', false, 2, 'Указывает тип переменной');
INSERT INTO components.params ("name", req, "type", description) VALUES('disable', false, 3, 'Заблокировать компонент');
 
INSERT INTO components.component_rule (id_params, id_component, url, "default") VALUES(1, NULL, NULL, true);
INSERT INTO components.component_rule (id_params, id_component, url, "default") VALUES(2, NULL, NULL, true);
INSERT INTO components.component_rule (id_params, id_component, url, "default") VALUES(3, NULL, NULL, true);
INSERT INTO components.component_rule (id_params, id_component, url, "default") VALUES(4, 4, NULL, false);
INSERT INTO components.component_rule (id_params, id_component, url, "default") VALUES(5, 4, NULL, false);
INSERT INTO components.component_rule (id_params, id_component, url, "default") VALUES(6, 1, NULL, false);
INSERT INTO components.component_rule (id_params, id_component, url, "default") VALUES(7, 1, NULL, false);
INSERT INTO components.component_rule (id_params, id_component, url, "default") VALUES(8, 1, NULL, false);
INSERT INTO components.component_rule (id_params, id_component, url, "default") VALUES(9, 1, NULL, false);
INSERT INTO components.component_rule (id_params, id_component, url, "default") VALUES(10, 6, NULL, false);
INSERT INTO components.component_rule (id_params, id_component, url, "default") VALUES(11, 6, NULL, false);
INSERT INTO components.component_rule (id_params, id_component, url, "default") VALUES(11, 7, NULL, false);
