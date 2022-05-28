CREATE OR REPLACE FUNCTION components.schema_table_create(_id_components int, _key varchar,_sort boolean, _title varchar, _button int, _w int)
 RETURNS int
 LANGUAGE plpgsql
   DECLARE
   id integer;
 AS $function$
	BEGIN
        INSERT INTO components."schema_table"
            ("id_components","key", "sort", "title", "button", "w")
            VALUES(_id_components, _key, _sort, _title, _button, _w)
            RETURNING components."schema_table".id  INTO id;
		RETURN id;
	END;
$function$
;