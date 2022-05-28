CREATE TABLE components.params (
	id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	"name" varchar NOT NULL,
	req bool NULL DEFAULT true,
	"type" int4 NOT NULL,
	description varchar NULL,
	CONSTRAINT params_pk PRIMARY KEY (id)
);


-- public.params foreign keys

ALTER TABLE params ADD CONSTRAINT params_fk FOREIGN KEY ("type") REFERENCES handbook.typevar(id);