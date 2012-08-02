<%

require("includes/init.sl");

unless @current_user and @thread = DB.find("threads", Request["thread_id"]) and Request.method == "POST" {
    Response.redirect("index.sl");
}

if Request["text"].length < 30 {
    @error = "Please type at least 30 characters";
    require("templates/header.sl");
    require("templates/reply.sl");
    require("templates/footer.sl");
} else {
    time = DB.query_single("SELECT UNIX_TIMESTAMP() as time")["time"]; # lol 
    DB.insert("posts", {
        "thread_id" => @thread["id"],
        "text"      => Request["text"],
        "user_id"   => @current_user["id"],
        "time"      => time
    });
    DB.update("threads", @thread["id"], { "last_post" => time });
    Response.redirect("thread.sl?id=" + @thread["id"] + "#" + DB.insert_id.to_s);
}