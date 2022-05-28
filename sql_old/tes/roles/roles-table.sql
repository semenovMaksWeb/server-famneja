CREATE TABLE tes.roles (
    id int NOT NULL GENERATED ALWAYS AS IDENTITY,
    "name" varchar NOT NULL,
    CONSTRAINT roles_pk PRIMARY KEY (id),
    CONSTRAINT roles_un UNIQUE ("name")
);