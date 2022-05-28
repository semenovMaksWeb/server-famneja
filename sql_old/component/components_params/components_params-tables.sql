CREATE TABLE components.components_params (
	id_components int NULL,
	id_params int NULL,
	value varchar NULL,
	id int NOT NULL GENERATED ALWAYS AS IDENTITY,
	CONSTRAINT components_params_pk PRIMARY KEY (id),
	CONSTRAINT components_params_fk FOREIGN KEY (id_components) REFERENCES components.component_example(id),
	CONSTRAINT components_params_fk_1 FOREIGN KEY (id_params) REFERENCES components.component_rule(id)
);
