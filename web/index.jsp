<%-- 
    Document   : index
    Created on : Jun 15, 2023, 9:38:15 PM
    Author     : kle
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bakery Home</title>
    </head>
    <body>
        <h1>Home</h1>
        <a href="register.jsp">Register</a>
        <a href="login.jsp">Login</a>
        <form action="MainController" method="POST">
            <input type="submit" name="action" value="Product"/>
        </form>
    </body>
</html>
