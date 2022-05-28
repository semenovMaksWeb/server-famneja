CREATE OR REPLACE FUNCTION components.element_fd_update(_id int, _name_params varchar, _result varchar, _type int, _name varchar, _index int = null, _var_type int = null )
 RETURNS void
 LANGUAGE plpgsql
AS $function$
	BEGIN
	    UPDATE components."element_fd"
		SET
		"name_params" = _name_params, 
		"result" = _result , 
		"type" = _type, 
		"name" = _name,
        "index" = _index,
        "var_type" = _var_type
	WHERE components."element_fd"."id" = _id;
	END;
$function$
;