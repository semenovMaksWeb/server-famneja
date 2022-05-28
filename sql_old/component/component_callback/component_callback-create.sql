CREATE OR REPLACE FUNCTION components.component_create(_id_callback int, _params json, _id_component int, _event int)
 RETURNS int
 LANGUAGE plpgsql
 AS $function$
  DECLARE
   id integer;
	BEGIN
	    INSERT INTO components."component_callback"
            ("id_callback", "params", "id_component","event")
            VALUES(_id_callback, _params, _id_component, _event)
			RETURNING components."component".id  INTO id;
		RETURN id;
	END;
$function$
;