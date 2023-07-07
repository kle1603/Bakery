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
            test="${sessionScope.ROLE_ID == null || sessionScope.ROLE_ID ne 'AD'}"
        >
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>

        <c:import url="./adminHeader.jsp" />

        <div
            class="popup__background ${requestScope.SUCCESS_CREATE ? 'popup__active' : 'popup__hidden'}"
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
                    <h3 class="popup__heading">Successfully created!</h3>
                    <p class="popup__desc">New product is created</p>
                </div>
            </div>
        </div>

        <section class="admin-create">
            <div class="container">
                <form
                    action="MainController"
                    method="POST"
                    class="admin-create__inner"
                >
                    <div class="admin-create__top">
                        <h1 class="admin-create__heading">
                            Create your product
                        </h1>
                        <button
                            type="submit"
                            name="action"
                            value="AdminCreate"
                            class="btn admin-create__btn"
                        >
                            Create
                        </button>
                    </div>
                    <div class="admin-create__content">
                        <h2 class="admin-create__title">
                            Product name (Ex: T-shirt)
                        </h2>
                        <input
                            type="text"
                            class="admin-create__input admin-create__name"
                            name="breadName"
                        />
                        <h2 class="admin-create__title">
                            Product type id (Ex: 1)
                        </h2>
                        <input
                            type="number"
                            class="admin-create__input admin-create__type-id"
                            name="breadTypeId"
                            min="1"
                            max="4"
                        />
                        <h2 class="admin-create__title">
                            Product quantity (Ex: 10)
                        </h2>
                        <input
                            type="number"
                            class="admin-create__input admin-create__quantity"
                            name="breadQuantity"
                            min="0"
                        />
                        <h2 class="admin-create__title">
                            Product price (Ex: 19.99)
                        </h2>
                        <input
                            type="number"
                            step="0.01"
                            class="admin-create__input admin-create__price"
                            name="breadPrice"
                            min="0"
                        />
                        <h2 class="admin-create__title">
                            Product image url (Ex: image.url)
                        </h2>
                        <input
                            type="text"
                            class="admin-create__input admin-create__image"
                            name="breadImageUrl"
                        />
                    </div>
                </form>
            </div>
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
