CREATE OR REPLACE FUNCTION handbook.event_delete(_id int)
 RETURNS  void
 LANGUAGE plpgsql
AS $function$
	BEGIN
       DELETE FROM handbook.event WHERE id = _id;
	END;    
$function$
;
