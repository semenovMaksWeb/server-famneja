INSERT INTO components.schema_table (id,id_components,sort,"key",title,button,w) VALUES
	 (1,1,true,'id','id',NULL,40),
	 (2,1,true,'name','название темы',NULL,120),
	 (3,1,true,'description','описание темы',NULL,120),
	 (4,1,false,'delete','',2,40),
	 (5,1,false,'update','',7,40),
	 (6,1,false,'update_var','',19,40),
	 (7,9,true,'id','id',NULL,40),
	 (8,9,true,'name','название переменной',NULL,120),
	 (9,9,true,'description','описание переменной',NULL,120),
	 (10,9,false,'delete','',10,40);
INSERT INTO components.schema_table (id,id_components,sort,"key",title,button,w) VALUES
	 (11,9,false,'update','',11,40),
	 (12,17,true,'id','id',NULL,40),
	 (13,17,true,'name','название переменной',NULL,120),
	 (14,17,true,'value','значение переменной',NULL,120),
	 (16,1,false,'test','тест',NULL,120);