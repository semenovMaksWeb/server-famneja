CREATE TABLE tes.user_roles (
	id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	id_roles int4 NOT NULL,
	id_user int4 NOT NULL,
	CONSTRAINT user_roles_pk PRIMARY KEY (id),
	CONSTRAINT user_roles_fk FOREIGN KEY (id_roles) REFERENCES tes.roles(id),
	CONSTRAINT user_roles_fk_1 FOREIGN KEY (id_user) REFERENCES tes."user"(id)
);
