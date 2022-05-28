CREATE TABLE tes.token_user (
	id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	id_token int4 NOT NULL,
	id_user int4 NULL,
	CONSTRAINT token_user_pk PRIMARY KEY (id),
	CONSTRAINT token_use1r_fk FOREIGN KEY (id_user) REFERENCES tes."user"(id),
	CONSTRAINT token_user_fk FOREIGN KEY (id_token) REFERENCES tes."token"(id)
);
