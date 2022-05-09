-- type_var_get
CREATE OR REPLACE FUNCTION components.type_var_get()
 RETURNS TABLE(id int, "name" character varying)
 LANGUAGE plpgsql
AS $function$
	begin
		return query
            select * from components."typevar" t; 
	END;
$function$
;


--  component

CREATE OR REPLACE FUNCTION components.component_get_all()
 RETURNS TABLE(component_id integer, component_name varchar, component_description varchar, component_active bool)
 LANGUAGE plpgsql
 AS $function$
	BEGIN
        return query
          select
            c.id as component_id,
            c.name as component_name,
            c.description as component_description,
            c.active as component_active
            from components."component" c;
	END;
$function$
;

CREATE OR REPLACE FUNCTION component_get_name(_name varchar)
 RETURNS TABLE(component_id integer, component_name varchar)
 LANGUAGE plpgsql
 AS $function$
	BEGIN
        return query
          select
            c.id as component_id,
            c.name as component_name
            from components."component" c
            where c.name = _name;
	END;
$function$
;


CREATE OR REPLACE FUNCTION components.component_create(_name character varying, _description character varying)
 RETURNS void
 LANGUAGE plpgsql
 AS $function$
	BEGIN
	    INSERT INTO components."component"
            ("name", "description")
            VALUES(_name, _description);
	END;
$function$
;

CREATE OR REPLACE FUNCTION components.component_delete(_id int)
 RETURNS  void
 LANGUAGE plpgsql
 AS $function$
	BEGIN
        DELETE FROM components."component" WHERE id = _id;
	END;
$function$
;

CREATE OR REPLACE FUNCTION components.component_update(_id int, _name varchar, _description varchar, _active bool)
 RETURNS void
 LANGUAGE plpgsql
 AS $function$
	BEGIN
	    UPDATE components."component"
	    SET
	        "name" = _name,
	        "description" = _description,
	        "active" = _active
	    WHERE component.id = _id;
	END;
$function$
;

-- platform
CREATE OR REPLACE FUNCTION components.components_platform_get(_id integer[])
 RETURNS TABLE(components json)
 LANGUAGE plpgsql
 AS $function$
	BEGIN
        return query
             select 
        json_agg(
            json_build_object(
			'id', ce.id,
			'class', ce."class",
			'style', ce."style",
 			'type', c."name",
			'params', cp.params,
			'api', config_api,
			'event', component_callback,
			'schema_table', "schema",
			'schema_form', schema_form
			)
        )  from components.component_example ce
        left join components.component c on c.id = ce.id_component
        left join (
		select sf.id_form,
 			json_agg(
				json_build_object(
 --                    'component', component_form,
					'id_components',sf.id_components,
					'id_parent', sf.id_parent
				)
			) schema_form
		from components.schema_form sf
 --		join (select * from components_platform_get(sf.id_components)) component_form on ce.id = sf.id_components
		group by sf.id_form 
	    ) sf on sf.id_form = ce.id
 --	    схема таблицы
      	left join (
 			select schema_c.id_components,			
			 json_agg(
 					json_build_object(
 						schema_c.key, json_build_object(
 							'id', schema_c.id,
 							'key', schema_c.key,
 							'sort', schema_c.sort,
 							'title', schema_c.title,
 							'button', schema_c.button,
 							'w', schema_c.w
 						)
				 )
			) "schema"
 			from components.schema_table schema_c
 			group by schema_c.id_components 
 		)schema_c  on schema_c.id_components = ce.id
        left join (
            select cc.id_component,
            json_agg(
                json_build_object(
                    e.name, (json_build_object(
                        'id', cc.id,
                        'params', cc.params	
                    )))) component_callback
            from components.component_callback cc
            left join  components.event e on e.id = cc.id_event
            group by cc.id_component
        ) cc on cc.id_component = ce.id
			left join (
			select cp.id_components,
			json_agg(
					json_build_object(
					p."name", json_build_object(
 --						'id', p.id,
						'url', cr.url,
						'value', cp.value,
						'type', t."name" 	
					))) params
			from components.components_params cp  
			left join components.component_rule cr  on cr.id  = cp.id_params
			left join components.params p  on p.id  = cr.id_params
			left join components.typevar t on t.id  = p."type" 
			group by cp.id_components 
			)cp on cp.id_components = ce.id 
	left join (
		select ca.id_component, json_agg(
			json_build_object(
				'url', ca.url,
				'type', ca.type,
				'params', api_params
			)
		) config_api  from components.config_api ca 
		left join (
			select cap.id_config_api,
			  json_agg(
					json_build_object(
						'name_params', ef.name_params,
						'result', ef.result,
						'name', ef.name,
						'index', ef."index",
						'type', ef."type",
						'type_var', t2."name" 
					)) api_params 
			from components.component_api_params cap 
			left join components.element_fd ef ON cap.id_element_fd = ef.id
			left join components.typevar t2 on t2.id = ef.var_type 
			group by cap.id_config_api
		) cap on cap.id_config_api = ca.id
				group by ca.id_component
	 ) ca  on ca.id_component = ce.id
   	where ce.id =  ANY (_id);
   	END;    
$function$
;

CREATE OR REPLACE FUNCTION components.screen_platform_get(_id int)
 RETURNS  TABLE(screen json)
 LANGUAGE plpgsql
 AS $function$
	DECLARE
	id_component_screen int[];
	id_component_form int[];
	BEGIN
	id_component_screen := (select array_agg(ce.id::INT)
		from components.screen s 
		left join components.screen_components sc on sc.id_screen  = s.id
		left join components.component_example ce on ce.id = sc.id_component
		where s.id  = _id);
	id_component_form := (select array_agg(sf.id_components)
		from component_example ce 
		left join schema_form sf on sf.id_form = ce.id
		where ce.id = any (id_component_screen) and sf.id_components notnull);   		
 --	главный select
  return query 
  select json_build_object(
	'screen', json_build_object(
		'id', s.id,
		'url', s.url
	),
	'breadcrumbs', b,
 	'components', components_platform_get(array_cat(id_component_screen, id_component_form))
	) screen
	from components.screen s
	left join (
	select 
		b.id_screen,
		json_agg(
        	json_build_object(
            	'name', b."name",
            	'url', b.url
        	)
	) b 
	from components.breadcrumbs b
	group by b.id_screen
	) b on b.id_screen = _id
	where s.id = _id;
	END;    
$function$
;