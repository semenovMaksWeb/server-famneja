CREATE OR REPLACE FUNCTION components.config_api_create(_url varchar, _type varchar, _id_component int)
 RETURNS int
 LANGUAGE plpgsql
 AS $function$
   DECLARE
   id integer;
	BEGIN
        INSERT INTO "config_api"
            ("url","type", "id_component")
            VALUES(_url, _type, _id_component)
            RETURNING components."schema_table".id  INTO id;
		RETURN id;
	END;
$function$
;