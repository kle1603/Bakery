<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page
    contentType="text/html;charset=UTF-8" language="java" %> <%@ taglib prefix="fmt"
                                                                    uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                <div class="checkout">
                    <div class="container">
                        <div class="checkout__inner">
                            <c:url var="cartItem" value="MainController">
                                <c:param name="action" value="Cart" />
                            </c:url>
                            <a class="checkout__back" href="${cartItem}"
                               ><img src="./assets/icons/x.svg" alt=""
                                  /></a>
                                <c:url var="productUrl" value="MainController">
                                    <c:param name="action" value="Product" />
                                </c:url>
                            <a href="${productUrl}" class="checkout__product"
                               ><img
                                    class="checkout__product-image"
                                    src="./assets/icons/shopping-cart-full.svg"
                                    alt=""
                                    />
                                <p class="checkout__product-text">
                                    Continues shopping
                                </p>
                            </a>
                            <div class="checkout__content">
                                <h1 class="checkout__heading">
                                    Checkout information
                                </h1>
                                <div class="checkout__name">
                                    <div class="checkout__first-name">
                                        <label for="firstName" class="form-label"
                                               ><p class="form-title">
                                                First name
                                            </p></label
                                        >
                                        <input
                                            type="text"
                                            class="form-control"
                                            id="firstName"
                                            placeholder="Input your first name"
                                            value=""
                                            required=""
                                            />
                                    </div>

                                    <div class="checkout__last-name">
                                        <label for="lastName" class="form-label"
                                               ><p class="form-title">
                                                Last name
                                            </p></label
                                        >
                                        <input
                                            type="text"
                                            class="form-control"
                                            id="lastName"
                                            placeholder="Input your last name"
                                            value=""
                                            required=""
                                            />
                                    </div>
                                </div>

                                <div class="checkout__phone">
                                    <label for="phone" class="form-label"
                                           ><p class="form-title">Phone</p></label
                                    >
                                    <input
                                        type="number"
                                        class="form-control"
                                        id="phone"
                                        placeholder="Input your phone number"
                                        />
                                </div>

                                <div class="checkout__address">
                                    <label for="address" class="form-label"
                                           ><p class="form-title">Address</p></label
                                    >
                                    <input
                                        type="text"
                                        class="form-control"
                                        id="address"
                                        placeholder="Input your address"
                                        required=""
                                        />
                                </div>

                                <div class="checkout__note">
                                    <label for="note" class="form-label"
                                           ><p class="form-title">Note</p>
                                        <p class="form-option">(optional)</p></label
                                    >
                                    <textarea
                                        class="contact__form-textarea contact__form"
                                        name="yourself"
                                        id="yourself"
                                        placeholder="Tell us about yourself"
                                        minlength="8"
                                        ></textarea>
                                </div>
                            </div>

                            <div class="checkout__amount">
                                <h2 class="checkout__order">Your order</h2>
                                <div class="checkout__row checkout__row-1">
                                    <p class="checkout__row-price">
                                        Original Price
                                    </p>
                                    <p class="checkout__row-price">
                                        $${TOTAL_AMOUNT}
                                    </p>
                                </div>
                                <div class="checkout__row">
                                    <p class="checkout__row-price">Savings</p>
                                    <p class="checkout__row-price">$0</p>
                                </div>
                                <div class="checkout__row">
                                    <p class="checkout__row-price">Shipping</p>
                                    <p class="checkout__row-price">FREE</p>
                                </div>
                                <div class="checkout__row checkout__row-2">
                                    <p class="checkout__row-price">
                                        Estimated Sales Tax
                                    </p>
                                    <p class="checkout__row-price">$0</p>
                                </div>
                                <div class="checkout__row checkout__row-3">
                                    <p class="checkout__total">Total</p>
                                    <p class="checkout__price">$${TOTAL_AMOUNT}</p>
                                </div>

                                <a href="" class="btn checkout__btn" type="submit">
                                    Place Order
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </main>

            <!-- Footer -->
            <c:import url="./footer.jsp" />
        </body>
    </html>
