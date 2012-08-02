<p>
    <a href="new.sl">New thread</a>
</p>
<ul class="threads">
    <% for thread in @threads { %>
        <li>
            <div class="title"><a href="thread.sl?id=<%= thread["id"] %>"><%= thread["title"] %></a></div>
            <p>Posted by <a href="user.sl?id=<%= thread["user_id"] %>"><%= thread["username"] %></a></p>
        </li>
    <% } %>
</ul>