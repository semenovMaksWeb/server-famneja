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
 
const form_1  = {
    id_component: "form",
    class: null,
    style: null,
    id_parent: null, //  указывает тэг а не id для получение по ссылки
    id_rights: null, // id права
    tag: "bxod_form",
    params:{
        values: '{"login": "", "password": ""}',
        errors: '{"login": "", "password": ""}',
    },
    schema_form:[
        {
            id_parent: null,
            id_components: 'bxod_fieldset'
        },
        {
            id_parent: "bxod_fieldset",
            id_components: 'bxod_input_login'
        },
        {
            id_parent: "bxod_fieldset",
            id_components: 'bxod_input_password'
        },
        {
            id_parent: "bxod_fieldset",
            id_components: 'bxod_button_ok'
        },
    ]
}
const fieldset_1  = {
    id_component: "fieldset",
    class: null,
    style: null,
    id_parent: null, //  указывает тэг а не id для получение по ссылки
    id_rights: null, // id права
    tag: "bxod_fieldset",
    order: 1,
}

const button_ok  = {
    id_component: "button",
    class: null,
    style: null,
    id_parent: null, //  указывает тэг а не id для получение по ссылки
    id_rights: null, // id права
    tag: "bxod_button_ok",
    order: 1,
}


const input_login  = {
    id_component: "input",
    class: null,
    style: null,
    id_parent: null, //  указывает тэг а не id для получение по ссылки
    id_rights: null, // id права
    tag: "bxod_input_login",
    order: 1,
}

const input_password  = {
    id_component: "input",
    class: null,
    style: null,
    id_parent: null, //  указывает тэг а не id для получение по ссылки
    id_rights: null, // id права
    tag: "bxod_input_password",
    order: 2,
}

const  bd = {
    user: 'postgres',
    host: '127.0.0.1',
    database: 'famneja_test',
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
        fieldset_1,
        input_password,
        input_login,
        button_ok,
        form_1,
    ]
};

// изменяемая зона
module.exports = config;