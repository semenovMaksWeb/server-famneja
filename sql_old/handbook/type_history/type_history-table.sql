CREATE TABLE handbook.type_history (
    id int8 NOT NULL GENERATED ALWAYS AS IDENTITY,
    "name" varchar NULL,
    CONSTRAINT gender_pk PRIMARY KEY (id)
);