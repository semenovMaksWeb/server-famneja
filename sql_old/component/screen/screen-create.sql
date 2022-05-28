CREATE OR REPLACE FUNCTION components.screen_create(_url varchar)
 RETURNS int
 LANGUAGE plpgsql
 AS $function$
  DECLARE
   id integer;
	BEGIN
	    INSERT INTO components."screen"
            ("url")
            VALUES(_url)
			RETURNING components."screen".id  INTO id;
		RETURN id;
	END;
$function$
;