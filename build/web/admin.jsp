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

            <div
                class="popup__background ${requestScope.ERROR_DELETE_ADMIN ? 'popup__active' : 'popup__hidden'}"
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
                        <p class="popup__desc">You can not delete this product</p>
                    </div>
                </div>
            </div>
            
            <section class="admin">
                <div class="container">
                    <div class="admin__inner">
                        <div class="admin__header">
                            <h1 class="admin__heading">Edit your product</h1>
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
                                    value="Admin"
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
                        <c:if test="${not empty requestScope.ADMIN_PRODUCT_LIST}">
                            <c:forEach var="admin" items="${requestScope.ADMIN_PRODUCT_LIST}">
                                <form name="MainController" method="Post" class="admin__content">
                                    <div class="admin__icon">
                                        <c:url var="delete" value="MainController">
                                            <c:param name="action" value="Admin"/>
                                            <c:param name="breadId" value="${admin.breadId}"/>
                                            <c:param name="page" value="${requestScope.page}"/>
                                            <c:param name="search" value="${param.search}"/>
                                            <c:param name="delete" value="1"/>
                                        </c:url>
                                        <a href="${delete}" class="cart__delete admin__delete">
                                            <svg
                                                xmlns="http://www.w3.org/2000/svg"
                                                height="20"
                                                viewBox="0 0 448 512"
                                                >
                                            <path
                                                d="M135.2 17.7L128 32H32C14.3 32 0 46.3 0 64S14.3 96 32 96H416c17.7 0 32-14.3 32-32s-14.3-32-32-32H320l-7.2-14.3C307.4 6.8 296.3 0 284.2 0H163.8c-12.1 0-23.2 6.8-28.6 17.7zM416 128H32L53.2 467c1.6 25.3 22.6 45 47.9 45H346.9c25.3 0 46.3-19.7 47.9-45L416 128z"
                                                />
                                            </svg>
                                        </a>
                                        <input type="hidden" name="breadId" value="${admin.breadId}"/>
                                        <input type="hidden" name="search" value="${param.search}"/>
                                        <input type="hidden" name="page" value="${requestScope.page}"/>
                                        <button
                                            type="submit"
                                            name="action"
                                            value="Admin"
                                            class="cart__edit admin__edit"
                                            >
                                            <svg
                                                xmlns="http://www.w3.org/2000/svg"
                                                height="22"
                                                viewBox="0 0 512 512"
                                                >
                                            <path
                                                d="M471.6 21.7c-21.9-21.9-57.3-21.9-79.2 0L362.3 51.7l97.9 97.9 30.1-30.1c21.9-21.9 21.9-57.3 0-79.2L471.6 21.7zm-299.2 220c-6.1 6.1-10.8 13.6-13.5 21.9l-29.6 88.8c-2.9 8.6-.6 18.1 5.8 24.6s15.9 8.7 24.6 5.8l88.8-29.6c8.2-2.7 15.7-7.4 21.9-13.5L437.7 172.3 339.7 74.3 172.4 241.7zM96 64C43 64 0 107 0 160V416c0 53 43 96 96 96H352c53 0 96-43 96-96V320c0-17.7-14.3-32-32-32s-32 14.3-32 32v96c0 17.7-14.3 32-32 32H96c-17.7 0-32-14.3-32-32V160c0-17.7 14.3-32 32-32h96c17.7 0 32-14.3 32-32s-14.3-32-32-32H96z"
                                                />
                                            </svg>
                                        </button>
                                        <div class="admin__product-image">
                                            <img
                                                src="${admin.imageUrl}"
                                                alt=""
                                                class="admin__image"
                                                />
                                        </div>
                                        <div class="admin__title admin__product-name">
                                            Name: 
                                            <input
                                                class="admin__input admin__input-name"
                                                type="text"
                                                value="${admin.breadName}"
                                                name="breadName"
                                                />
                                        </div>
                                    </div>
                                    <div class="admin__option">
                                        <div class="admin__title admin__product-type-id">
                                            Type id:
                                            <input
                                                class="admin__input admin__input-type"
                                                type="number"
                                                min="1"
                                                max="4"
                                                value="${admin.breadType.breadTypeId}"
                                                name="typeId"
                                                />
                                        </div>
                                        <div class="admin__title admin__product-quantity">
                                            Quantity:
                                            <input
                                                class="admin__input admin__input-qty"
                                                type="number"
                                                value="${admin.quantity}"
                                                name="quantity"
                                                min="0"
                                                />
                                        </div>
                                        <div class="admin__title admin__product-price">
                                            Price:
                                            <input
                                                class="admin__input admin__input-price"
                                                type="number"
                                                value="${admin.price}"
                                                name="price"
                                                step="0.01"
                                                min="0"

                                                />
                                        </div>
                                    </div>
                                </form>
                            </c:forEach>
                        </c:if>

                        <c:if test="${empty requestScope.ADMIN_PRODUCT_LIST}">
                            <div class="admin__title admin__product-error">
                                No products found 

                            </div>
                        </c:if>
                    </div>
                </div>

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
                                    value="Admin"
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
                                            value="Admin"
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
                                    value="Admin"
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
            </section>
                                    
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
