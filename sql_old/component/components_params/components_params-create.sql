CREATE OR REPLACE FUNCTION components.components_params_create(_id_components int, _id_params int, _value varchar)
 RETURNS int
 LANGUAGE plpgsql
 AS $function$
  DECLARE
   id integer;
	BEGIN
	    INSERT INTO components."components_params"
            ("id_components", "id_params", "value")
            VALUES(_id_components, _id_params, _value)
			RETURNING components."components_params".id  INTO id;
		RETURN id;
	END;
$function$
;