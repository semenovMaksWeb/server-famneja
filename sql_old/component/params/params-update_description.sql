CREATE OR REPLACE FUNCTION components.params_update_description(_id int, _description varchar)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
	BEGIN
	    UPDATE components."params"
	    SET "description" = _description
	    where components."params".id  = _id;
	END;
$function$
;

