CREATE TABLE handbook.event (
	id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	"name" varchar NOT NULL,
	description varchar NOT NULL,
	"date" timestamp NULL,
	CONSTRAINT event_pk PRIMARY KEY (id)
);