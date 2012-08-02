<%

require("includes/init.sl");

unless @current_user {
    Response.redirect("index.sl");
}

if Request.method == "POST" {
    errors = [];
    errors.push("title must be at least 10 characters") if Request["title"].length < 10;
    errors.push("message must be at least 30 characters") if Request["text"].length < 30;
    if errors.any {
        @error = errors.join(", ");
    } else {
        time = DB.query_single("SELECT UNIX_TIMESTAMP() as time")["time"]; # lol 
        DB.insert("threads", {
            "title"     => Request["title"],
            "user_id"   => @current_user["id"],
            "last_post" => time
        });
        thread_id = DB.insert_id;
        DB.insert("posts", {
            "thread_id" => thread_id,
            "text"      => Request["text"],
            "user_id"   => @current_user["id"],
            "time"      => time
        });
        Response.redirect("thread.sl?id=" + thread_id.to_s + "#" + DB.insert_id.to_s);
    }
}

require("templates/header.sl");
require("templates/new.sl");
require("templates/footer.sl");