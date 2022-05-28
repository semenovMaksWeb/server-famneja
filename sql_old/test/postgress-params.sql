--  взятый код 
SELECT routines.routine_name, parameters.data_type, parameters.ordinal_position, parameters.parameter_name
FROM information_schema.routines
    LEFT JOIN information_schema.parameters ON routines.specific_name=parameters.specific_name
WHERE routines.specific_schema='_handbook'
ORDER BY routines.routine_name, parameters.ordinal_position;

--  тест
SELECT *
FROM information_schema.routines
    LEFT JOIN information_schema.parameters ON routines.specific_name=parameters.specific_name
WHERE routines.specific_schema='_handbook'
ORDER BY routines.routine_name, parameters.ordinal_position;



--  новая функция
SELECT 
    routines.routine_name as name_function, 
    parameters.data_type as params_type, 
    parameters.ordinal_position as params_position, 
    parameters.parameter_name as params_name, 
    routines.data_type as return_type 
FROM information_schema.routines
    LEFT JOIN information_schema.parameters ON routines.specific_name=parameters.specific_name
WHERE routines.routine_name='create_rows'
ORDER BY routines.routine_name, parameters.ordinal_position; 