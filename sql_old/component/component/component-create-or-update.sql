CREATE OR REPLACE FUNCTION components.component_create_or_update(_id int, _name character varying, _description character varying, _active boolean=true)
 RETURNS int
 LANGUAGE plpgsql
 AS $function$
  DECLARE
   id integer;
	BEGIN
	    IF _id notnull THEN
            PERFORM components.component_update(_id, _name, _description,_active);
            id = _id;
        ELSE
            id = (select * from components.component_create(_name, _description));
        END IF;
        RETURN id;
	END;
$function$
;