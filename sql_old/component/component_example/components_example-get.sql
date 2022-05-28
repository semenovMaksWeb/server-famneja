CREATE OR REPLACE FUNCTION components.components_example_get(_id int)
 RETURNS TABLE(
   id_component int, 
   class json, 
   style json, 
   url varchar, 
   params_id int, 
   params_name varchar, 
   value varchar,
   type_id int, 
   type_name varchar,
   components_name varchar,
   api_url varchar,
   api_type varchar,
   )
 LANGUAGE plpgsql
AS $function$
	BEGIN
     return query
        select 
         ce.id_component , 
         ce."class" , ce."style", 
         cr.url, p.id as params_id , 
         p."name" as params_name,  
         cp.value  as value, 
         t.id as type_id , 
         t."name" as type_name, 
         c.name as components_name,
         ca.url  as api_url, 
         ca."type"as api_type
      from component_example ce 
      left join  component c ON c.id  = ce.id_component
      left join components_params cp ON cp.id_components  = ce.id
      left join component_rule cr on cr.id = cp.id_params 
      left join params p  ON p.id  = cr.id_params 
      left join typevar t  ON t.id  = p."type" 
      left join config_api ca ON ca.id_component  = ce.id 
      where ce.id = _id;
	END;
$function$
;