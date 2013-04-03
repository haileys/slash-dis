<%

require("includes/init.sl");

verify_csrf_token();
session.destroy;

Response.redirect("index.sl");