CREATE OR REPLACE FUNCTION handbook.type_history_create(
    _name character varying
)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
	begin
    	INSERT INTO handbook.type_history (name) VALUES(_name);
	END;
$function$
;
