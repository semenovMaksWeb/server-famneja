-- Extension: pgcrypto

-- DROP EXTENSION pgcrypto;

CREATE EXTENSION "pgcrypto"
	SCHEMA "public"
	VERSION "1.3";

-- Extension: uuid-ossp

-- DROP EXTENSION uuid-ossp;

CREATE EXTENSION "uuid-ossp"
	SCHEMA "public"
	VERSION "1.1";


-- DROP SCHEMA components;

CREATE SCHEMA components AUTHORIZATION postgres;

COMMENT ON SCHEMA components IS 'standard public schema';

-- DROP SCHEMA handbook;

CREATE SCHEMA handbook AUTHORIZATION postgres;

-- DROP SCHEMA tes;

CREATE SCHEMA tes AUTHORIZATION postgres;



-- tes.rights definition

-- Drop table

-- DROP TABLE tes.rights;

CREATE TABLE tes.rights (
	id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	"name" varchar NOT NULL,
	CONSTRAINT rights_pk PRIMARY KEY (id),
	CONSTRAINT rights_un UNIQUE (name)
);


-- tes.roles definition

-- Drop table

-- DROP TABLE tes.roles;

CREATE TABLE tes.roles (
	id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	"name" varchar NOT NULL,
	CONSTRAINT roles_pk PRIMARY KEY (id),
	CONSTRAINT roles_un UNIQUE (name)
);


-- tes."token" definition

-- Drop table

-- DROP TABLE tes."token";

CREATE TABLE tes."token" (
	id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	value uuid NOT NULL DEFAULT uuid_generate_v4(),
	active bool NULL DEFAULT true,
	"date" timestamp NOT NULL DEFAULT (now() + '2 days'::interval day),
	CONSTRAINT token_pk PRIMARY KEY (id),
	CONSTRAINT token_value_key UNIQUE (value)
);


-- tes."user" definition

-- Drop table

-- DROP TABLE tes."user";

CREATE TABLE tes."user" (
	id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	login varchar NOT NULL,
	"password" varchar NOT NULL,
	active bool NULL DEFAULT false,
	"name" varchar NULL,
	surname varchar NULL,
	patronymic varchar NULL,
	telephone varchar NULL,
	email varchar NULL,
	CONSTRAINT user_pk PRIMARY KEY (id),
	CONSTRAINT user_un UNIQUE (login)
);


-- tes.roles_rights definition

-- Drop table

-- DROP TABLE tes.roles_rights;

CREATE TABLE tes.roles_rights (
	id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	id_roles int4 NOT NULL,
	id_rights int4 NOT NULL,
	CONSTRAINT roles_rights_pk PRIMARY KEY (id),
	CONSTRAINT roles_rights_fk FOREIGN KEY (id_roles) REFERENCES tes.roles(id),
	CONSTRAINT roles_rights_fk_1 FOREIGN KEY (id_rights) REFERENCES tes.rights(id)
);


-- tes.token_user definition

-- Drop table

-- DROP TABLE tes.token_user;

CREATE TABLE tes.token_user (
	id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	id_token int4 NOT NULL,
	id_user int4 NULL,
	CONSTRAINT token_user_pk PRIMARY KEY (id),
	CONSTRAINT token_use1r_fk FOREIGN KEY (id_user) REFERENCES tes."user"(id),
	CONSTRAINT token_user_fk FOREIGN KEY (id_token) REFERENCES tes."token"(id)
);


-- tes.user_roles definition

-- Drop table

-- DROP TABLE tes.user_roles;

CREATE TABLE tes.user_roles (
	id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	id_roles int4 NOT NULL,
	id_user int4 NOT NULL,
	CONSTRAINT user_roles_pk PRIMARY KEY (id),
	CONSTRAINT user_roles_fk FOREIGN KEY (id_roles) REFERENCES tes.roles(id),
	CONSTRAINT user_roles_fk_1 FOREIGN KEY (id_user) REFERENCES tes."user"(id)
);

-- handbook."event" definition

-- Drop table

-- DROP TABLE handbook."event";

CREATE TABLE handbook."event" (
	id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	"name" varchar NOT NULL,
	description varchar NOT NULL,
	"date" timestamp NULL,
	CONSTRAINT event_pk PRIMARY KEY (id)
);
-- handbook.function_front definition

-- Drop table

-- DROP TABLE handbook.function_front;

CREATE TABLE handbook.function_front (
	id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	"name" varchar NOT NULL,
	description varchar NULL,
	CONSTRAINT function_front_pk PRIMARY KEY (id)
);


-- handbook.typevar definition

-- Drop table

-- DROP TABLE handbook.typevar;

CREATE TABLE handbook.typevar (
	id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	"name" varchar NOT NULL,
	CONSTRAINT typevar_pk PRIMARY KEY (id)
);

-- components.component definition

-- Drop table

-- DROP TABLE components.component;

CREATE TABLE components.component (
	id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	"name" varchar NOT NULL,
	description varchar NULL,
	active bool NULL DEFAULT true,
	CONSTRAINT component_pk PRIMARY KEY (id)
);


