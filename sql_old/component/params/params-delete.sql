CREATE OR REPLACE FUNCTION components.params_delete(_id int)
 RETURNS  void
 LANGUAGE plpgsql
AS $function$
	BEGIN
          DELETE FROM components."params" WHERE id = _id;
	END;
$function$
;