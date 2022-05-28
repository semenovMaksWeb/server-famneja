CREATE OR REPLACE FUNCTION components.schema_form_create(_id_form int, _id_components int, _id_parent int)
 RETURNS int
 LANGUAGE plpgsql
 AS $function$
  DECLARE
   id integer;
	BEGIN
	    INSERT INTO components."schema_form"
            ("id_form", "id_components","id_parent")
            VALUES(_id_form, _id_components, _id_parent)
			RETURNING components."schema_form".id  INTO id;
		RETURN id;
	END;
$function$
;