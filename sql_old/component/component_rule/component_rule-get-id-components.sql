CREATE OR REPLACE FUNCTION components.component_rule_get_id_components(_id int)
 RETURNS TABLE(id int, url varchar, "default" boolean, params_name varchar, type_name varchar)
 LANGUAGE plpgsql
AS $function$
	BEGIN
        return query
           select cr.id, cr.url, cr."default", cp."name"  as params_name, t."name" as type_name
            from component_rule cr
            left join params cp ON cp.id = cr.id_params 
            left join component c ON c.id  = cr.id_component
            left join typevar t on t.id = cp."type" 
            where cr.id_component  = 1 or cr."default" = true; 
	END;
$function$
;