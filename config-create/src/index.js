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

// сохранить связь id_api и параметры fd
async function saveApiFdManyToMany(id_api,id_fd,client){
    const text = 'INSERT INTO components.component_api_params (id_config_api, id_element_fd) VALUES($1, $2) RETURNING id';
    const values = [id_api, id_fd];
    const result = await client.query(text, values);
}

async function checkAndSaveIdCe(id_ce, client){
    if(id_ce){
        return getIdCompomentsTag(id_ce, client);
    }
    return null;
}

//  проверить и сохранить параметры api
async function checkAndSaveApiComponentsParams(components, id_api, client){
    if(components?.api?.params){
        for (const params of components.api.params) {
            const id_ce = await checkAndSaveIdCe(params.id_ce, client);
            const text = 'INSERT INTO components.element_fd (name_params, result, type, name, index, var_type, id_ce) VALUES($1, $2, $3, $4, $5, $6,$7) RETURNING id';
            const values = [params.name_params, params.result,  params.type, params.name,params.index,params.var_type, id_ce];
            const result = await client.query(text, values);
            const id_fd  = result.rows[0].id;
            await saveApiFdManyToMany(id_api,id_fd, client)
        }
    }
}

//  проверить и сохранить api
async function checkAndSaveApiComponents(components, id, client){
    if(components.api){
        const text = 'INSERT INTO components.config_api (url, type, id_component) VALUES($1, $2, $3) RETURNING id';
        const values = [components.api.url, components.api.type, id];
        const result = await client.query(text, values);
        const id_api  = result.rows[0].id;
        await checkAndSaveApiComponentsParams(components, id_api, client);
    }
}
// проверить и сохранить schema_table
async function checkAndSaveSchemaTable(components, id, client){
    if(components.schema_table){
        for (const schema_table of components.schema_table) {
            let button = null;
            if(schema_table.button){
                button = await getIdCompomentsTag(schema_table.button, client);
            }
            const text = 'INSERT INTO components.schema_table (id_components, sort, "key", title, button, w, "order") VALUES($1, $2, $3, $4, $5, $6, $7);' 
            const values = [id, schema_table.sort, schema_table.key, schema_table.title, button, schema_table.w, schema_table.order ]
            const result = await client.query(text, values);
        }
    }
}

async function checkAndSaveSchemaForm(components, id, client){
    if(components.schema_form){
        for (const schema_form of components.schema_form) {
            if(schema_form.id_parent){
                schema_form.id_parent = await getIdCompomentsTag(schema_form.id_parent, client);
            }
            schema_form.id_components = await getIdCompomentsTag(schema_form.id_components, client);
            const text = 'INSERT INTO components.schema_form(id_parent,id_form, id_components) VALUES($1, $2, $3);' 
            const values = [schema_form.id_parent, id, schema_form.id_components ];
            const result = await client.query(text, values);
        }
    }
}


// компонент
async function createComponents(components, id_screen, client){
    const id_parent = await checkIdParent(components, client);
    const id_component = await checkComponentsType(components, client);
    const text = 'INSERT INTO components.component_example (id_component, "class", "style", id_rights, id_parent, tag) VALUES($1, $2, $3, $4, $5, $6) RETURNING id';
    const values = [id_component, components.class, components.style, components.id_rights, id_parent, components.tag];
    const result = await client.query(text, values);
    const id_ce  = result.rows[0].id
    await createComponentsScreen(id_ce, id_screen, client);
    await checkAndSaveApiComponents(components,id_ce, client);
    await createParamsComponent(components,id_ce, client);
    await createCallback(components, id_ce, client);
    await checkAndSaveSchemaTable(components, id_ce, client);
    await checkAndSaveSchemaForm(components, id_ce, client);

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
//  генерация параметров у компонента
async function createParamsComponent(component, id, client){
    if(component.params){
        let id_type = await client.query('select  id from components.component c  where c."name" = $1', [component.id_component]);
        id_type = id_type?.rows[0]?.id;
        for (const key in component.params) {
            if (Object.hasOwnProperty.call(component.params, key)) {
                const value = component.params[key].toString();
                let id_params = await client.query('select  id from components.params p  where p."name" = $1', [key]);
                id_params = id_params?.rows[0]?.id;
                let id_rules = await client.query('select id from components.component_rule cr where cr.id_params = $1 and (cr.id_component = $2 or cr.id_component is null)', [id_params, id_type]);
                id_rules = id_rules?.rows[0]?.id
                if(!id_rules){
                    console.log(`параметр ${key} для ${component.id_component} не найден!`);
                    continue;
                }
                const text = "INSERT INTO components.components_params (id_components, id_params, value) VALUES($1, $2, $3);";
                const values = [id, id_rules, value];
                const id_params_components = await client.query(text, values);
            }
        }
 
    }
}

async function findTagParamsConfigCallback(params, client){
    if(!params){
        return params;
    }
    const req = params.match(/\$tag{.*?}/gi);
    if (req) {
        for (const param of req) {
            const tag = param.slice(5, param.length - 1);
            const id = await getIdCompomentsTag(tag, client);
            if(id){
                params = params.replace(`"${param}"`, id);
            }else{
                throw `Ошибка компонент по tag ${tag} не найден`
            }
        }
    }
    return params;
}

async function createCallback(component, id, client){
    if(component.event){
        for (const event of component.event) {
            const params = await findTagParamsConfigCallback(event.params, client);
            const text = 'INSERT INTO components.component_callback (id_callback, params, id_component, id_event, "order") VALUES($1, $2,$3,$4,$5);';
            const values = [event.id_callback, params, id, event.id_event, event.order];
            const id_callback = await client.query(text, values);
        }
    }
}

// НИЖЕ ВЫЗОВ!!!!!!!!!! 






(async()=>{
    await configCreate(config);
})();