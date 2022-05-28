CREATE TABLE tes.user (
    id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
    login varchar NOT NULL,
    "password" varchar NOT NULL,
    active bool NULL DEFAULT false,
    "name" varchar NULL,
    surname varchar NULL,
    patronymic varchar NULL,
    telephone varchar NULL,
    email varchar NULL,
    id_roles int4 NULL,
    CONSTRAINT user_pk PRIMARY KEY (id),
    CONSTRAINT user_un UNIQUE (login)
);