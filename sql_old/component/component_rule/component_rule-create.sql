CREATE OR REPLACE FUNCTION components.component_rule_create(_id_params int, _id_component int, _url varchar = NULL, _default boolean = NULL)
 RETURNS int
 LANGUAGE plpgsql
 AS $function$
  DECLARE
   id integer;
	BEGIN
	    INSERT INTO components."component_rule"
            ("id_params", "id_component", "url", "default")
            VALUES(_id_params, _id_component, _url, _default)
			RETURNING components."component_rule".id  INTO id;
		RETURN id;
	END;
$function$
;