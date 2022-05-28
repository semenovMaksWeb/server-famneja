CREATE OR REPLACE FUNCTION components.components_platform_get(_id integer[], _token uuid DEFAULT NULL::uuid)
 RETURNS TABLE(components json)
 LANGUAGE plpgsql
AS $function$
	BEGIN
        return query
             select 
        json_object_agg(
            ce.id, json_build_object(
			'id', ce.id,
			'class', ce."class",
			'style', ce."style",
			'id_parent', ce.id_parent,
			'order', ce."order",
 			'type', c."name",
			'params', cp.params,
			'api', json_build_object(
				'url', ca.url,
	 			'type', ca.type,
	  			'params', api_params
			),
			'event', component_callback,
			'schema_table', "schema",
			'schema_form', schema_form
			)
        )  from components."component_example" ce
        left join components."component" c on c.id = ce.id_component
		left join components.config_api ca  on ca.id_component = ce.id
        left join (
		select sf.id_form,
 			json_agg(
				json_build_object(
--                    'component', component_form,
					'id_components',sf.id_components,
					'id_parent', sf.id_parent
				)
			) schema_form
		from components."schema_form" sf
--		join (select * from components_platform_get(sf.id_components)) component_form on ce.id = sf.id_components
		group by sf.id_form 
	    ) sf on sf.id_form = ce.id
--	    схема таблицы
      	left join (
 			select schema_c.id_components,			
 					json_object_agg(
 						schema_c.key, json_build_object(
 							'id', schema_c.id,
 							'key', schema_c.key,
 							'sort', schema_c.sort,
 							'title', schema_c.title,
 							'button', schema_c.button,
 							'w', schema_c.w,
 							'order', schema_c.order
 						)
				 )
			 "schema"
 			from components."schema_table" schema_c
 			group by schema_c.id_components
 		)schema_c  on schema_c.id_components = ce.id
        left join (
            select cc.id_component,
--            json_agg(
                json_build_object(
                    e.name, (
                    json_agg(
                     	json_build_object(
                        'id', cc.id,
                        'name', ff."name",
                        'params', cc.params,
						'order', cc.order
                    	)
                    )
-- 				)
 				)) component_callback
            from components."component_callback" cc
            left join  handbook."event" e on e.id = cc.id_event
            left join handbook."function_front" ff on ff.id  = cc.id_callback
            group by cc.id_component, e.name
        ) cc on cc.id_component = ce.id
			left join (
			select cp.id_components,
			json_object_agg(
					p."name", json_build_object(
--						'id', p.id,
						'url', cr.url,
						'value', cp.value,
						'type', t."name" 	
					)) params
			from components."components_params" cp  
			left join components."component_rule" cr  on cr.id  = cp.id_params
			left join components."params" p  on p.id  = cr.id_params
			left join handbook."typevar" t on t.id  = p."type"

			group by cp.id_components 
			)cp on cp.id_components = ce.id 
	-- left join (
	-- 	select ca.id_component, json_agg(
	-- 		json_build_object(
	-- 			'url', ca.url,
	-- 			'type', ca.type,
	-- 			'params', api_params
	-- 		)
	-- 	) config_api  from components.config_api ca 
		left join (
			select cap.id_config_api,
			  json_object_agg(
				  ef.name_params, json_build_object(
						'result', ef.result,
						'name', ef.name,
						'index', ef."index",
						'type', ef."type",
						'type_var', t2."name" 
					)) api_params 
			from components."component_api_params" cap 
			left join components."element_fd" ef ON cap.id_element_fd = ef.id
			left join handbook."typevar" t2 on t2.id = ef.var_type 
			group by cap.id_config_api
		) cap on cap.id_config_api = ca.id
		-- group by ca.id_component
	--  ) ca  on ca.id_component = ce.id
   	where ce.id =  ANY (_id) and (select check_rights from tes.rights_check_user_get(_token, ce.id_rights)) <> 0;
   	END;    
$function$
;