CREATE OR REPLACE FUNCTION handbook.type_history_get()
 RETURNS TABLE(id bigint, name character varying)
 LANGUAGE plpgsql
AS $function$
	begin
		return query
            SELECT id, name FROM handbook.type_history
	END;
$function$
;
