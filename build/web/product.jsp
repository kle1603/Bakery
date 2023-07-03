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

        <!-- Main -->
        <main>
            <div
                class="popup__background ${requestScope.SUCCESS_BREAD ? 'popup__active' : 'popup__hidden'}"
            >
                <div class="popup__content">
                    <div class="popup__image">
                        <img
                            src="./assets/icons/check.svg"
                            alt=""
                            class="popup__img"
                        />
                    </div>
                    <div class="popup__body">
                        <h3 class="popup__heading">Successfully applied!</h3>
                        <p class="popup__desc">Product is in your cart</p>
                    </div>
                </div>
            </div>
            <div
                class="popup__background ${requestScope.ERROR_BREAD ? 'popup__active' : 'popup__hidden'}"
            >
                <div class="popup__content">
                    <div class="popup__image">
                        <img
                            src="./assets/icons/error.svg"
                            alt=""
                            class="popup__img"
                        />
                    </div>
                    <div class="popup__body">
                        <h3 class="popup__heading">Error applied!</h3>
                        <p class="popup__desc">All products are in your cart</p>
                    </div>
                </div>
            </div>
            <div class="product">
                <div class="container">
                    <div class="product__inner">
                        <h2 class="product__heading">Find Your Products</h2>

                        <div class="product__option">
                            <div class="product__search">
                                <form
                                    class="product__search-form"
                                    action="MainController"
                                    method="GET"
                                >
                                    <input
                                        class="product__search-text"
                                        type="text"
                                        name="search"
                                        placeholder="Search"
                                        value="${param.search}"
                                    />
                                    <input
                                        type="hidden"
                                        name="action"
                                        value="Product"
                                    />
                                    <button
                                        class="product__search-submit"
                                        type="submit"
                                    >
                                        <img
                                            class="product__search-image"
                                            src="./assets/icons/search.svg"
                                            alt=""
                                        />
                                    </button>
                                </form>
                            </div>
                            <div class="product__filter">
                                <figure class="product__filter-img">
                                    <img
                                        src="./assets/icons/filter.svg"
                                        alt=""
                                    />
                                </figure>
                                <p class="product__filter-content">
                                    All Filters
                                </p>
                            </div>
                        </div>
                        <div class="product__list">
                            <!-- Item 1 -->
                            <c:if test="${not empty requestScope.BREAD_LIST}">
                                <c:forEach
                                    var="bread"
                                    items="${requestScope.BREAD_LIST}"
                                >
                                    <div class="product__item">
                                        <figure
                                            class="product__item-img-wrapper"
                                        >
                                            <a href="#!">
                                                <img
                                                    class="product__item-img"
                                                    src="${bread.imageUrl}"
                                                    alt=""
                                                />
                                            </a>
                                            <c:url
                                                var="cartUrl"
                                                value="MainController"
                                            >
                                                <c:param
                                                    name="action"
                                                    value="AddToCart"
                                                />
                                                <c:param
                                                    name="customerId"
                                                    value="${sessionScope.LOGIN_USER.customer.customerId}"
                                                />
                                                <c:param
                                                    name="breadId"
                                                    value="${bread.breadId}"
                                                />
                                                <c:param
                                                    name="search"
                                                    value="${param.search}"
                                                />
                                                <c:param
                                                    name="page"
                                                    value="${requestScope.page}"
                                                />
                                            </c:url>
                                            <c:url
                                                var="loginUrl"
                                                value="login.jsp"
                                            />
                                            <a
                                                href="${empty sessionScope.LOGIN_USER ? loginUrl : cartUrl}"
                                                class="product__item-img-title"
                                            >
                                                Add to Cart
                                            </a>
                                        </figure>
                                        <section class="product__item-content">
                                            <div class="row">
                                                <a
                                                    href="#!"
                                                    class="product__item-category"
                                                >
                                                    ${bread.breadType.breadTypeName}
                                                </a>
                                                <svg
                                                    class="product__item-heart"
                                                    width="20"
                                                    height="17"
                                                    viewBox="0 0 20 17"
                                                    fill="var(--heart-color)"
                                                    xmlns="http://www.w3.org/2000/svg"
                                                >
                                                    <path
                                                        d="M9.28469 2.93289L9.99818 3.65946L10.7117 2.93289C11.5744 2.0544 12.9509 1 14.4264 1C15.8371 1 16.9711 1.47502 17.7472 2.22871C18.5211 2.98034 19 4.06744 19 5.41255C19 6.86866 18.4185 8.09645 17.4603 9.25823C16.4829 10.4434 15.1706 11.4943 13.7759 12.606C13.7759 12.606 13.7758 12.6061 13.7758 12.6061L13.7527 12.6245C12.4865 13.6334 11.0917 14.7447 9.99867 15.9918C8.91637 14.755 7.53442 13.6523 6.27906 12.6506L6.22374 12.6065L6.22334 12.6061C4.82824 11.494 3.51605 10.4428 2.53897 9.25769C1.58118 8.09595 1 6.86833 1 5.41255C1 4.06745 1.47886 2.98037 2.25289 2.22875C3.02906 1.47506 4.16325 1 5.57455 1C7.04848 1 8.42122 2.0536 9.28469 2.93289Z"
                                                        stroke="currentColor"
                                                        stroke-width="2"
                                                    />
                                                </svg>
                                            </div>
                                            <a
                                                href="#!"
                                                class="product__item-title line-clamp"
                                            >
                                                ${bread.breadName}
                                            </a>
                                            <div class="row">
                                                <div class="product__item-rate">
                                                    <img
                                                        src="./assets/icons/star.svg"
                                                        alt=""
                                                        class="product__item-star"
                                                    />
                                                    <p
                                                        class="product__item-rating"
                                                    >
                                                        5.0 (18)
                                                    </p>
                                                </div>
                                                <strong
                                                    class="product__item-price"
                                                    >$${bread.price}</strong
                                                >
                                            </div>
                                        </section>
                                    </div>
                                </c:forEach>
                            </c:if>
                        </div>
                        <!-- <button class="btn--secondary product__btn">
                                    Load More
                                </button> -->
                        <c:if
                            test="${requestScope.TOTAL_PRODUCT > requestScope.PRODUCTS_PER_PAGE}"
                        >
                            <div class="pagination">
                                <c:if test="${requestScope.page > 1}">
                                    <c:url
                                        var="prevPaging"
                                        value="MainController"
                                    >
                                        <c:param
                                            name="action"
                                            value="Product"
                                        />
                                        <c:param
                                            name="page"
                                            value="${requestScope.page - 1}"
                                        />
                                        <c:if test="${param.search != null}">
                                            <c:param
                                                name="search"
                                                value="${param.search}"
                                            />
                                        </c:if>
                                    </c:url>
                                    <div class="step">
                                        <a
                                            class="pagenum pagenum-left"
                                            href="${prevPaging}"
                                        >
                                            <svg
                                                class="arrow-left"
                                                width="16"
                                                height="16"
                                                viewBox="0 0 16 16"
                                                fill="none"
                                                xmlns="http://www.w3.org/2000/svg"
                                            >
                                                <path
                                                    d="M6 3L11 8L6 13"
                                                    stroke="currentColor"
                                                    stroke-width="1.5"
                                                    stroke-linecap="round"
                                                    stroke-linejoin="round"
                                                />
                                            </svg>
                                            <p>Previous</p>
                                        </a>
                                    </div>
                                </c:if>

                                <c:forEach
                                    var="pageNum"
                                    begin="1"
                                    end="${(requestScope.TOTAL_PRODUCT - 1) / requestScope.PRODUCTS_PER_PAGE + 1}"
                                >
                                    <c:choose>
                                        <c:when
                                            test="${pageNum == requestScope.page}"
                                        >
                                            <p
                                                class="pagenum pagenum-num pagenum-active"
                                            >
                                                ${pageNum}
                                            </p>
                                        </c:when>
                                        <c:otherwise>
                                            <c:url
                                                var="paging"
                                                value="MainController"
                                            >
                                                <c:param
                                                    name="action"
                                                    value="Product"
                                                />
                                                <c:param
                                                    name="page"
                                                    value="${pageNum}"
                                                />
                                                <c:if
                                                    test="${param.search != null}"
                                                >
                                                    <c:param
                                                        name="search"
                                                        value="${param.search}"
                                                    />
                                                </c:if>
                                            </c:url>
                                            <a
                                                class="pagenum pagenum-num"
                                                href="${paging}"
                                                >${pageNum}</a
                                            >
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>

                                <c:if
                                    test="${requestScope.page < Math.ceil(requestScope.TOTAL_PRODUCT / requestScope.PRODUCTS_PER_PAGE)}"
                                >
                                    <c:url
                                        var="nextPaging"
                                        value="MainController"
                                    >
                                        <c:param
                                            name="action"
                                            value="Product"
                                        />
                                        <c:param
                                            name="page"
                                            value="${requestScope.page + 1}"
                                        />
                                        <c:if test="${param.search != null}">
                                            <c:param
                                                name="search"
                                                value="${param.search}"
                                            />
                                        </c:if>
                                    </c:url>
                                    <div class="step">
                                        <a
                                            class="pagenum pagenum-right"
                                            href="${nextPaging}"
                                        >
                                            <p>Next</p>
                                            <svg
                                                class="arrow-right"
                                                width="16"
                                                height="16"
                                                viewBox="0 0 16 16"
                                                fill="none"
                                                xmlns="http://www.w3.org/2000/svg"
                                            >
                                                <path
                                                    d="M6 3L11 8L6 13"
                                                    stroke="currentColor"
                                                    stroke-width="1.5"
                                                    stroke-linecap="round"
                                                    stroke-linejoin="round"
                                                />
                                            </svg>
                                        </a>
                                    </div>
                                </c:if>
                            </div>
                        </c:if>
                        <c:if test="${empty BREAD_LIST}">
                            <h1 class="product__empty">No products found.</h1>
                        </c:if>
                    </div>
                </div>
            </div>
        </main>

        <c:import url="./footer.jsp" />
        <script>
            setTimeout(function () {
                var popup = document.querySelector(".popup__active");
                if (popup) {
                    popup.classList.replace("popup__active", "popup__hidden");
                }
            }, 1000);
        </script>
    </body>
</html>
