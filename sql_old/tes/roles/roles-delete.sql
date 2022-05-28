CREATE OR REPLACE FUNCTION tes.roles_delete(
    _id integer
)
	RETURNS void
	LANGUAGE plpgsql
AS $function$
	begin
        DELETE  FROM tes.roles where id = %1$s
	END;
$function$
;