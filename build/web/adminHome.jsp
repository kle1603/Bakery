<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page
    contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Smaller</title>

        <!-- Embed Reset -->
        <link rel="stylesheet" href="./assets/css/reset.css" />

        <!-- Embed Fonts -->
        <link rel="preconnect" href="https://fonts.cdnfonts.com" />
        <link
            href="https://fonts.cdnfonts.com/css/roobert?styles=49579,49577,49581"
            rel="stylesheet"
        />

        <!-- Embed Style -->
        <link rel="stylesheet" href="./assets/css/main.css" />
    </head>
    <body>
        <c:if test="${sessionScope.ROLE_ID == null || sessionScope.ROLE_ID ne 'AD'}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        
        <c:import url="./adminHeader.jsp"/>
        <section class="admin-home">
            <div class="container">
                <div class="cart__inner">
                    <h1 class="admin-home__heading">Welcome to admin page</h1>
                </div>
            </div>
        </section>
    </body>
</html>
