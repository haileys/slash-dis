<%

require("includes/config.sl");
require("includes/db.sl");
require("includes/session.sl");

@session = Session.new(CONFIG["cookie_name"]);

if @session["user_id"] {
    @current_user = DB.find("users", @session["user_id"]);
    if @current_user["banned"].to_i != 0 {
        @error = "You are banned";
        require("templates/header.sl");
        require("templates/footer.sl");
        exit();
    }
}

unless @session["csrf_token"] {
    @session["csrf_token"] = GCrypt::SHA1.hex_digest((rand() * 10000000000).to_s);
    @session.save;
}

def csrf_form_token {
    %><input type="hidden" name="token" value="<%= @session["csrf_token"] %>" /><%
}

def verify_csrf_token {
    if @session["csrf_token"] != Request["token"] {
        Response.redirect("index.sl");
    }
}

verify_csrf_token() unless Request.safe_method;

def hash_password(password, salt) {
    i = 0;
    hash = "";
    while i < 1024 {
        hash = GCrypt::SHA512.hex_digest(salt + password + hash);
        i = i + 1;
    }
    hash;
}