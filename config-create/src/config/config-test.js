const type_api = {
    get: "get",
    post: "post",
    delete: "delete",
    put: "put"
}
const  bd = {
    user: 'postgres',
    host: '127.0.0.1',
    database: 'test',
    port: 5432,
    password: 'postgres',
}
const table_1 = {
    api:{
        url: "", // api до бэка
        type: type_api.post,// type запроса
        tag: "table_2"  //  указывает тэг а не id для получение по ссылки
    },
    id_component: "table",
    class: null,
    style: null,
    id_parent: "table_1", //  указывает тэг а не id для получение по ссылки
    id_rights: null, // id права
    tag: "table_4"
}

const config = {
   bd: bd,
    screen: {
        url: "/",
        id_right: null // или null или id право которое уже есть в бд!
    },
    components: [
        table_1,
    ]
};
module.exports = config;