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
        <%-- Kiểm tra xem đã đăng nhập hay chưa --%>
        <c:if test="${empty sessionScope.LOGIN_USER}">
            <%-- Hiển thị header.jsp khi chưa đăng nhập --%>
            <c:import url="./header.jsp" />
        </c:if>

        <c:if test="${not empty sessionScope.LOGIN_USER}">
            <%-- Hiển thị headerLogin.jsp khi đã đăng nhập --%>
            <c:import url="./headerLogin.jsp" />
        </c:if>

        <main>
            <article class="user">
                <div class="container">
                    <div class="user__inner">
                        <div class="user__background">
                            <img
                                src="./assets/image/shopping.jpg"
                                alt=""
                                class="bg-image"
                            />
                        </div>
                        <div class="user__content">
                            <div class="user__avatar">
                                <img
                                    src="./assets/image/user-avatar.jpg"
                                    alt=""
                                    class="ava-image"
                                />
                            </div>
                            <h1 class="user__title">Khang Le</h1>
                            <div class="user__information">
                                <p class="user__email">
                                    Email: hello@gmail.com
                                </p>
                                <p class="user__phone">Phone: 0934600600</p>
                                <p class="user__address">
                                    Address: 66 Nguyen Ngoc Phuong P19 Binh
                                    Thanh
                                </p>
                            </div>
                            <div class="user__button">
                                <a href="" class="user__logout"
                                    >Continues shopping</a
                                >
                                <a href="" class="user__product">Logout</a>
                            </div>
                        </div>
                    </div>
                </div>
            </article>
        </main>

        <c:import url="./footer.jsp" />
    </body>
</html>
