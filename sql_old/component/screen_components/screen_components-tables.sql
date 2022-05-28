CREATE TABLE components.screen_components (
	id int NOT NULL GENERATED ALWAYS AS IDENTITY,
	id_screen int NOT NULL,
	id_component int NOT NULL,
	CONSTRAINT screen_components_pk PRIMARY KEY (id),
	CONSTRAINT screen_components_fk FOREIGN KEY (id_component) REFERENCES components.component_example(id),
	CONSTRAINT screen_components_fk_1 FOREIGN KEY (id_screen) REFERENCES components.screen(id)
);