-- components.component_example definition

-- Drop table

-- DROP TABLE components.component_example;

CREATE TABLE components.component_example (
	id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	id_component int4 NOT NULL,
	"class" json NULL,
	"style" json NULL,
	id_parent int4 NULL,
	id_rights int4 NULL,
	tag varchar NULL,
	CONSTRAINT component_example_pk PRIMARY KEY (id),
	CONSTRAINT component_example_fk FOREIGN KEY (id_component) REFERENCES components.component(id),
	CONSTRAINT component_example_fk_2 FOREIGN KEY (id_parent) REFERENCES components.component_example(id),
	CONSTRAINT component_example_fk_3 FOREIGN KEY (id_rights) REFERENCES tes.rights(id)
);


-- components.config_api definition

-- Drop table

-- DROP TABLE components.config_api;

CREATE TABLE components.config_api (
	id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	url varchar NULL,
	"type" varchar NULL,
	id_component int4 NULL,
	CONSTRAINT config_api_pk PRIMARY KEY (id),
	CONSTRAINT element_fd_result_check CHECK ((((type)::text = 'delete'::text) OR ((type)::text = 'post'::text) OR ((type)::text = 'update'::text) OR ((type)::text = 'get'::text))),
	CONSTRAINT config_api_fk FOREIGN KEY (id_component) REFERENCES components.component_example(id)
);


-- components.schema_form definition

-- Drop table

-- DROP TABLE components.schema_form;

CREATE TABLE components.schema_form (
	id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	id_form int4 NOT NULL,
	id_components int4 NOT NULL,
	id_parent int4 NULL,
	CONSTRAINT schema_form_pk PRIMARY KEY (id),
	CONSTRAINT schema_form_fk FOREIGN KEY (id_form) REFERENCES components.component_example(id),
	CONSTRAINT schema_form_fk_1 FOREIGN KEY (id_components) REFERENCES components.component_example(id),
	CONSTRAINT schema_form_fk_2 FOREIGN KEY (id_parent) REFERENCES components.component_example(id)
);


-- components.schema_table definition

-- Drop table

-- DROP TABLE components.schema_table;

CREATE TABLE components.schema_table (
	id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	id_components int4 NOT NULL, -- Id компонента таблицы
	sort bool NOT NULL, -- требуется ли сортировка в таблице
	"key" varchar NOT NULL, -- ключ элемента схемы
	title varchar NULL, -- хинт у ячейки
	button int4 NULL, -- указывает что в колонке кнопка с id
	w int4 NULL, -- ширина колонки
	"order" int4 NULL,
	CONSTRAINT schema_table_pk PRIMARY KEY (id),
	CONSTRAINT schema_table_fk FOREIGN KEY (id_components) REFERENCES components.component_example(id)
);

-- Column comments

COMMENT ON COLUMN components.schema_table.id_components IS 'Id компонента таблицы';
COMMENT ON COLUMN components.schema_table.sort IS 'требуется ли сортировка в таблице';
COMMENT ON COLUMN components.schema_table."key" IS 'ключ элемента схемы';
COMMENT ON COLUMN components.schema_table.title IS 'хинт у ячейки';
COMMENT ON COLUMN components.schema_table.button IS 'указывает что в колонке кнопка с id';
COMMENT ON COLUMN components.schema_table.w IS 'ширина колонки';


-- components.breadcrumbs definition

-- Drop table

-- DROP TABLE components.breadcrumbs;

CREATE TABLE components.breadcrumbs (
	id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	"name" varchar NULL,
	id_screen int4 NULL,
	CONSTRAINT breadcrumbs_pk PRIMARY KEY (id)
);


-- components.breadcrumbs_screen definition

-- Drop table

-- DROP TABLE components.breadcrumbs_screen;

CREATE TABLE components.breadcrumbs_screen (
	id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	id_breadcrumbs int4 NULL,
	"order" int4 NULL,
	id_screen int4 NULL,
	CONSTRAINT breadcrumbs_screen_pk PRIMARY KEY (id)
);


-- components.component_api_params definition

-- Drop table

-- DROP TABLE components.component_api_params;

CREATE TABLE components.component_api_params (
	id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	id_config_api int4 NULL,
	id_element_fd int4 NULL,
	CONSTRAINT component_api_params_pk PRIMARY KEY (id)
);


-- components.component_callback definition

-- Drop table

-- DROP TABLE components.component_callback;

CREATE TABLE components.component_callback (
	id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	id_callback int4 NOT NULL,
	params json NULL,
	id_component int4 NULL,
	id_event int4 NULL,
	"order" int4 NULL,
	CONSTRAINT component_callback_pk PRIMARY KEY (id)
);


-- components.component_rule definition

-- Drop table

-- DROP TABLE components.component_rule;

CREATE TABLE components.component_rule (
	id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	id_params int4 NOT NULL,
	id_component int4 NULL,
	url varchar NULL,
	"default" bool NULL DEFAULT false,
	CONSTRAINT component_rule_tables_pk PRIMARY KEY (id)
);


-- components.components_params definition

-- Drop table

-- DROP TABLE components.components_params;

