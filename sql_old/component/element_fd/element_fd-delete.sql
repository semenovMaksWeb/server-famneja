CREATE OR REPLACE FUNCTION components.element_fd_delete(_id int)
 RETURNS  void
 LANGUAGE plpgsql
AS $function$
	BEGIN
          DELETE FROM components."element_fd" WHERE id = _id;
	END;
$function$
;