CREATE TABLE tes.rights (
    id int NOT NULL GENERATED ALWAYS AS IDENTITY,
    "name" varchar NOT NULL,
    CONSTRAINT rights_pk PRIMARY KEY (id),
    CONSTRAINT rights_un UNIQUE ("name")
);