CREATE OR REPLACE FUNCTION tec.user_get_unique(
	_login varchar,
    _email varchar = NULL
)
 RETURNS TABLE(email varchar, login varchar)
 LANGUAGE plpgsql
AS $function$
	begin
      return query select u.email, u.login from tec.user u WHERE (u.login = _login) or (u.email IS NOT NULL and u.email = _email) LIMIT 1;
	END;
$function$
;
