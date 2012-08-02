<%

require("includes/init.sl");

Response.redirect("index.sl") if @current_user;

if Request.method == "POST" {
    errors = [];
    unless r{^[a-z0-9]{3,30}$}.match(Request["username"]) {
        errors.push("username must be alphanumeric and between 3 and 30 characters");
    }
    unless Request["password"] == Request["confirm"] {
        errors.push("password confirmation must match password");
    }
    unless Request["password"].length >= 6 {
        errors.push("password must be at least 6 characters");
    }
    if DB.query_single("SELECT * FROM users WHERE username = '" + DB.escape(Request["username"]) + "'") {
        errors.push("username is already taken");
    }
    if errors.any {
        @error = errors.join(", ");
    } else {
        salt = (rand() * 100000000).to_s;
        DB.insert("users", {
            "username"  => Request["username"],
            "password"  => hash_password(Request["password"], salt),
            "salt"      => salt
        });
        @session["user_id"] = DB.insert_id;
        @session.save;
        Response.redirect("index.sl");
    }
}

require("templates/header.sl");
require("templates/register.sl");
require("templates/footer.sl");