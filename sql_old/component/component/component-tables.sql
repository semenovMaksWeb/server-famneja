CREATE TABLE components.component (
	id int NOT NULL GENERATED ALWAYS AS IDENTITY,
	"name" varchar NOT NULL,
	description varchar NULL,
	active bool NULL DEFAULT true,
	CONSTRAINT component_pk PRIMARY KEY (id)
);
