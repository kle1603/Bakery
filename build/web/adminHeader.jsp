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
        
        <div class="admin__header-navbar">
            <div class="container">
                <div class="admin__header-inner">
                    <div class="admin__navbar">
                        <div class="admin__navbar-left">
                            <a href="./adminHome.jsp" class="admin__navbar-item"
                                >Home</a
                            >
                            <c:url var="deup" value="MainController">
                                <c:param name="action" value="Admin"/>
                            </c:url>
                            <a href="${deup}" class="admin__navbar-item"
                                >Delete & Update</a
                            >
                            <a href="./adminCreate.jsp" class="admin__navbar-item">Create</a>
                        </div>
                        <div class="admin__navbar-right">
                            <c:url var="logout" value="MainController">
                                <c:param name="action" value="Logout"/>
                            </c:url>
                            <a href="${logout}" class="admin__navbar-item">Logout</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
