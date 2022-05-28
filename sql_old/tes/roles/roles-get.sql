CREATE OR REPLACE FUNCTION tes.roles_get(
	_name character varying,
	_id integer
)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
	begin
        SELECT id, name FROM tes.roles
	END;
$function$
;
 