CREATE OR REPLACE FUNCTION tec.errors_get_id(
	_id int
)
 RETURNS TABLE(id int, message varchar, status int2)
 LANGUAGE plpgsql
AS $function$
	begin
      return query select e.id, e.message, e.status from tec.errors e WHERE e.id = _id;
	END;
$function$
;
