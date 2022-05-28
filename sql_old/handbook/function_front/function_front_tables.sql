CREATE TABLE handbook.function_front (
	id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	"name" varchar NOT NULL,
	description varchar NULL,
	CONSTRAINT function_front_pk PRIMARY KEY (id)
);