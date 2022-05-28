CREATE OR REPLACE FUNCTION tes.rights_delete(
    _id integer
)
	RETURNS void
	LANGUAGE plpgsql
AS $function$
	begin
        DELETE  FROM tes.rights where id = %1$s
	END;
$function$
;