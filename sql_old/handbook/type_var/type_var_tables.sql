CREATE TABLE handbook.typevar (
	id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	"name" varchar NOT NULL,
	CONSTRAINT typevar_pk PRIMARY KEY (id)
);