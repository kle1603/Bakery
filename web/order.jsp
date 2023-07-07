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
        <c:if
            test="${sessionScope.ROLE_ID == null || sessionScope.ROLE_ID ne 'US'}"
        >
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>

        <!-- Header -->
        <%-- Kiá»m tra xem ÄÃ£ ÄÄng nháº­p hay chÆ°a --%>
        <c:if test="${empty sessionScope.LOGIN_USER}">
            <%-- Hiá»n thá» header.jsp khi chÆ°a ÄÄng nháº­p --%>
            <c:import url="./header.jsp" />
        </c:if>

        <c:if test="${not empty sessionScope.LOGIN_USER}">
            <%-- Hiá»n thá» headerLogin.jsp khi ÄÃ£ ÄÄng nháº­p --%>
            <c:import url="./headerLogin.jsp" />
        </c:if>

        <main>
            <section class="cart">
                <div class="container">
                    <div class="cart__inner">
                        <h1 class="cart__heading">All Your Order</h1>

                        <!-- Item 1 -->
                        <c:forEach
                            var="order"
                            items="${sessionScope.ORDER_LIST}"
                        >
                            <article class="cart__list">
                                <section class="cart__item">
                                    <h2 class="cart__item-title">
                                        Bill number A89CXY6${order.orderId}
                                    </h2>
                                </section>
                                <div class="cart__item-content">
                                    <p class="order__text order__date">
                                        Date:
                                        <strong class="price"
                                            >${order.orderDate}</strong
                                        >
                                    </p>
                                    <p class="order__text order__items">
                                        Items:
                                        <strong class="price"
                                            >${order.totalProducts}</strong
                                        >
                                    </p>
                                    <p class="order__text order__total">
                                        Total:
                                        <strong class="price"
                                            >$${order.totalAmount}</strong
                                        >
                                    </p>
                                </div>
                            </article>
                        </c:forEach>
                    </div>
                </div>
            </section>
        </main>

        <!-- Footer -->
        <c:import url="./footer.jsp" />
    </body>
</html>
