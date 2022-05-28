CREATE TABLE components.schema_form (
	id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	id_form int4 NOT NULL,
	id_components int4 NOT NULL,
	id_parent int4 NULL,
	CONSTRAINT schema_form_pk PRIMARY KEY (id)
);
ALTER TABLE components.schema_form ADD CONSTRAINT schema_form_fk FOREIGN KEY (id_form) REFERENCES components.component_example(id);
ALTER TABLE components.schema_form ADD CONSTRAINT schema_form_fk_1 FOREIGN KEY (id_components) REFERENCES components.component_example(id);
ALTER TABLE components.schema_form ADD CONSTRAINT schema_form_fk_2 FOREIGN KEY (id_parent) REFERENCES components.component_example(id);