<%

require("includes/init.sl");

Response.redirect("index.sl") if current_user;

if Request.method == "POST" {
    if user = DB.query_single("SELECT * FROM users WHERE username = '" + DB.escape(Request["username"]) + "'") {
        if hash_password(Request["password"], user["salt"]) == user["password"] {
            session["user_id"] = @user["id"].to_i;
            session.save;
            Response.redirect("index.sl");
        }
    }
    error = "Incorrect username/password";
}

require("templates/header.sl");
require("templates/login.sl");
require("templates/footer.sl");