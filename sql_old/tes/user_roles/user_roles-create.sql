 CREATE OR REPLACE FUNCTION tes.user_roles_create(
	_id_roles int,
    _id_user int
)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
DECLARE
	begin
		INSERT INTO tes.user_roles (id_roles, id_user) VALUES(_id_roles, _id_user);
	END;
$function$
;