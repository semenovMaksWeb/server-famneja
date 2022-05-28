CREATE OR REPLACE FUNCTION handbook.event_get()
 RETURNS TABLE(id integer, name character varying, description character varying, date timestamp without time zone)
 LANGUAGE plpgsql
AS $function$
	BEGIN
        return query select e.id, e.name, e.description, e.date from handbook.event e;
	END;    
$function$
;