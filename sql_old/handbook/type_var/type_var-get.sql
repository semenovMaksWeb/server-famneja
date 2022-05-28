CREATE OR REPLACE FUNCTION handbook.type_var_get()
 RETURNS TABLE(id int, "name" character varying)
 LANGUAGE plpgsql
 AS $function$
	begin
		return query
            select * from handbook."typevar" t; 
	END;
$function$
;
