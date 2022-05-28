CREATE OR REPLACE FUNCTION components.component_create(_name character varying, _description character varying)
 RETURNS int
 LANGUAGE plpgsql
 AS $function$
  DECLARE
   id integer;
	BEGIN
	    INSERT INTO components."component"
            ("name", "description")
            VALUES(_name, _description)
			RETURNING components."component".id  INTO id;
		RETURN id;
	END;
$function$
;