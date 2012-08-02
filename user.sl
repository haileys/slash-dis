<%

require("includes/init.sl");

Response.redirect("index.sl") unless Request["id"];

@user = DB.find("users", Request["id"]);

Response.status = 404 unless @user;

require("templates/header.sl");
require("templates/user.sl");
require("templates/footer.sl");