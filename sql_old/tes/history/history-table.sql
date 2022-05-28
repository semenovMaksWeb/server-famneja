CREATE TABLE tes.history (
    id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
    message varchar NOT NULL,
    id_user int4 NOT NULL,
    id_type int4 NOT NULL,
    CONSTRAINT history_pk PRIMARY KEY (id),
    CONSTRAINT history_fk FOREIGN KEY (id_user) REFERENCES tes."user"(id),
    CONSTRAINT type_fk FOREIGN KEY (id_type) REFERENCES handbook.type_history(id)
);