CREATE TABLE components.components_params (
	id_components int4 NULL,
	id_params int4 NULL,
	value varchar NULL,
	id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	CONSTRAINT components_params_pk PRIMARY KEY (id)
);


-- components.element_fd definition

-- Drop table

-- DROP TABLE components.element_fd;

CREATE TABLE components.element_fd (
	id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	name_params varchar NOT NULL,
	"result" varchar NOT NULL,
	"type" int4 NOT NULL,
	"name" varchar NOT NULL,
	"index" int4 NULL,
	var_type int4 NULL,
	id_ce int4 NULL,
	CONSTRAINT element_fd_pk PRIMARY KEY (id),
	CONSTRAINT element_fd_result_check CHECK ((((result)::text = 'params'::text) OR ((result)::text = 'body'::text) OR ((result)::text = 'all'::text))),
	CONSTRAINT element_fd_type_check CHECK ((type = ANY (ARRAY[1, 2, 3, 4]))),
	CONSTRAINT element_fd_typevar_fk FOREIGN KEY (var_type) REFERENCES handbook.typevar(id)
);



-- components.params definition

-- Drop table

-- DROP TABLE components.params;

CREATE TABLE components.params (
	id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	"name" varchar NOT NULL,
	req bool NULL DEFAULT true,
	"type" int4 NOT NULL,
	description varchar NULL,
	CONSTRAINT params_pk PRIMARY KEY (id)
);


-- components.screen definition

-- Drop table

-- DROP TABLE components.screen;

CREATE TABLE components.screen (
	id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	url varchar NULL,
	id_right int4 NULL,
	CONSTRAINT screen_pk PRIMARY KEY (id)
);


-- components.screen_components definition

-- Drop table

-- DROP TABLE components.screen_components;

CREATE TABLE components.screen_components (
	id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
	id_screen int4 NOT NULL,
	id_component int4 NOT NULL,
	CONSTRAINT screen_components_pk PRIMARY KEY (id)
);


-- components.breadcrumbs foreign keys

ALTER TABLE components.breadcrumbs ADD CONSTRAINT breadcrumbs_fk FOREIGN KEY (id_screen) REFERENCES components.screen(id);


-- components.breadcrumbs_screen foreign keys

ALTER TABLE components.breadcrumbs_screen ADD CONSTRAINT breadcrumbs_screen1_fk FOREIGN KEY (id_screen) REFERENCES components.screen(id);
ALTER TABLE components.breadcrumbs_screen ADD CONSTRAINT breadcrumbs_screen_fk FOREIGN KEY (id_breadcrumbs) REFERENCES components.breadcrumbs(id);


-- components.component_api_params foreign keys

ALTER TABLE components.component_api_params ADD CONSTRAINT component_api_params_fk FOREIGN KEY (id_element_fd) REFERENCES components.element_fd(id);
ALTER TABLE components.component_api_params ADD CONSTRAINT component_api_params_fk_1 FOREIGN KEY (id_config_api) REFERENCES components.config_api(id);


-- components.component_callback foreign keys

ALTER TABLE components.component_callback ADD CONSTRAINT component_callback_fk FOREIGN KEY (id_callback) REFERENCES handbook.function_front(id);
ALTER TABLE components.component_callback ADD CONSTRAINT component_callback_fk_1 FOREIGN KEY (id_event) REFERENCES handbook."event"(id);
ALTER TABLE components.component_callback ADD CONSTRAINT component_callback_fk_2 FOREIGN KEY (id_component) REFERENCES components.component_example(id);


-- components.component_rule foreign keys

ALTER TABLE components.component_rule ADD CONSTRAINT component_rule_tables_fk FOREIGN KEY (id_component) REFERENCES components.component(id);
ALTER TABLE components.component_rule ADD CONSTRAINT component_rule_tables_fk_1 FOREIGN KEY (id_params) REFERENCES components.params(id);


-- components.components_params foreign keys

ALTER TABLE components.components_params ADD CONSTRAINT components_params_fk FOREIGN KEY (id_components) REFERENCES components.component_example(id);
ALTER TABLE components.components_params ADD CONSTRAINT components_params_fk_1 FOREIGN KEY (id_params) REFERENCES components.component_rule(id);


-- components.element_fd foreign keys

ALTER TABLE components.element_fd ADD CONSTRAINT element_fd_fk FOREIGN KEY (var_type) REFERENCES handbook.typevar(id);


-- components.params foreign keys

ALTER TABLE components.params ADD CONSTRAINT params_fk FOREIGN KEY ("type") REFERENCES handbook.typevar(id);


-- components.screen foreign keys

ALTER TABLE components.screen ADD CONSTRAINT screen_fk FOREIGN KEY (id_right) REFERENCES tes.rights(id);


-- components.screen_components foreign keys

ALTER TABLE components.screen_components ADD CONSTRAINT screen_components_fk FOREIGN KEY (id_component) REFERENCES components.component_example(id);
ALTER TABLE components.screen_components ADD CONSTRAINT screen_components_fk_1 FOREIGN KEY (id_screen) REFERENCES components.screen(id);