 CREATE OR REPLACE FUNCTION tes.roles_rights_create(
	_id_roles int,
    _id_rights int
)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
DECLARE
	begin
        INSERT INTO tes.roles_rights (id_roles, id_rights) VALUES(_id_roles, _id_rights);
	END;
$function$
;