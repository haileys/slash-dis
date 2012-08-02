<% if @current_user { %>
    <form method="POST" action="reply.sl">
        <% csrf_form_token() %>
        <input type="hidden" name="thread_id" value="<%= @thread["id"] %>" />
        <textarea name="text" cols="50" rows="10"><%= Request["text"] %></textarea>
        <input type="submit" value="post">
    </form>
<% } else { %>
    <p><a href="login.sl">Log in</a> to reply</p>
<% } %>