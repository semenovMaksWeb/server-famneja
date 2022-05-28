CREATE OR REPLACE FUNCTION components.screen_platform_get_url_2(_url character varying, _token uuid DEFAULT NULL::uuid)
 RETURNS TABLE(screen json)
 LANGUAGE plpgsql
AS $function$
DECLARE
	check_right int;
	screen components.screen;
BEGIN
	select * into screen from components."screen" s where s.url = _url;
	-- Скрина нет
	IF screen.id IS NULL THEN
		return query select json_build_object( 'errors', 'Скрина не существует', 'status', 404);
	END IF;
	-- Скрина есть
	IF screen.id IS NOT NULL THEN
		check_right := (select check_rights from tes.rights_check_user_get(_token,screen.id_right));
		-- нет прав на скрин
		IF check_right = 0 THEN
			return query select json_build_object( 'errors', 'Скрина не доступен', 'status', 403);
		END IF;
		--  права есть
		IF check_right <> 0 THEN
		return query select json_build_object(
			'screen', screen
		);	
		END IF;
	END IF;
END;    
$function$
;
