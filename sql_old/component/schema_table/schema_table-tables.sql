CREATE TABLE components.schema_table (
	id int NOT NULL GENERATED ALWAYS AS IDENTITY,
	id_components int NOT NULL,
	sort bool NOT NULL,
	"key" varchar NOT NULL,
	title varchar NULL,
	button int NULL,
	w int NULL,
	"order" int4 NULL,
	CONSTRAINT schema_table_pk PRIMARY KEY (id),
	CONSTRAINT schema_table_fk FOREIGN KEY (id_components) REFERENCES components.component_example(id)
);

-- Column comments

COMMENT ON COLUMN schema_table.id_components IS 'Id компонента таблицы';
COMMENT ON COLUMN schema_table.sort IS 'требуется ли сортировка в таблице';
COMMENT ON COLUMN schema_table."key" IS 'ключ элемента схемы';
COMMENT ON COLUMN schema_table.title IS 'хинт у ячейки';
COMMENT ON COLUMN schema_table.button IS 'указывает что в колонке кнопка с id';
COMMENT ON COLUMN schema_table.w IS 'ширина колонки';
