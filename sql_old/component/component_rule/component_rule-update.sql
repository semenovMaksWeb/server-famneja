CREATE OR REPLACE FUNCTION components.component_rule_update(_id int,_id_params int, _id_component int, _url varchar = NULL, _default boolean = NULL)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
	BEGIN
	    UPDATE public."component_rule"
		SET
		"id_params" = _id_params, 
		"id_component" = _id_component , 
		"url" = _url, 
		"default" = _default
	WHERE public."component_rule"."id" = _id;
	END;
$function$
;