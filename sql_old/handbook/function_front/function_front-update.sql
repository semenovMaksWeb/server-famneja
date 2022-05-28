CREATE OR REPLACE FUNCTION handbook.function_front_update(
	_id int,
    _name character varchar,
    _description varchar = null
)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
	begin
		UPDATE handbook.function_front 
		SET 
			"name"=_name, 
			"description"=_description
		WHERE id=_id;
	END;
$function$
;
