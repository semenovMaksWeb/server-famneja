INSERT INTO component_example (id_component, class, "style") VALUES
    ((select id from component where  "name" = 'table'), {
        "hidden_text_overflow": true
}, {
        "max_height": "300px",
        "order": 1,
        "margin": "0px 0px 10px 0px",
        "header":{
            "text_align": "center"
        },
        "body":{
            "color": "green",
            "text_align": "center",
            "height_row": "20px"
        }
}),
    ((select id from component where  "name" = 'button'), NULL, {
          "margin": "0 auto",
         "height": "100%"
}), 
    ((select id from component where  "name" = 'container'), NULL, NULL), 
    ((select id from component where  "name" = 'form'), NULL, {
        "order": 3
}),   
    ((select id from component where  "name" = 'button'), NULL, {
        "order": 2,
        "color": "red",
        "bg": "transparent",
        "border": "1px solid red",
        "border_radius": "4px"
}), 
    ((select id from component where  "name" = 'form'), NULL, NULL), 
    ((select id from component where  "name" = 'button'), NULL, {
      "margin": "0 auto",
         "height": "100%"
}), 

    ((select id from component where  "name" = 'container'), NULL, NULL), 
    ((select id from component where  "name" = 'table'), {
        "hidden_text_overflow": true
},{
       "max_height": "300px",
        "order": 1,
        "margin": "0px 0px 10px 0px",
        "header":{
            "text_align": "center"
        },
        "body":{
            "color": "green",
            "text_align": "center",
            "height_row": "20px"
        }
}), 
      
    ((select id from component where  "name" = 'button'), NULL, {
      "margin": "0 auto",
         "height": "100%"
}), 

    ((select id from component where  "name" = 'button'), NULL, {
      "margin": "0 auto",
         "height": "100%"
}), 
    ((select id from component where  "name" = 'button'), NULL, {
         "order": 2,
             "color": "red",
             "bg": "transparent",
             "border": "1px solid red",
             "border_radius": "4px"
     }), 
    ((select id from component where  "name" = 'container'), NULL, NULL), 
    ((select id from component where  "name" = 'form'), NULL, { "order": 3}), 
    ((select id from component where  "name" = 'form'), NULL, {
       "order": 5
}), 
    ((select id from component where  "name" = 'container'), NULL, NULL), 
    ((select id from component where  "name" = 'table'), {
        "hidden_text_overflow": true
}, {
       "max_height": "300px",
        "order": 1,
        "margin": "0px 0px 10px 0px",
        "header":{
            "text_align": "center"
        },
        "body":{
            "color": "green",
            "text_align": "center",
            "height_row": "20px"
        }
}),
    ((select id from component where  "name" = 'form'), NULL, {"order": 2}), 
    ((select id from component where  "name" = 'button'), NULL, {
      "margin": "0 auto",
         "height": "100%"
}), 
    ((select id from component where  "name" = 'container'), NULL, NULL), 

INSERT INTO schema_table (id_components, sort, "key", title, button, w)  VALUES
    (1, true, 'id', 'id', null, 40),
    (1, true, 'name', 'название темы', null, 120),
    (1, true, 'description', 'описание темы', null, 120),
    (1, false, 'delete', '', 2, 40),
    (1, false, 'update', '', 7, 40),
    (1, false, 'update_var', '', 19, 40),
    (9, true, 'id', 'id', null, 40),
    (9, true, 'name', 'название переменной', null, 120),
    (9, true, 'description', 'описание переменной', null, 120),
    (9, false, 'delete', '', 10, 40),
    (9, false, 'update', '', 11, 40),
    (17, true, 'id', 'id', null, 40),
    (17, true, 'name', 'название переменной', null, 120),
    (17, true, 'value', 'значение переменной', null, 120),