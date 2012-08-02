<!DOCTYPE html>
<html>
<head>
    <title>slash-dis</title>
    <link href="assets/style.css" rel="stylesheet" />
</head>
<body>
    <header>
        <h2><a href="index.sl">slash-dis</a></h2>
        <div class="auth">
            <% if @current_user { %>
                Logged in as <a href="user.sl?id=<%= @current_user["id"] %>"><%= @current_user["username"] %></a> | <a href="logout.sl?token=<%= @session["csrf_token"] %>">Logout</a>
            <% } else { %>
                <a href="login.sl">Log in</a> or <a href="register.sl">Register</a>
            <% } %>
        </div>
    </header>
    <section>
        <% if @error { %>
            <p class="error">
                <%= @error %>
            </p>
        <% } %>