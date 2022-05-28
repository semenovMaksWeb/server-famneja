CREATE TABLE components.component_api_params (
	id int NOT NULL GENERATED ALWAYS AS IDENTITY,
	id_config_api int NULL,
	id_element_fd int NULL,
	CONSTRAINT component_api_params_pk PRIMARY KEY (id),
	CONSTRAINT component_api_params_fk FOREIGN KEY (id_element_fd) REFERENCES components.element_fd(id),
	CONSTRAINT component_api_params_fk_1 FOREIGN KEY (id_config_api) REFERENCES components.config_api(id)
);
