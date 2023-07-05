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
        <!-- Header -->
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
            <section class="cart">
                <div class="container">
                    <div class="cart__inner">
                        <h1 class="cart__heading">Your Order</h1>

                        <!-- Item 1 -->
                        <c:forEach var="item" items="${sessionScope.ITEM_LIST}">
                            <form action="MainController" method="POST">
                                <article class="cart__list">
                                    <section class="cart__item">
                                        <h2 class="cart__item-title">
                                            Oder number
                                        </h2>
                                    </section>
                                    <div class="cart__item-content">
                                        ${ORDER_LIST}
                                        <p class="order__text order__date">
                                            Date:
                                            <strong class="price">10/10</strong>
                                        </p>
                                        <p class="order__text order__items">
                                            Items:
                                            <strong class="price">10</strong>
                                        </p>
                                        <p class="order__text order__total">
                                            Total:
                                            <strong class="price">$100</strong>
                                        </p>
                                    </div>
                                </article>
                            </form>
                        </c:forEach>
                    </div>
                </div>
            </section>
        </main>

        <!-- Footer -->
        <c:import url="./footer.jsp" />
    </body>
</html>
