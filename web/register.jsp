<%-- 
    Document   : register
    Created on : Jun 15, 2023, 10:38:37 PM
    Author     : kle
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
    </head>
    <body>
        Create new user:
        <form action="MainController" method="POST">
            User Name<input type="text" name="username" value="" required=""/>
            </br>Email<input type="text" name="email" value="" required=""/>
            </br>Password<input type="password" name="password" value="" required=""/>
            </br><input type="submit" name="action" value="Register"/>
            <input type="reset" value="Reset"/>
        </form>
    </body>
</html>
