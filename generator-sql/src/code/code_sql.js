import { sql_fun } from "../const/sql_fun.js";

export class CodeSql {
    sql = sql_fun;
    
    constructor(type, table, key_main, res, params, fun_name){
        this.type = type;
        this.table = table;
        this.key_main = key_main;
        this.res = res;
        this.params = params;
        this.fun_name = fun_name;
        this.checkType();
        this.saveReturn();
        this.saveFunName();
        this.saveParams();
    }

    checkType(){
        if(this.type === "delete"){
            this.saveSql(this.codeDelete());
        }
    }
    
    saveSql(params){
        this.sql = this.sql.replace("{$sql}", params);
    }

    saveReturn(){
        console.log(this.sql.replace("{$return}", this.res));
        this.sql = this.sql.replace("{$return}", this.res);
    }

    saveFunName(){
        this.sql = this.sql.replace("{$fun}", this.fun_name);
    }

    saveParams(){
        this.sql = this.sql.replace("{$params}", this.params);
    }
    
    codeDelete(){
        return `DELETE FROM ${this.table} WHERE id = ${this.key_main};`
    }
}