<% if @thread { %>
    <h2><%= @thread["title"] %></h2>
    <ul class="posts">
        <% for post in @posts { %>
            <li>
                <div class="author">
                    <a href="#<%= post["id"] %>">#<%= post["id"] %></a>
                    | Posted by <a href="user.sl?id=<%= post["user_id"] %>"><%= post["username"] %></a> on <%= strftime("%A, %B %e, %Y", post["time"].to_i) %>
                    </div>
                <% for paragraph in post["text"].split("\n") { %>
                    <p>
                        <%= paragraph %>
                    </p>
                <% } %>
            </li>
        <% } %>
    </ul>
    <h2>Reply</h2>
    <%
        require("templates/reply.sl")
    %>
<% } else { %>
    <h2>No such thread</h2>
<% } %>