const config = require('./config/config-test');

// получить фул бд
function PollBd(bd){
    const { Pool, Client } = require('pg')
    const client = new Client({
        user: bd.user,
        host: bd.host,
        database: bd.database,
        password: bd.password,
        port: bd.port
    })
    return {client};
}
//  сохранить скрин
async function screenCreate(screen, client){
    const text = 'INSERT INTO components.screen(url, id_right) VALUES($1, $2) RETURNING id';
    const values = [screen.url, screen.id_right];
    const result = await client.query(text, values);
    return result.rows[0].id;
}

// скрин + компонент
async function createComponentsScreen(id_components, id_screen, client){
    const text = 'INSERT INTO components.screen_components (id_screen, "id_component") VALUES($1, $2)';
    const values = [id_screen,id_components];
    await client.query(text, values);
}

// компонент
async function createComponents(components, id_screen, client){
    const id_component = await client.query("SELECT id from components.component where name = $1", [components.id_component]);
    console.log(id_component.rows[0].id);
    if(!id_component.rows[0].id){
        throw `Тип компонента не найден!! ${components}`;
    }
    const text = 'INSERT INTO components.component_example (id_component, "class", "style", id_rights) VALUES($1, $2, $3, $4) RETURNING id';
    const values = [id_component.rows[0].id, components.class, components.style, components.id_rights];
    const result = await client.query(text, values);
    await createComponentsScreen(result.rows[0].id, id_screen, client);
}

// старт
async function configCreate(config){
    const {client} = PollBd(config.bd);
    await client.connect();
    const idScreen = await screenCreate(config.screen, client);
    if(config.components){
        for (const components of config.components) {
            await createComponents(components, idScreen,client);
        }
    }
    await client.end();
}



(async()=>{
    await configCreate(config);
})();
 