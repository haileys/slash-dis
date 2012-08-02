<h2>Log in</h2>
<form method="POST">
    <% csrf_form_token() %>
    
    <label for="username">Username:</label>
    <input type="text" name="username" id="username" />
    
    <label for="password">Password:</label>
    <input type="password" name="password" id="password" />
    
    <input type="submit" value="log in" />
</form>