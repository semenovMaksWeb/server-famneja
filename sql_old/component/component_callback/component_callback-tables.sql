CREATE TABLE components.component_callback (
	id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	id_callback int4 NOT NULL,
	params json NULL,
	id_component int4 NULL,
	id_event int4 NULL,
	"order" int4 NULL,
	CONSTRAINT component_callback_pk PRIMARY KEY (id),
	CONSTRAINT component_callback_event_fk FOREIGN KEY (id_event) REFERENCES handbook."event"(id),
	CONSTRAINT component_callback_fk FOREIGN KEY (id_callback) REFERENCES handbook.function_front(id),
	CONSTRAINT component_callback_fk_1 FOREIGN KEY (id_component) REFERENCES components.component_example(id)
);
