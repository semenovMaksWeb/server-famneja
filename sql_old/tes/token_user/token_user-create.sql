 CREATE OR REPLACE FUNCTION tes.token_user_create(
	_login character varying,
    _password character varying
)
 RETURNS text
 LANGUAGE plpgsql
AS $function$
DECLARE
    _token tes.token;
	_id_user int = (SELECT id FROM tes."user" u WHERE u.login = _login and u.password = crypt(_password, u.password));
	begin
        IF _id_user IS NOT NULL THEN
            INSERT INTO tes.token ("id_user") VALUES (id_user) RETURNING * INTO _token;
            return _token.value;
        END IF;
        return json_build_object('errors', json_build_object('password', 'Не вверно введены данные'));
	END;
$function$
;
-- select  * from tes.token_user_create('test2','1') as result;