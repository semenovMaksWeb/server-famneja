CREATE TABLE tes."token" (
	id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	value uuid NOT NULL DEFAULT uuid_generate_v4(),
	active bool NULL DEFAULT true,
	"date" timestamp NOT NULL DEFAULT (now() + '2 days'::interval day),
	id_user int4 NULL,
	CONSTRAINT token_pk PRIMARY KEY (id),
	CONSTRAINT token_value_key UNIQUE (value),
	CONSTRAINT token_fk FOREIGN KEY (id_user) REFERENCES tes."user"(id)
);
