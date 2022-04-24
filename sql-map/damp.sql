INSERT INTO component (name, description) VALUES
    ('table', 'Компонент таблица'),
    ('button', 'Компонент кнопка'),
    ('container', 'Компонент контейнер'),
    ('form', 'Компонент форма');
    ('fieldset', 'Компонент группировка элементов (используется в форме)'),
    ('input', 'Компонент ввод значение (используется в форме)'),
    ('select', 'Компонент выплывающий список (используется в форме)'),
    ('rows', 'Компонент с дублирующимися элементами (используется в форме)'),

INSERT INTO typevar (name) VALUES
    ('int'),
    ('string'),
    ('boolean'),
    ('object'),
    ('array');



 INSERT INTO params
    (name, req, description, type) VALUES
        ('id', true, 'уникальное значение', (select id from typevar where "name" = 'int') ),
        ('name', false, 'имя/заголовок компонента', (select id from typevar where "name" = 'string')),
        ('title', false, 'хинт у компонента', (select id from typevar where "name" = 'string')),
        ('text', false, 'текст у компонента', (select id from typevar where "name" = 'string')),
        ('screen_visible', true, 'показывает является ли компонент потомком скрина', (select id from typevar where "name" = 'boolean')),

        ('key_main', true, 'колонка с уникальными значениями в таблице', (select id from typevar where "name" = 'string') ),
        ('checkbox_td', false, 'указывает есть ли checkbox у таблицы', (select id from typevar where "name" = 'boolean')),
        ('type_table', true, 'указывает тип таблицы (клиент/сервер)', (select id from typevar where "name" = 'string'))    

        ('errors', false, 'служебная переменная ошибки для form', (select id from typevar where "name" = 'object')),
        ('values', false, 'служебная переменная значении для form', (select id from typevar where "name" = 'object')),

        ('url', false, 'url-адрес', (select id from typevar where "name" = 'string'))
        ('children', false, 'массив потомков', (select id from typevar where "name" = 'array'))

        ('type', false, 'указывает тип чего либо', (select id from typevar where "name" = 'string')),
        ('page', false, 'указывает номер страницы по дефолту', (select id from typevar where "name" = 'int')),
        ('limit', false, 'указывает количество элементов на странице', (select id from typevar where "name" = 'int')),
        ('arrows_pagination', false, 'показывает нужны ли кнопки вперед/назад в пагинации', (select id from typevar where "name" = 'boolean')),

INSERT INTO component_rule
    (id_params, id_component, url, "default") VALUES
        ((select id from params where  "name" = 'id'), null, null, true),
        ((select id from params where  "name" = 'screen_visible'), null, null, true),
        ((select id from params where  "name" = 'name'), null, null, true),
        ((select id from params where  "name" = 'title'), null, null, true),

        ((select id from params where  "name" = 'type'), (select id from component where  "name" = 'table'), 'paginator', null),
        ((select id from params where  "name" = 'page'), (select id from component where  "name" = 'table'), 'paginator', null),
        ((select id from params where  "name" = 'limit'), (select id from component where  "name" = 'table'), 'paginator', null),
        ((select id from params where  "name" = 'arrows_pagination'), (select id from component where  "name" = 'table'), 'paginator', null),  
        ((select id from params where  "name" = 'key_main'), (select id from component where  "name" = 'table'), null, null),
        ((select id from params where  "name" = 'type_table'), (select id from component where  "name" = 'table'), null, null),
        ((select id from params where  "name" = 'checkbox_td'), (select id from component where  "name" = 'table'), null, null)

        ((select id from params where  "name" = 'url'), (select id from component where  "name" = 'button'), 'icons', null)
        ((select id from params where  "name" = 'text'), (select id from component where  "name" = 'button'), null, null)

        ((select id from params where  "name" = 'children'), (select id from component where  "name" = 'container'), null, null)
