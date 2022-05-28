create or replace function testing()
returns void as
$body$
Declare
       ident int;
       foo   text;
BEGIN
       SELECT ID, some_col  
          into ident, foo 
       FROM test;
       raise info '%',ident;
END;
$body$
Language plpgsql;

CREATE OR REPLACE FUNCTION testing()
 RETURNS json
 LANGUAGE plpgsql
AS $function$
Declare
       id int;
       value   text;
	begin 
		select * from  tes.token 
		return query select json_object(
            'id', id,
            'value',value
        ) 
				
	end;
$function$
;
