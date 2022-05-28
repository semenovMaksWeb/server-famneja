CREATE OR REPLACE FUNCTION components.element_fd_create(_name_params varchar, _result varchar, _type int, _name varchar, _index int = null, _var_type int = null )
 RETURNS int
 LANGUAGE plpgsql
 AS $function$
    DECLARE
   id integer;
	BEGIN
		INSERT INTO components."element_fd"
            ("name_params", "result", "type", "name", "index", "var_type")
            VALUES(_name_params, _result, _type, _name, _index, _var_type)
			RETURNING components."element_fd".id  INTO id;
		RETURN id;
	END;
$function$
;