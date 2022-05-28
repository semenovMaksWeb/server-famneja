CREATE OR REPLACE FUNCTION components.component_example_create(_id_components int, _class json, _style json)
 RETURNS int
 LANGUAGE plpgsql
 AS $function$
  DECLARE
   id integer;
	BEGIN
	    INSERT INTO components."component_example"
            ("id_component", "class", "style")
            VALUES(_id_components, _class, _style)
			RETURNING components."component_example".id  INTO id;
		RETURN id;
	END;
$function$
;