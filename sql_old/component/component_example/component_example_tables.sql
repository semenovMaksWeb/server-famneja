CREATE TABLE components.component_example (
	id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	id_component int4 NOT NULL,
	"class" json NULL,
	"style" json NULL,
	id_parent int4 NULL,
	id_rights int4 NULL,
	"order" int4 NULL,
	CONSTRAINT component_example_pk PRIMARY KEY (id),
	CONSTRAINT component_example_fk FOREIGN KEY (id_component) REFERENCES components.component(id),
	CONSTRAINT component_example_fk_2 FOREIGN KEY (id_parent) REFERENCES components.component_example(id),
	CONSTRAINT component_example_fk_3 FOREIGN KEY (id_rights) REFERENCES tes.rights(id)
);