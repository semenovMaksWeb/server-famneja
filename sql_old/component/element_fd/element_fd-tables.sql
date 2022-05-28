CREATE TABLE components.element_fd (
	id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	name_params varchar NOT NULL,
	"result" varchar NOT NULL,
	"type" int4 NOT NULL,
	"name" varchar NOT NULL,
	"index" int4 NULL,
	var_type int4 NULL,
	id_ce int4 NULL,
	CONSTRAINT element_fd_pk PRIMARY KEY (id),
	CONSTRAINT element_fd_result_check CHECK ((((result)::text = 'params'::text) OR ((result)::text = 'body'::text) OR ((result)::text = 'all'::text))),
	CONSTRAINT element_fd_type_check CHECK ((type = ANY (ARRAY[1, 2, 3, 4]))),
	CONSTRAINT element_fd_fk FOREIGN KEY (var_type) REFERENCES handbook.typevar(id)
);
