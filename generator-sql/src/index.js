import { CodeSql } from "./code/code_sql.js";

const sql = new CodeSql("delete", "schema_table", "_id", "void", "_id int", "schema_table_delete");

console.log(sql.sql);