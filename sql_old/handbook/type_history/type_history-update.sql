CREATE OR REPLACE FUNCTION handbook.type_history_update(
	_name character varying, 
	_id bigint
)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
	begin
        UPDATE handbook.type_history SET "name"=_name WHERE id=%2$s;
	END;
$function$
;
