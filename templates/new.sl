<h2>New thread</h2>
<form method="POST">
    <% csrf_form_token() %>
    <label for="title">Thread title:</label>
    <input type="text" name="title" id="title" value="<%= Request["title"] %>" />
    <label for="text">Message:</label>
    <textarea name="text" id="text" cols="50" rows="10"><%= Request["text"] %></textarea>
    <input type="submit" value="post">
</form>