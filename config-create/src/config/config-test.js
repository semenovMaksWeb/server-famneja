const  bd = {
    user: 'postgres',
    host: '127.0.0.1',
    database: 'test',
    port: 5432,
    password: 'postgres',
}
const table_1 = {
    id_component: "table",
    class: null,
    style: null,
    id_parent: null, //  не реально указать :(
    id_rights: null, // id права
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