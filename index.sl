<%

require("includes/init.sl");

threads = DB.query("SELECT threads.id, threads.title, threads.user_id, users.username, users.banned
                    FROM threads 
                    INNER JOIN users ON threads.user_id = users.id 
                    ORDER BY threads.last_post DESC");

require("templates/header.sl");
require("templates/index.sl");
require("templates/footer.sl");