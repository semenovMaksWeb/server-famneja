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

// изменяемая зона

const  bd = {
    user: 'postgres',
    host: '127.0.0.1',
    database: 'test',
    port: 5432,
    password: 'postgres',
}
const table_1 = {
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

const config = {
   bd: bd,
    screen: {
        url: "/",
        id_right: null // или null или id право которое уже есть в бд!
    },
    components: [
        table_1,
        table_2
    ]
};

// изменяемая зона
module.exports = config;