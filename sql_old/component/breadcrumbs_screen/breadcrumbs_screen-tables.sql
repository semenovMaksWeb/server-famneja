CREATE TABLE components.breadcrumbs_screen (
	id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	id_breadcrumbs int4 NULL,
	"order" int4 NULL,
	id_screen int4 NULL,
	CONSTRAINT breadcrumbs_screen_pk PRIMARY KEY (id),
	CONSTRAINT breadcrumbs_screen1_fk FOREIGN KEY (id_screen) REFERENCES components.screen(id),
	CONSTRAINT breadcrumbs_screen_fk FOREIGN KEY (id_breadcrumbs) REFERENCES components.breadcrumbs(id)
);