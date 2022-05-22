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
// получить компонент по tag
async function getIdCompomentsTag(tag, client){
    const id_component = await client.query("SELECT id from components.component_example ce where ce.tag = $1", [tag]);
    return id_component.rows[0].id;
}

// скрин + компонент
async function createComponentsScreen(id_components, id_screen, client){
    const text = 'INSERT INTO components.screen_components (id_screen, "id_component") VALUES($1, $2)';
    const values = [id_screen,id_components];
    await client.query(text, values);
}
// проверить есть ли type компонента
async  function checkComponentsType(components, client){
    const id_component = await client.query("SELECT id from components.component where name = $1", [components.id_component]);
    if(!id_component.rows[0].id){
        throw `Тип компонента не найден!! ${components}`;
    }
    return id_component.rows[0].id;
}
// проверить есть ли type id_parent
async function checkIdParent(components, client){
    let id_parent = null;
    if(components.id_parent != null){
        id_parent = await getIdCompomentsTag(components.id_parent, client);
        if(!id_parent){
            throw `id_parent не найден!! ${components}`; 
        }
    }
    return id_parent;
}

// компонент
async function createComponents(components, id_screen, client){
    const id_parent = await checkIdParent(components, client);
    const id_component = await checkComponentsType(components, client);
    const text = 'INSERT INTO components.component_example (id_component, "class", "style", id_rights, id_parent, tag) VALUES($1, $2, $3, $4, $5, $6) RETURNING id';
    const values = [id_component, components.class, components.style, components.id_rights, id_parent, components.tag];
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
 