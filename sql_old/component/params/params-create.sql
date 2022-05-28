CREATE OR REPLACE FUNCTION components.params_create(_name varchar, _req bool, _description varchar, _type int)
 RETURNS int
 LANGUAGE plpgsql
 AS $function$
  DECLARE
   id integer;
	BEGIN
	    INSERT INTO components."params"
            ("name", "req", "description", "type")
            VALUES(_name, _req, _description, _type)
			RETURNING components."params".id  INTO id;
		RETURN id;
	END;
$function$
;