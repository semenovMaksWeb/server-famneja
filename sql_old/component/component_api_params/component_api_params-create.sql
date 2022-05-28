CREATE OR REPLACE FUNCTION components.component_api_params_create(
    _id_config_api int, _id_element_fd int
)
 RETURNS int
 LANGUAGE plpgsql
 AS $function$
  DECLARE
   id integer;
	BEGIN
	    INSERT INTO components."component_api_params"
            ("id_config_api", "id_element_fd")
            VALUES(_id_config_api, _id_element_fd)
			RETURNING components."component_api_params".id  INTO id;
		RETURN id;
	END;
$function$
;