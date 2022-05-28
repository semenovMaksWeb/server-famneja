CREATE OR REPLACE FUNCTION tes.roles_create(
	_name character varying
)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
	begin
        INSERT INTO tes.roles (name) VALUES(%L);
	END;
$function$
;
 