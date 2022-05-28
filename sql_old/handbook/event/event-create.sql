CREATE OR REPLACE FUNCTION handbook.event_create(_name varchar, _description varchar)
 RETURNS  void
 LANGUAGE plpgsql
AS $function$
	BEGIN
        INSERT INTO handbook."event"
            ("name", description)
            VALUES(_name, _description);
	END;    
$function$
;