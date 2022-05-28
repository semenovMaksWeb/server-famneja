CREATE OR REPLACE FUNCTION tes.rights_check_user_get(_token uuid DEFAULT NULL::uuid, _right integer DEFAULT NULL::integer)
 RETURNS TABLE(check_rights bigint)
 LANGUAGE plpgsql
AS $function$
	begin
        IF _right IS NULL THEN
			return query select count(1) as check_rights;
       	ELSE
	   		IF _token IS NULL THEN
			   return query select count(NULL) as check_rights;
			ELSE
				return query  select count(rr.id_rights) as check_rights from tes."token" t 
				left join tes.token_user tu ON tu.id_token = t.id 
				left join tes."user" u on u.id  = tu.id_user
				left join tes.user_roles ur on ur.id_user = u.id 
				left join tes.roles_rights rr on rr.id_roles = rr.id_roles 
				where t.value = _token and t.active = true and t.date > current_timestamp and u.active  = true and (rr.id_rights =  _right or rr.id_roles = 1);
        	END IF;
		END IF;
	END;
$function$
;
