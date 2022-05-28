-- Drop table

-- DROP TABLE tec.errors;

CREATE TABLE tec.errors (
	id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	message varchar NOT NULL,
	status int2 NOT NULL,
	CONSTRAINT newtable_pk PRIMARY KEY (id)
);
