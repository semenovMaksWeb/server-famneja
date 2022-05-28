CREATE TABLE roles_rights (
    id int NOT NULL GENERATED ALWAYS AS IDENTITY,
    id_roles int NOT NULL,
    id_rights int NOT NULL,
    CONSTRAINT roles_rights_pk PRIMARY KEY (id),
    CONSTRAINT roles_rights_fk FOREIGN KEY (id_roles) REFERENCES tes.roles(id),
    CONSTRAINT roles_rights_fk_1 FOREIGN KEY (id_rights) REFERENCES tes.rights(id)
);