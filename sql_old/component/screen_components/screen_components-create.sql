CREATE OR REPLACE FUNCTION components.screen_components_create(_id_screen int, _id_component int)
 RETURNS int
 LANGUAGE plpgsql
 AS $function$
  DECLARE
   id integer;
	BEGIN
	    INSERT INTO components."screen_components"
            ("id_screen", "id_component")
            VALUES(_id_screen, _id_component)
			RETURNING components."screen_components".id  INTO id;
		RETURN id;
	END;
$function$
;