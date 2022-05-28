CREATE OR REPLACE FUNCTION components.screen_platform_get_url(_url varchar, _token uuid = NULL)
 RETURNS  TABLE(screen json)
 LANGUAGE plpgsql
AS $function$
	DECLARE
	id_component_screen int[];
	id_component_form int[];
	id_screen_top int;
	BEGIN
	id_screen_top:= (select id from components."screen" where screen.url = _url);
	IF id_screen_top IS NULL THEN
	return query 
  select json_build_object(
	  'screen', null
  );
	END IF;
	id_component_screen := (select array_agg(ce.id::INT)
		from components."screen" s 
		left join components."screen_components" sc on sc.id_screen  = s.id
		left join components."component_example" ce on ce.id = sc.id_component
		where s.id  = id_screen_top);
	id_component_form := (select array_agg(sf.id_components)
		from components."component_example" ce 
		left join components."schema_form" sf on sf.id_form = ce.id
		where ce.id = any (id_component_screen) and sf.id_components notnull);
--	главный select
  return query 
  select json_build_object(
	'screen', json_build_object(
		'id', s.id,
		'url', s.url
	),
	'breadcrumbs', bs,
 	'components', components."components_platform_get"(array_cat(id_component_screen, id_component_form), _token)
) screen
from components."screen" s
left join (
	select 
		bs.id_screen,
		json_agg(
        	json_build_object(
            	'name', b."name",
            	'url', s2.url,
				'order', bs.order
        	)
	) bs
	from components."breadcrumbs_screen" bs
	left join components.breadcrumbs b on bs.id_breadcrumbs = b.id
	left join components.screen s2 on b.id_screen = s2.id
	group by bs.id_screen
) bs on bs.id_screen = id_screen_top
where s.id = id_screen_top and (select check_rights from tes.rights_check_user_get(_token,s.id_right)) <> 0;
	END;    
$function$
;