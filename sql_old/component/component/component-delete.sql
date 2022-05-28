CREATE OR REPLACE FUNCTION components.component_delete(_id int)
 RETURNS  void
 LANGUAGE plpgsql
AS $function$
	BEGIN
        DELETE FROM components."component" WHERE id = _id;
	END;
$function$
;