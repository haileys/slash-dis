<%

DB = MySQL.new(CONFIG["database"]["host"], CONFIG["database"]["user"], CONFIG["database"]["pass"]);
DB.use(CONFIG["database"]["database"]);

def DB.insert(table, fields) {
    names = [];
    values = [];
    for k, v in fields {
        names.push(k);
        values.push(v);
    }
    query("INSERT INTO " + table + " (" + names.join(", ") + ") VALUES (" + values.map(lambda(x) { "\"" + DB.escape(x.to_s) + "\"" }).join(", ") + ")");
}

def DB.update(table, id, fields) {
    sets = [];
    for k, v in fields {
        sets.push(k + " = \"" + DB.escape(v.to_s) + "\"");
    }
    query("UPDATE " + table + " SET " + sets.join(", ") + " WHERE id = " + id.to_i.to_s);
}

def DB.query_single(q) {
    query(q)[0];
}

def DB.find(table, id) {
    query_single("SELECT * FROM " + table + " WHERE id = " + id.to_i.to_s);
}

%>