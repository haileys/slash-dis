<h2>Register</h2>
<form method="POST">
    <% csrf_form_token() %>

    <label for="username">Username:</label>
    <input type="text" name="username" id="username" value="<%= Request["username"] %>" />
    
    <label for="password">Password:</label>
    <input type="password" name="password" id="password" />
    
    <label for="confirm">Password (confirm):</label>
    <input type="password" name="confirm" id="confirm" />
    
    <input type="submit" value="register" />
</form>