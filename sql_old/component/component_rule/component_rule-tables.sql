CREATE TABLE components.component_rule (
	id int NOT NULL GENERATED ALWAYS AS IDENTITY,
	id_params int NOT NULL,
	id_component int NULL,
	-- url путь до параметра возможно не обязательный параметр!
	url varchar NULL,
	"default" bool NULL DEFAULT false,
	CONSTRAINT component_rule_tables_pk PRIMARY KEY (id),
	CONSTRAINT component_rule_tables_fk FOREIGN KEY (id_component) REFERENCES components.component(id),
	CONSTRAINT component_rule_tables_fk_1 FOREIGN KEY (id_params) REFERENCES components.params(id)
);
