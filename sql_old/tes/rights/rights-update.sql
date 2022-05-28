CREATE OR REPLACE FUNCTION tes.rights_update(
	_name character varying,
	_id integer
)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
	begin
         UPDATE tes.rights SET "name"=%L WHERE id=%2$s;
	END;
$function$
;
 