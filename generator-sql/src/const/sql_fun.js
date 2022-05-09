export const sql_fun = `
CREATE OR REPLACE FUNCTION {$fun}({$params})
 RETURNS {$return}
 LANGUAGE plpgsql
AS $function$
	BEGIN
     {$sql}
    END;
$function$
;
`;