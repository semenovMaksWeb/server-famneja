-- type_var_get
CREATE OR REPLACE FUNCTION components.type_var_get()
 RETURNS TABLE(id int, "name" character varying)
 LANGUAGE plpgsql
AS $function$
	begin
		return query
            select * from components."typevar" t; 
	END;
$function$
;


--  component

CREATE OR REPLACE FUNCTION components.component_get_all()
 RETURNS TABLE(component_id integer, component_name varchar, component_description varchar, component_active bool)
 LANGUAGE plpgsql
AS $function$
	BEGIN
        return query
          select
            c.id as component_id,
            c.name as component_name,
            c.description as component_description,
            c.active as component_active
            from components."component" c;
	END;
$function$
;

CREATE OR REPLACE FUNCTION component_get_name(_name varchar)
 RETURNS TABLE(component_id integer, component_name varchar)
 LANGUAGE plpgsql
AS $function$
	BEGIN
        return query
          select
            c.id as component_id,
            c.name as component_name
            from components."component" c
            where c.name = _name;
	END;
$function$
;


CREATE OR REPLACE FUNCTION components.component_create(_name character varying, _description character varying)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
	BEGIN
	    INSERT INTO components."component"
            ("name", "description")
            VALUES(_name, _description);
	END;
$function$
;

CREATE OR REPLACE FUNCTION components.component_delete(_id int)
 RETURNS  void
 LANGUAGE plpgsql
AS $function$
	BEGIN
        DELETE FROM components."component" WHERE id = _id;
	END;
$function$
;

CREATE OR REPLACE FUNCTION components.component_update(_id int, _name varchar, _description varchar, _active bool)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
	BEGIN
	    UPDATE components."component"
	    SET
	        "name" = _name,
	        "description" = _description,
	        "active" = _active
	    WHERE component.id = _id;
	END;
$function$
;