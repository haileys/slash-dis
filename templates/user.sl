<% if @user { %>
    <h2><%= @user["username"] %></h2>
    <p>
        This is <%= @user["username"] %>'s profile.
    </p>
<% } else { %>
    <h2>No such user</h2>
<% } %>