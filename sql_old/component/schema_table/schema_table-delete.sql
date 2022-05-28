CREATE OR REPLACE FUNCTION components.schema_table_delete(_id int)
 RETURNS  void
 LANGUAGE plpgsql
AS $function$
	BEGIN
          DELETE FROM components."schema_table" WHERE id = _id;
	END;
$function$
;