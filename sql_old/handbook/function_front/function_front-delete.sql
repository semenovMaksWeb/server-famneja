CREATE OR REPLACE FUNCTION handbook.function_front_delete(
    _id bigint
)
	RETURNS void
	LANGUAGE plpgsql
AS $function$
	begin
    	DELETE FROM handbook.function_front where id = _id
	END;
$function$
;
