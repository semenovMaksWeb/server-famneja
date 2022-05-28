CREATE OR REPLACE FUNCTION components.component_api_params_get(_id int)
 RETURNS TABLE(id_api integer, url varchar, api_type varchar, fd_id int,fd_name_params varchar, fd_result varchar, fd_type int, fd_name varchar, fd_index int, fd_var_type varchar)
 LANGUAGE plpgsql
AS $function$
	BEGIN
        return query
			select 
				ca.id as id_api, 
				ca.url  as url, 
				ca."type" as api_type, 
				cap.id as fd_id,
				ef.name_params as fd_name_params,
				ef."result" as fd_result,
				ef."type" as fd_type,
				ef."name" as fd_name,
				ef."index" as fd_index,
				t."name"  as fd_var_type
			from  config_api ca 
			left join component_api_params cap ON cap.id_config_api = ca.id
			left join  element_fd ef on ef.id  = cap.id_element_fd
			left join typevar t on t.id  = ef.var_type 
			where ca.id_component = _id;
	END;
$function$
;