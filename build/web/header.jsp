<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- Header -->
        <header id="header">
            <div class="container">
                <div class="header__inner">
                    <a href="index.jsp" class="header__logo">
                        <img
                            src="./assets/icons/logo.svg"
                            alt=""
                            class="header__logo-image"
                        />
                    </a>
                    <div class="navbar">
                        <ul class="navbar__list">
                            <c:url var="productUrl" value="MainController">
                                <c:param name="action" value="Product"/>
                            </c:url>
                            <li class="navbar__item">
                                <a href="${productUrl}" class="navbar__link">Product</a>
                            </li>
                            <li class="navbar__item">
                                <a href="./pricing.jsp" class="navbar__link">Pricing</a>
                            </li>
                            <li class="navbar__item">
                                <a href="" class="navbar__link">Contact us</a>
                            </li>
                            <li class="navbar__item">
                                <a href="" class="navbar__link">Blog</a>
                            </li>
                            <li class="navbar__item">
                                <a href="" class="navbar__link">About us</a>
                            </li>
                        </ul>
                    </div>
                    <div class="header-action">
                        <a href="register.jsp" class="header-action__signup">Sign up</a>
                        <a href="login.jsp" class="header-action__login btn">
                            Login
                        </a>
                    </div>
                </div>
            </div>
        </header>