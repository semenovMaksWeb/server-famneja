CREATE OR REPLACE FUNCTION components.params_update(_id int, _name varchar, _req bool, _description varchar, _type int)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
	BEGIN
	    UPDATE components."params"
	    SET
	        "name" = _name,
	        "req" = _req,
	        "description" = _description,
	        "type" = _type
	    WHERE components."params"."id" = _id;
	END;
$function$
;