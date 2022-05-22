const type_api = {
    get: "get",
    post: "post",
    delete: "delete",
    put: "put"
}
const var_type = {
    int: 1,
    string: 2,
    boolean:3,
    object:4,
    array:5
}
const result = {
    all: "all",
    params: "params",
    body: "body" 
}
const event = {
    'click': 1
}   
const callback ={
    api: 1,
    delete_table_row: 2,
    reset_values_form: 3,
    add_table_row: 4,
    router_push: 5,
    update_manual: 6,
    reset_value_form_key: 7,
    add_rows_values_form: 8,
    delete_rows_values_form: 9,
    update_values_form: 10,
    refresh_table: 11,
}


// изменяемая зона
const button_1 = {
    id_component: "button",
    class: null,
    style: null,
    id_parent: null, //  указывает тэг а не id для получение по ссылки
    id_rights: null, // id права
    tag: "button_1"
 }
 const button_2 = {
    id_component: "button",
    class: null,
    style: null,
    id_parent: null, //  указывает тэг а не id для получение по ссылки
    id_rights: null, // id права
    tag: "button_2"
 }

const table_1 = {
    schema_form: [
        {
            id_parent: null,
            id_components: 'button_2'
        },
        {
            id_parent: "button_2",
            id_components: 'button_1'
        }
    ],
    schema_table:[
        {
            key: "id",
            sort: true,
            title: "уникальный ключ",
            w: 40,
            order: 1,
            button: null
        },  
        {
            key: "delete",
            sort: true,
            title: "",
            w: 40,
            order: 1,
            button: "button_1"
        },  
    ],
    event:[
        {
            id_event: event.click,
            order: 1,
            id_callback: callback.api,
            params: `{}` // есть проблема с передачей id компонента
            // id_component будет ссылка
        },
        {
            id_event: event.click,
            order: 2,
            id_callback: callback.api,
            params: `{}` // есть проблема с передачей id компонента
            // id_component будет ссылка
        }
    ],
    api:{
        url: "/table/1", // api до бэка
        type: type_api.post,// type запроса,
    },
    id_component: "table",
    class: null,
    style: null,
    id_parent: null, //  указывает тэг а не id для получение по ссылки
    id_rights: null, // id права
    tag: "table_1"
}

const table_2 = {
    event:[
        {
            id_event: event.click,
            order: 1,
            id_callback: callback.api,
            params: `{}` // есть проблема с передачей id компонента
            // id_component будет ссылка
        },
        {
            id_event: event.click,
            order: 2,
            id_callback: callback.api,
            params: `{
                "id": "$tag{table_1}"
            }` // есть проблема с передачей id компонента
            // id_component будет ссылка
        }
    ],
    api:{
        url: "", // api до бэка
        type: type_api.post,// type запроса,
        //Заполнение таблицы  element_fd
        params: [
            { 
                name_params: "id",
                result: result.params,
                type: 1,
                name: "id",
                index: 0,
                var_type: var_type.int  
            },
            { 
                name_params: "id_table_1",
                result: result.body,
                type: 2,
                name: "id",
                id_ce: "table_1", // указывает tag компонента
                var_type: var_type.int  
            },
    ] 
    },
    id_component: "table",
    class: null,
    style: null,
    id_parent: "table_1", //  указывает тэг а не id для получение по ссылки
    id_rights: null, // id права
    tag: "table_2",
    params:{
        name: "Таблица 2",
        title: "компонент",
        limit: 15,
        checkbox_td: true,
        key_main: "uuid"

    }
}


const  bd = {
    user: 'postgres',
    host: '127.0.0.1',
    database: 'test',
    port: 5432,
    password: 'postgres',
}

const config = {
   bd: bd,
    screen: {
        url: "/",
        id_right: null // или null или id право которое уже есть в бд!
    },
    components: [
        button_1,
        button_2,
        table_1,
        table_2
    ]
};

// изменяемая зона
module.exports = config;