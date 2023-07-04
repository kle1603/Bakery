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
                            <div class="user__form">
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
                                    <div class="user__avatar avatar-left">
                                        <img
                                            src="./assets/image/user-avatar-2.jpg"
                                            alt=""
                                            class="ava-image"
                                            />
                                    </div>
                                    <div class="user__avatar avatar-right">
                                        <img
                                            src="./assets/image/user-avatar-3.jpg"
                                            alt=""
                                            class="ava-image"
                                            />
                                    </div>
                                    <h1 class="user__title">${LOGIN_USER.username}</h1>
                                    <div class="user__information">
                                        <p class="user__email">
                                            Email: ${LOGIN_USER.email}
                                        </p>
                                        <p class="user__phone">Phone: ${not empty LOGIN_USER.customer.phoneNumber ? 'LOGIN_USER.customer.phoneNumber' : 'Please update your phone number'}</p>
                                        <p class="user__address">
                                            Address: ${not empty LOGIN_USER.customer.address ? 'LOGIN_USER.customer.address' : 'Please update your address'}
                                        </p>
                                    </div>
                                    <div class="user__button">
                                        <c:url var="productUrl" value="MainController">
                                            <c:param name="action" value="Product" />
                                        </c:url>
                                        <a href="${productUrl}" class="user__logout">
                                            <svg
                                                class="arrow-left"
                                                xmlns="http://www.w3.org/2000/svg"
                                                width="16"
                                                height="16"
                                                fill="currentColor"
                                                class="bi bi-arrow-right"
                                                viewBox="0 0 16 16"
                                                >
                                            <path
                                                fill-rule="evenodd"
                                                d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z"
                                                />
                                            </svg>
                                            Continues shopping
                                        </a>
                                        <c:url var="logout" value="MainController">
                                            <c:param name="action" value="Logout" />
                                        </c:url>
                                        <a href="${logout}" class="user__product">
                                            Logout
                                            <svg
                                                class="arrow-right"
                                                xmlns="http://www.w3.org/2000/svg"
                                                width="16"
                                                height="16"
                                                fill="currentColor"
                                                class="bi bi-arrow-right"
                                                viewBox="0 0 16 16"
                                                >
                                            <path
                                                fill-rule="evenodd"
                                                d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z"
                                                />
                                            </svg>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </article>
            </main>

            <c:import url="./footer.jsp" />
        </body>
    </html>
