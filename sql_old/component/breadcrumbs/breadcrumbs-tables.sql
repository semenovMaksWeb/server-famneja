CREATE TABLE components.breadcrumbs (
	id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	"name" varchar NULL,
	id_screen int4 NULL,
	CONSTRAINT breadcrumbs_pk PRIMARY KEY (id),
	CONSTRAINT breadcrumbs_fk FOREIGN KEY (id_screen) REFERENCES components.screen(id)
);
