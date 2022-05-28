CREATE OR REPLACE FUNCTION components.schema_table_get_id(_id int)
 RETURNS TABLE(id int, id_component int, sort boolean, key varchar, title varchar, button int, w int)
 LANGUAGE plpgsql
AS $function$
	BEGIN
        return query
        select * from components."schema_table" st where st.id_components = _id;
	END;
$function$
;