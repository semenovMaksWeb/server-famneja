CREATE OR REPLACE FUNCTIONcomponents.params_get_id(_id int)
 RETURNS TABLE(params_id integer, params_name varchar, params_req bool, description varchar, type_id integer, type_name varchar)
 LANGUAGE plpgsql
AS $function$
	BEGIN
        return query
          select
            p.id as params_id,
            p."name" as params_name,
            p.req as params_req,
            p.description  as params_description,
            t.id as type_id,
            t."name"  as type_name
                from params p
                left join typevar t ON t.id  = p."type"
            where p.id = _id;
	END;
$function$
;