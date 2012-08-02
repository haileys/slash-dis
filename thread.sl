<%

require("includes/init.sl");

Response.redirect("index.sl") unless Request["id"];

@thread = DB.find("threads", Request["id"]);
@posts = DB.query("SELECT posts.id, posts.user_id, posts.text, posts.time, users.username
                   FROM posts
                   INNER JOIN users ON posts.user_id = users.id
                   WHERE posts.thread_id = " + @thread["id"] + "
                   ORDER BY posts.id ASC");

Response.status = 404 unless @thread;

require("templates/header.sl");
require("templates/thread.sl");
require("templates/footer.sl");