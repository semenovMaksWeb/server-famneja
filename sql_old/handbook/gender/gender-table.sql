CREATE TABLE handbook.gender (
    id int8 NOT NULL GENERATED ALWAYS AS IDENTITY,
    "name" varchar NULL,
    CONSTRAINT gender_pk PRIMARY KEY (id)
);