CREATE OR REPLACE FUNCTION tes.rights_create(
	_name character varying
)
 RETURNS void
 LANGUAGE plpgsql
 AS $function$
	begin
        INSERT INTO tes.rights (name) VALUES(%L);
	END;
$function$
;
 