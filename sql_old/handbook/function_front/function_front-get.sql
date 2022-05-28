CREATE OR REPLACE FUNCTION handbook.function_front_get()
 RETURNS TABLE(id bigint, name character varchar, description varchar)
 LANGUAGE plpgsql
AS $function$
	begin
		return query
            select * from handbook.function_front ff;
	END;
$function$
;
