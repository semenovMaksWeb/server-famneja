CREATE OR REPLACE FUNCTION components.component_rule_delete(_id int)
 RETURNS  void
 LANGUAGE plpgsql
AS $function$
	BEGIN
          DELETE FROM public."component_rule" WHERE id = _id;
	END;
$function$
;