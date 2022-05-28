CREATE OR REPLACE FUNCTION components.breadcrumbs_create(_name varchar, _url varchar,  _id_screen int)
 RETURNS int
 LANGUAGE plpgsql
 AS $function$
  DECLARE
   id integer;
	BEGIN   
	    INSERT INTO components."breadcrumbs"
            ("name", "url", "id_screen")
            VALUES(_name, _url,_id_screen)
			RETURNING components."breadcrumbs".id  INTO id;
		RETURN id;
	END;
$function$
;