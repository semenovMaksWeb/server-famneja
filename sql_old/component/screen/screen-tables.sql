CREATE TABLE components.screen (
	id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	url varchar NULL,
	id_right int4 NULL,
	CONSTRAINT screen_pk PRIMARY KEY (id),
	CONSTRAINT screen_fk FOREIGN KEY (id_right) REFERENCES tes.rights(id)
);