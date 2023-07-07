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

        <!-- Hero -->
        <section class="hero">
            <div class="container">
                <div class="hero__inner">
                    <!-- Hero content -->
                    <section class="hero__content">
                        <h1 class="hero__heading">
                            Online catalog management
                            <img
                                src="./assets/image/hero-img-01.png"
                                alt=""
                                class="hero__heading-img"
                            />
                            tool
                        </h1>
                        <p class="hero__desc">
                            Skyrocket your online store conversion rate the
                            customer experience with visual merchandising.
                        </p>
                        <div class="hero-action">
                            <a href="#!" class="btn hero-action__booking">
                                Book a Demo
                            </a>
                            <a href="#!" class="btn hero-action__asking">
                                Ask a Question
                            </a>
                        </div>
                    </section>
                    <!-- Hero media -->
                    <figure class="hero__media">
                        <img
                            src="./assets/image/hero-img-02.png"
                            alt="Online catalog management tool"
                            class="hero__media-img"
                        />
                    </figure>
                </div>
            </div>
        </section>

        <!-- Main -->
        <main>
            <!-- Sales -->
            <section class="sale">
                <div class="container">
                    <h2 class="section-heading">
                        Merchandising to increase sales.
                    </h2>
                    <div class="sale__row">
                        <!-- Sale item 1 -->
                        <section class="sale-item">
                            <img
                                src="./assets/icons/sales-rate.svg"
                                alt="Conversion rate skyrockets."
                                class="sale-item__img"
                            />
                            <h3 class="sale-item__title">
                                Conversion rate skyrockets.
                            </h3>
                            <p class="sale-item__desc">
                                Convert more online sales with our visual
                                merchandising interface.
                            </p>
                        </section>

                        <!-- Sale item 2 -->
                        <section class="sale-item">
                            <img
                                src="./assets/icons/sales-average.svg"
                                alt="Increase average order value"
                                class="sale-item__img"
                            />
                            <h3 class="sale-item__title">
                                Increase average order value
                            </h3>
                            <p class="sale-item__desc">
                                Increase average order value of your online
                                store by 17% with this little trick.
                            </p>
                        </section>

                        <!-- Sale item 3 -->
                        <section class="sale-item">
                            <img
                                src="./assets/icons/sales-time.svg"
                                alt="Spend less time for management"
                                class="sale-item__img"
                            />
                            <h3 class="sale-item__title">
                                Spend less time for management
                            </h3>
                            <p class="sale-item__desc">
                                Let your employees spend less time managing the
                                online selling it.
                            </p>
                        </section>
                    </div>
                </div>
            </section>

            <!-- Works -->
            <section class="work">
                <div class="container">
                    <h2 class="section-heading">How Smaller works</h2>
                    <p class="work__desc section-desc">
                        Smaller is a cloud-based tool for merchandisers and
                        eCommerce professionals.
                    </p>
                    <!-- Work list -->
                    <div class="work__list">
                        <!-- Work item 1 -->
                        <div class="work-item">
                            <figure class="work-item__media">
                                <img
                                    src="./assets/image/works-img-01.png"
                                    alt="Set basic sorting rules for&nbsp;any categories"
                                    class="work-item__img"
                                />
                            </figure>
                            <div
                                class="work-item__progress work-item__progress--active"
                                style="--height: 254px"
                            >
                                1
                            </div>
                            <div class="work-item__content">
                                <h3 class="work-item__title">
                                    Set basic sorting rules for&nbsp;any
                                    categories
                                </h3>
                                <p class="work-item__desc">
                                    Bulk sort products on any category page you
                                    need, combine different sort rules:
                                </p>

                                <ul class="work-item__list">
                                    <li
                                        class="work-item__list-item strong-text"
                                    >
                                        Newest
                                    </li>

                                    <li
                                        class="work-item__list-item strong-text"
                                    >
                                        Bestseller
                                    </li>

                                    <li
                                        class="work-item__list-item strong-text"
                                    >
                                        Most reviewable
                                    </li>

                                    <li
                                        class="work-item__list-item strong-text"
                                    >
                                        Price
                                    </li>

                                    <li
                                        class="work-item__list-item strong-text"
                                    >
                                        Custom Attribute
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <!-- Work item 2 -->
                        <div class="work-item">
                            <figure class="work-item__media">
                                <img
                                    src="./assets/image/works-img-02.png"
                                    alt="Drag and Drop catalog management"
                                    class="work-item__img"
                                />
                            </figure>
                            <div class="work-item__progress">2</div>
                            <div class="work-item__content">
                                <h3 class="work-item__title">
                                    Drag and Drop catalog management
                                </h3>
                                <p class="work-item__desc">
                                    Use the Drag and Drop function to sort your
                                    products in the most intuitive, quickest
                                    way.
                                </p>
                                <p class="work-item__desc">
                                    Set scores for products by adding number,
                                    SKUs with higher scores will be displayed on
                                    top of the category pages.
                                </p>
                            </div>
                        </div>

                        <!-- Work item 3 -->
                        <div class="work-item">
                            <figure class="work-item__media">
                                <img
                                    src="./assets/image/works-img-03.png"
                                    alt="Limit and add product groups per category pages"
                                    class="work-item__img"
                                />
                            </figure>
                            <div class="work-item__progress">3</div>
                            <div class="work-item__content">
                                <h3 class="work-item__title">
                                    Limit and add product groups per category
                                    pages
                                </h3>
                                <p class="work-item__desc">
                                    Achieve a certain variety on your catalog
                                    pages:
                                </p>

                                <ul class="work-item__list">
                                    <li class="work-item__list-item">
                                        Ensure the page does not contain
                                        identical
                                        products:&nbsp;same&nbsp;color, style or
                                        type.
                                    </li>

                                    <li class="work-item__list-item">
                                        Hide and add the desired products or
                                        product
                                        groups&nbsp;on&nbsp;the&nbsp;category
                                        page.
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <!-- Work item 4 -->
                        <div class="work-item">
                            <figure class="work-item__media">
                                <img
                                    src="./assets/image/works-img-04.png"
                                    alt="Control poor-selling products"
                                    class="work-item__img"
                                />
                            </figure>
                            <div class="work-item__progress">4</div>
                            <div class="work-item__content">
                                <h3 class="work-item__title">
                                    Control poor-selling products
                                </h3>
                                <p class="work-item__desc">
                                    Sortler provides flexible features for the
                                    management of your low-selling items.
                                </p>

                                <ul class="work-item__list">
                                    <li
                                        class="work-item__list-item strong-text"
                                    >
                                        Tracking low-selling items
                                    </li>

                                    <li
                                        class="work-item__list-item strong-text"
                                    >
                                        Raising the item position to the top.
                                    </li>

                                    <li
                                        class="work-item__list-item strong-text"
                                    >
                                        Most Applying discounts
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <!-- Work item 5 -->
                        <div class="work-item">
                            <figure class="work-item__media">
                                <img
                                    src="./assets/image/works-img-05.png"
                                    alt="Create rules of low-stock and out-of-stock products"
                                    class="work-item__img"
                                />
                            </figure>
                            <div class="work-item__progress">5</div>
                            <div class="work-item__content">
                                <h3 class="work-item__title">
                                    Create rules of low-stock and out-of-stock
                                    products
                                </h3>
                                <p class="work-item__desc">
                                    Place low-stock items at the top of your
                                    product list. Move out-of-stock products
                                    down the catalog.
                                </p>

                                <ul class="work-item__list">
                                    <li class="work-item__list-item">
                                        <strong class="strong-text white-text">
                                            Place low-stock
                                        </strong>
                                        items at the top of your product list.
                                        Move out-of-stock products down the
                                        catalog.
                                    </li>

                                    <li class="work-item__list-item">
                                        <strong class="strong-text white-text">
                                            Create rules
                                        </strong>
                                        for applying discounts in your catalog.
                                        Simplify loyalty program management,
                                        thereby increasing sales.
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Benefits -->
            <section class="benefit">
                <div class="container">
                    <h2 class="section-heading">Benefits</h2>
                    <div class="benefit__list">
                        <!-- Benefit item 1 -->
                        <article class="benefit-item">
                            <div class="benefit-item__img-wrap">
                                <img
                                    src="./assets/icons/benefits-icon-01.svg"
                                    alt="Compatibility"
                                    class="benefit__item-img"
                                />
                            </div>
                            <h3 class="benefit-item__title">Compatibility</h3>
                            <p class="benefit-item__desc">
                                Sortler supports all popular eCommerce
                                solutions, including Magento, Shopify,
                                WooCommerce, BigCommerce.
                            </p>
                        </article>

                        <!-- Benefit item 2 -->
                        <article class="benefit-item">
                            <div class="benefit-item__img-wrap">
                                <img
                                    src="./assets/icons/benefits-icon-02.svg"
                                    alt="Simplified merchandising"
                                    class="benefit__item-img"
                                />
                            </div>
                            <h3 class="benefit-item__title">
                                Simplified merchandising
                            </h3>
                            <p class="benefit-item__desc">
                                Your employees, work faster and the less time
                                they spend on online visual merchandising tasks.
                            </p>
                        </article>

                        <!-- Benefit item 3 -->
                        <article class="benefit-item">
                            <div class="benefit-item__img-wrap">
                                <img
                                    src="./assets/icons/benefits-icon-03.svg"
                                    alt="No Coding Required"
                                    class="benefit__item-img"
                                />
                            </div>
                            <h3 class="benefit-item__title">
                                No Coding Required
                            </h3>
                            <p class="benefit-item__desc">
                                Everything is designed in such a way as to put
                                the smart sorting system into operation without
                                delay.
                            </p>
                        </article>

                        <!-- Benefit item 4 -->
                        <article class="benefit-item">
                            <div class="benefit-item__img-wrap">
                                <img
                                    src="./assets/icons/benefits-icon-04.svg"
                                    alt="Built-in emulator"
                                    class="benefit__item-img"
                                />
                            </div>
                            <h3 class="benefit-item__title">
                                Built-in emulator
                            </h3>
                            <p class="benefit-item__desc">
                                Sortler provides you with a special emulator
                                that shows all changes before they are applied
                                to your live website.
                            </p>
                        </article>

                        <!-- Benefit item 5 -->
                        <article class="benefit-item">
                            <div class="benefit-item__img-wrap">
                                <img
                                    src="./assets/icons/benefits-icon-05.svg"
                                    alt="Backup feature"
                                    class="benefit__item-img"
                                />
                            </div>
                            <h3 class="benefit-item__title">Backup feature</h3>
                            <p class="benefit-item__desc">
                                Our visual product sorting tool has
                                a&nbsp;backup feature to undo the changes made.
                                So you actually risk nothing.
                            </p>
                        </article>

                        <!-- Benefit item 6 -->
                        <article class="benefit-item">
                            <div class="benefit-item__img-wrap">
                                <img
                                    src="./assets/icons/benefits-icon-06.svg"
                                    alt="Round-the-clock support"
                                    class="benefit__item-img"
                                />
                            </div>
                            <h3 class="benefit-item__title">
                                Round-the-clock support
                            </h3>
                            <p class="benefit-item__desc">
                                Being in touch 24/7, we're ready to answer your
                                questions in real-time, whenever you need.
                            </p>
                        </article>
                    </div>
                </div>
            </section>

            <!-- Pricing -->
            <section id="price">
                <div class="container">
                    <div class="price__inner">
                        <h2 class="price__heading section-heading">
                            Simple pricing
                        </h2>
                        <p class="price__desc section-desc">
                            No credit card required. Cancel any time.
                        </p>
                        <div class="price__list">
                            <!-- Price item 1 -->
                            <article class="price-item">
                                <div class="price-item__inner">
                                    <div class="price-item__header">
                                        <img
                                            src="./assets/icons/pricing-icon-01.png"
                                            alt="Free"
                                            class="price-item__img"
                                        />
                                        <p class="price-item__title">Free</p>
                                    </div>
                                    <p class="price-item__desc">
                                        Starter plan to manage your one category
                                        and try everything Sortler has to offer
                                    </p>
                                    <p class="price-item__expense">
                                        $<strong class="price-item__value">
                                            0
                                        </strong>
                                        / free forever
                                    </p>
                                    <a href="#!" class="price-item__cta btn">
                                        Book a Demo
                                    </a>
                                    <ul class="price-item__list">
                                        <li class="price-item__list-item">
                                            <span class="price-item__icon">
                                                <svg
                                                    width="18"
                                                    height="18"
                                                    viewBox="0 0 18 18"
                                                    fill="currentColor"
                                                    xmlns="http://www.w3.org/2000/svg"
                                                >
                                                    <path
                                                        d="M16.5 5C16.5 5.51171 16.3902 5.99776 16.1928 6.43589C17.2704 7.03251 18 8.18105 18 9.5C18 10.7111 17.3849 11.7786 16.45 12.4069C16.4829 12.5997 16.5 12.7978 16.5 13C16.5 14.933 14.933 16.5 13 16.5C12.6428 16.5 12.2981 16.4465 11.9735 16.3471C11.3557 17.3395 10.255 18 9 18C7.74499 18 6.64426 17.3395 6.0265 16.3471C5.70188 16.4465 5.35719 16.5 5 16.5C3.067 16.5 1.5 14.933 1.5 13C1.5 12.7978 1.51714 12.5997 1.55004 12.4069C0.615145 11.7786 0 10.7111 0 9.5C0 8.18105 0.729563 7.0325 1.80715 6.43589C1.60981 5.99776 1.5 5.5117 1.5 5C1.5 3.067 3.067 1.5 5 1.5C5.35719 1.5 5.70188 1.55351 6.0265 1.65294C6.64426 0.660546 7.74499 0 9 0C10.255 0 11.3557 0.660548 11.9735 1.65294C12.2981 1.55351 12.6428 1.5 13 1.5C14.933 1.5 16.5 3.067 16.5 5Z"
                                                        fill="currentColor"
                                                    ></path>
                                                    <path
                                                        d="M6 10L8 12L12 6"
                                                        stroke="white"
                                                        stroke-width="1.5"
                                                        stroke-linecap="round"
                                                        stroke-linejoin="round"
                                                    ></path>
                                                </svg>
                                            </span>

                                            <span class="price-item__text">
                                                Up to 1K products included
                                            </span>
                                        </li>

                                        <li class="price-item__list-item">
                                            <span class="price-item__icon">
                                                <svg
                                                    width="18"
                                                    height="18"
                                                    viewBox="0 0 18 18"
                                                    fill="currentColor"
                                                    xmlns="http://www.w3.org/2000/svg"
                                                >
                                                    <path
                                                        d="M16.5 5C16.5 5.51171 16.3902 5.99776 16.1928 6.43589C17.2704 7.03251 18 8.18105 18 9.5C18 10.7111 17.3849 11.7786 16.45 12.4069C16.4829 12.5997 16.5 12.7978 16.5 13C16.5 14.933 14.933 16.5 13 16.5C12.6428 16.5 12.2981 16.4465 11.9735 16.3471C11.3557 17.3395 10.255 18 9 18C7.74499 18 6.64426 17.3395 6.0265 16.3471C5.70188 16.4465 5.35719 16.5 5 16.5C3.067 16.5 1.5 14.933 1.5 13C1.5 12.7978 1.51714 12.5997 1.55004 12.4069C0.615145 11.7786 0 10.7111 0 9.5C0 8.18105 0.729563 7.0325 1.80715 6.43589C1.60981 5.99776 1.5 5.5117 1.5 5C1.5 3.067 3.067 1.5 5 1.5C5.35719 1.5 5.70188 1.55351 6.0265 1.65294C6.64426 0.660546 7.74499 0 9 0C10.255 0 11.3557 0.660548 11.9735 1.65294C12.2981 1.55351 12.6428 1.5 13 1.5C14.933 1.5 16.5 3.067 16.5 5Z"
                                                        fill="currentColor"
                                                    ></path>
                                                    <path
                                                        d="M6 10L8 12L12 6"
                                                        stroke="white"
                                                        stroke-width="1.5"
                                                        stroke-linecap="round"
                                                        stroke-linejoin="round"
                                                    ></path>
                                                </svg>
                                            </span>

                                            <span class="price-item__text">
                                                1 category included
                                            </span>
                                        </li>

                                        <li class="price-item__list-item">
                                            <span class="price-item__icon">
                                                <svg
                                                    width="18"
                                                    height="18"
                                                    viewBox="0 0 18 18"
                                                    fill="currentColor"
                                                    xmlns="http://www.w3.org/2000/svg"
                                                >
                                                    <path
                                                        d="M16.5 5C16.5 5.51171 16.3902 5.99776 16.1928 6.43589C17.2704 7.03251 18 8.18105 18 9.5C18 10.7111 17.3849 11.7786 16.45 12.4069C16.4829 12.5997 16.5 12.7978 16.5 13C16.5 14.933 14.933 16.5 13 16.5C12.6428 16.5 12.2981 16.4465 11.9735 16.3471C11.3557 17.3395 10.255 18 9 18C7.74499 18 6.64426 17.3395 6.0265 16.3471C5.70188 16.4465 5.35719 16.5 5 16.5C3.067 16.5 1.5 14.933 1.5 13C1.5 12.7978 1.51714 12.5997 1.55004 12.4069C0.615145 11.7786 0 10.7111 0 9.5C0 8.18105 0.729563 7.0325 1.80715 6.43589C1.60981 5.99776 1.5 5.5117 1.5 5C1.5 3.067 3.067 1.5 5 1.5C5.35719 1.5 5.70188 1.55351 6.0265 1.65294C6.64426 0.660546 7.74499 0 9 0C10.255 0 11.3557 0.660548 11.9735 1.65294C12.2981 1.55351 12.6428 1.5 13 1.5C14.933 1.5 16.5 3.067 16.5 5Z"
                                                        fill="currentColor"
                                                    ></path>
                                                    <path
                                                        d="M6 10L8 12L12 6"
                                                        stroke="white"
                                                        stroke-width="1.5"
                                                        stroke-linecap="round"
                                                        stroke-linejoin="round"
                                                    ></path>
                                                </svg>
                                            </span>

                                            <span class="price-item__text">
                                                1 staff account included
                                            </span>
                                        </li>

                                        <li class="price-item__list-item">
                                            <span class="price-item__icon">
                                                <svg
                                                    width="18"
                                                    height="18"
                                                    viewBox="0 0 18 18"
                                                    fill="currentColor"
                                                    xmlns="http://www.w3.org/2000/svg"
                                                >
                                                    <path
                                                        d="M16.5 5C16.5 5.51171 16.3902 5.99776 16.1928 6.43589C17.2704 7.03251 18 8.18105 18 9.5C18 10.7111 17.3849 11.7786 16.45 12.4069C16.4829 12.5997 16.5 12.7978 16.5 13C16.5 14.933 14.933 16.5 13 16.5C12.6428 16.5 12.2981 16.4465 11.9735 16.3471C11.3557 17.3395 10.255 18 9 18C7.74499 18 6.64426 17.3395 6.0265 16.3471C5.70188 16.4465 5.35719 16.5 5 16.5C3.067 16.5 1.5 14.933 1.5 13C1.5 12.7978 1.51714 12.5997 1.55004 12.4069C0.615145 11.7786 0 10.7111 0 9.5C0 8.18105 0.729563 7.0325 1.80715 6.43589C1.60981 5.99776 1.5 5.5117 1.5 5C1.5 3.067 3.067 1.5 5 1.5C5.35719 1.5 5.70188 1.55351 6.0265 1.65294C6.64426 0.660546 7.74499 0 9 0C10.255 0 11.3557 0.660548 11.9735 1.65294C12.2981 1.55351 12.6428 1.5 13 1.5C14.933 1.5 16.5 3.067 16.5 5Z"
                                                        fill="currentColor"
                                                    ></path>
                                                    <path
                                                        d="M6 10L8 12L12 6"
                                                        stroke="white"
                                                        stroke-width="1.5"
                                                        stroke-linecap="round"
                                                        stroke-linejoin="round"
                                                    ></path>
                                                </svg>
                                            </span>

                                            <span class="price-item__text">
                                                Indexation: ones a day
                                            </span>
                                        </li>
                                    </ul>
                                </div>
                            </article>

                            <!-- Price item 2 -->
                            <article class="price-item--active price-item">
                                <div class="price-item__inner">
                                    <div class="price-item__header">
                                        <img
                                            src="./assets/icons/pricing-icon-02.png"
                                            alt="Business"
                                            class="price-item__img"
                                        />
                                        <p class="price-item__title">
                                            Business
                                        </p>
                                    </div>
                                    <p class="price-item__desc">
                                        More power with thouthands products and
                                        dozens of categories
                                    </p>
                                    <p class="price-item__expense">
                                        $<strong class="price-item__value">
                                            39
                                        </strong>
                                        / month billed monthly
                                    </p>
                                    <a href="#!" class="price-item__cta btn">
                                        Book a Demo
                                    </a>
                                    <ul class="price-item__list">
                                        <li class="price-item__list-item">
                                            <span class="price-item__icon">
                                                <svg
                                                    width="18"
                                                    height="18"
                                                    viewBox="0 0 18 18"
                                                    fill="currentColor"
                                                    xmlns="http://www.w3.org/2000/svg"
                                                >
                                                    <path
                                                        d="M16.5 5C16.5 5.51171 16.3902 5.99776 16.1928 6.43589C17.2704 7.03251 18 8.18105 18 9.5C18 10.7111 17.3849 11.7786 16.45 12.4069C16.4829 12.5997 16.5 12.7978 16.5 13C16.5 14.933 14.933 16.5 13 16.5C12.6428 16.5 12.2981 16.4465 11.9735 16.3471C11.3557 17.3395 10.255 18 9 18C7.74499 18 6.64426 17.3395 6.0265 16.3471C5.70188 16.4465 5.35719 16.5 5 16.5C3.067 16.5 1.5 14.933 1.5 13C1.5 12.7978 1.51714 12.5997 1.55004 12.4069C0.615145 11.7786 0 10.7111 0 9.5C0 8.18105 0.729563 7.0325 1.80715 6.43589C1.60981 5.99776 1.5 5.5117 1.5 5C1.5 3.067 3.067 1.5 5 1.5C5.35719 1.5 5.70188 1.55351 6.0265 1.65294C6.64426 0.660546 7.74499 0 9 0C10.255 0 11.3557 0.660548 11.9735 1.65294C12.2981 1.55351 12.6428 1.5 13 1.5C14.933 1.5 16.5 3.067 16.5 5Z"
                                                        fill="currentColor"
                                                    ></path>
                                                    <path
                                                        d="M6 10L8 12L12 6"
                                                        stroke="white"
                                                        stroke-width="1.5"
                                                        stroke-linecap="round"
                                                        stroke-linejoin="round"
                                                    ></path>
                                                </svg>
                                            </span>

                                            <span class="price-item__text">
                                                Up to 100K products included
                                            </span>
                                        </li>

                                        <li class="price-item__list-item">
                                            <span class="price-item__icon">
                                                <svg
                                                    width="18"
                                                    height="18"
                                                    viewBox="0 0 18 18"
                                                    fill="currentColor"
                                                    xmlns="http://www.w3.org/2000/svg"
                                                >
                                                    <path
                                                        d="M16.5 5C16.5 5.51171 16.3902 5.99776 16.1928 6.43589C17.2704 7.03251 18 8.18105 18 9.5C18 10.7111 17.3849 11.7786 16.45 12.4069C16.4829 12.5997 16.5 12.7978 16.5 13C16.5 14.933 14.933 16.5 13 16.5C12.6428 16.5 12.2981 16.4465 11.9735 16.3471C11.3557 17.3395 10.255 18 9 18C7.74499 18 6.64426 17.3395 6.0265 16.3471C5.70188 16.4465 5.35719 16.5 5 16.5C3.067 16.5 1.5 14.933 1.5 13C1.5 12.7978 1.51714 12.5997 1.55004 12.4069C0.615145 11.7786 0 10.7111 0 9.5C0 8.18105 0.729563 7.0325 1.80715 6.43589C1.60981 5.99776 1.5 5.5117 1.5 5C1.5 3.067 3.067 1.5 5 1.5C5.35719 1.5 5.70188 1.55351 6.0265 1.65294C6.64426 0.660546 7.74499 0 9 0C10.255 0 11.3557 0.660548 11.9735 1.65294C12.2981 1.55351 12.6428 1.5 13 1.5C14.933 1.5 16.5 3.067 16.5 5Z"
                                                        fill="currentColor"
                                                    ></path>
                                                    <path
                                                        d="M6 10L8 12L12 6"
                                                        stroke="white"
                                                        stroke-width="1.5"
                                                        stroke-linecap="round"
                                                        stroke-linejoin="round"
                                                    ></path>
                                                </svg>
                                            </span>

                                            <span class="price-item__text">
                                                50 category included
                                            </span>
                                        </li>

                                        <li class="price-item__list-item">
                                            <span class="price-item__icon">
                                                <svg
                                                    width="18"
                                                    height="18"
                                                    viewBox="0 0 18 18"
                                                    fill="currentColor"
                                                    xmlns="http://www.w3.org/2000/svg"
                                                >
                                                    <path
                                                        d="M16.5 5C16.5 5.51171 16.3902 5.99776 16.1928 6.43589C17.2704 7.03251 18 8.18105 18 9.5C18 10.7111 17.3849 11.7786 16.45 12.4069C16.4829 12.5997 16.5 12.7978 16.5 13C16.5 14.933 14.933 16.5 13 16.5C12.6428 16.5 12.2981 16.4465 11.9735 16.3471C11.3557 17.3395 10.255 18 9 18C7.74499 18 6.64426 17.3395 6.0265 16.3471C5.70188 16.4465 5.35719 16.5 5 16.5C3.067 16.5 1.5 14.933 1.5 13C1.5 12.7978 1.51714 12.5997 1.55004 12.4069C0.615145 11.7786 0 10.7111 0 9.5C0 8.18105 0.729563 7.0325 1.80715 6.43589C1.60981 5.99776 1.5 5.5117 1.5 5C1.5 3.067 3.067 1.5 5 1.5C5.35719 1.5 5.70188 1.55351 6.0265 1.65294C6.64426 0.660546 7.74499 0 9 0C10.255 0 11.3557 0.660548 11.9735 1.65294C12.2981 1.55351 12.6428 1.5 13 1.5C14.933 1.5 16.5 3.067 16.5 5Z"
                                                        fill="currentColor"
                                                    ></path>
                                                    <path
                                                        d="M6 10L8 12L12 6"
                                                        stroke="white"
                                                        stroke-width="1.5"
                                                        stroke-linecap="round"
                                                        stroke-linejoin="round"
                                                    ></path>
                                                </svg>
                                            </span>

                                            <span class="price-item__text">
                                                3 staff account included
                                            </span>
                                        </li>

                                        <li class="price-item__list-item">
                                            <span class="price-item__icon">
                                                <svg
                                                    width="18"
                                                    height="18"
                                                    viewBox="0 0 18 18"
                                                    fill="currentColor"
                                                    xmlns="http://www.w3.org/2000/svg"
                                                >
                                                    <path
                                                        d="M16.5 5C16.5 5.51171 16.3902 5.99776 16.1928 6.43589C17.2704 7.03251 18 8.18105 18 9.5C18 10.7111 17.3849 11.7786 16.45 12.4069C16.4829 12.5997 16.5 12.7978 16.5 13C16.5 14.933 14.933 16.5 13 16.5C12.6428 16.5 12.2981 16.4465 11.9735 16.3471C11.3557 17.3395 10.255 18 9 18C7.74499 18 6.64426 17.3395 6.0265 16.3471C5.70188 16.4465 5.35719 16.5 5 16.5C3.067 16.5 1.5 14.933 1.5 13C1.5 12.7978 1.51714 12.5997 1.55004 12.4069C0.615145 11.7786 0 10.7111 0 9.5C0 8.18105 0.729563 7.0325 1.80715 6.43589C1.60981 5.99776 1.5 5.5117 1.5 5C1.5 3.067 3.067 1.5 5 1.5C5.35719 1.5 5.70188 1.55351 6.0265 1.65294C6.64426 0.660546 7.74499 0 9 0C10.255 0 11.3557 0.660548 11.9735 1.65294C12.2981 1.55351 12.6428 1.5 13 1.5C14.933 1.5 16.5 3.067 16.5 5Z"
                                                        fill="currentColor"
                                                    ></path>
                                                    <path
                                                        d="M6 10L8 12L12 6"
                                                        stroke="white"
                                                        stroke-width="1.5"
                                                        stroke-linecap="round"
                                                        stroke-linejoin="round"
                                                    ></path>
                                                </svg>
                                            </span>

                                            <span class="price-item__text">
                                                Indexation: twice a day
                                            </span>
                                        </li>
                                    </ul>
                                </div>
                            </article>

                            <!-- Price item 3 -->
                            <article class="price-item">
                                <div class="price-item__inner">
                                    <div class="price-item__header">
                                        <img
                                            src="./assets/icons/pricing-icon-03.png"
                                            alt="Advanced"
                                            class="price-item__img"
                                        />
                                        <p class="price-item__title">
                                            Advanced
                                        </p>
                                    </div>
                                    <p class="price-item__desc">
                                        A lot of categories and products,
                                        premium support and more...
                                    </p>
                                    <p class="price-item__expense">
                                        $<strong class="price-item__value">
                                            99
                                        </strong>
                                        / month billed monthly
                                    </p>
                                    <a href="#!" class="price-item__cta btn">
                                        Book a Demo
                                    </a>
                                    <ul class="price-item__list">
                                        <li class="price-item__list-item">
                                            <span class="price-item__icon">
                                                <svg
                                                    width="18"
                                                    height="18"
                                                    viewBox="0 0 18 18"
                                                    fill="currentColor"
                                                    xmlns="http://www.w3.org/2000/svg"
                                                >
                                                    <path
                                                        d="M16.5 5C16.5 5.51171 16.3902 5.99776 16.1928 6.43589C17.2704 7.03251 18 8.18105 18 9.5C18 10.7111 17.3849 11.7786 16.45 12.4069C16.4829 12.5997 16.5 12.7978 16.5 13C16.5 14.933 14.933 16.5 13 16.5C12.6428 16.5 12.2981 16.4465 11.9735 16.3471C11.3557 17.3395 10.255 18 9 18C7.74499 18 6.64426 17.3395 6.0265 16.3471C5.70188 16.4465 5.35719 16.5 5 16.5C3.067 16.5 1.5 14.933 1.5 13C1.5 12.7978 1.51714 12.5997 1.55004 12.4069C0.615145 11.7786 0 10.7111 0 9.5C0 8.18105 0.729563 7.0325 1.80715 6.43589C1.60981 5.99776 1.5 5.5117 1.5 5C1.5 3.067 3.067 1.5 5 1.5C5.35719 1.5 5.70188 1.55351 6.0265 1.65294C6.64426 0.660546 7.74499 0 9 0C10.255 0 11.3557 0.660548 11.9735 1.65294C12.2981 1.55351 12.6428 1.5 13 1.5C14.933 1.5 16.5 3.067 16.5 5Z"
                                                        fill="currentColor"
                                                    ></path>
                                                    <path
                                                        d="M6 10L8 12L12 6"
                                                        stroke="white"
                                                        stroke-width="1.5"
                                                        stroke-linecap="round"
                                                        stroke-linejoin="round"
                                                    ></path>
                                                </svg>
                                            </span>

                                            <span class="price-item__text">
                                                Up to 200K products included
                                            </span>
                                        </li>

                                        <li class="price-item__list-item">
                                            <span class="price-item__icon">
                                                <svg
                                                    width="18"
                                                    height="18"
                                                    viewBox="0 0 18 18"
                                                    fill="currentColor"
                                                    xmlns="http://www.w3.org/2000/svg"
                                                >
                                                    <path
                                                        d="M16.5 5C16.5 5.51171 16.3902 5.99776 16.1928 6.43589C17.2704 7.03251 18 8.18105 18 9.5C18 10.7111 17.3849 11.7786 16.45 12.4069C16.4829 12.5997 16.5 12.7978 16.5 13C16.5 14.933 14.933 16.5 13 16.5C12.6428 16.5 12.2981 16.4465 11.9735 16.3471C11.3557 17.3395 10.255 18 9 18C7.74499 18 6.64426 17.3395 6.0265 16.3471C5.70188 16.4465 5.35719 16.5 5 16.5C3.067 16.5 1.5 14.933 1.5 13C1.5 12.7978 1.51714 12.5997 1.55004 12.4069C0.615145 11.7786 0 10.7111 0 9.5C0 8.18105 0.729563 7.0325 1.80715 6.43589C1.60981 5.99776 1.5 5.5117 1.5 5C1.5 3.067 3.067 1.5 5 1.5C5.35719 1.5 5.70188 1.55351 6.0265 1.65294C6.64426 0.660546 7.74499 0 9 0C10.255 0 11.3557 0.660548 11.9735 1.65294C12.2981 1.55351 12.6428 1.5 13 1.5C14.933 1.5 16.5 3.067 16.5 5Z"
                                                        fill="currentColor"
                                                    ></path>
                                                    <path
                                                        d="M6 10L8 12L12 6"
                                                        stroke="white"
                                                        stroke-width="1.5"
                                                        stroke-linecap="round"
                                                        stroke-linejoin="round"
                                                    ></path>
                                                </svg>
                                            </span>

                                            <span class="price-item__text">
                                                100 category included
                                            </span>
                                        </li>

                                        <li class="price-item__list-item">
                                            <span class="price-item__icon">
                                                <svg
                                                    width="18"
                                                    height="18"
                                                    viewBox="0 0 18 18"
                                                    fill="currentColor"
                                                    xmlns="http://www.w3.org/2000/svg"
                                                >
                                                    <path
                                                        d="M16.5 5C16.5 5.51171 16.3902 5.99776 16.1928 6.43589C17.2704 7.03251 18 8.18105 18 9.5C18 10.7111 17.3849 11.7786 16.45 12.4069C16.4829 12.5997 16.5 12.7978 16.5 13C16.5 14.933 14.933 16.5 13 16.5C12.6428 16.5 12.2981 16.4465 11.9735 16.3471C11.3557 17.3395 10.255 18 9 18C7.74499 18 6.64426 17.3395 6.0265 16.3471C5.70188 16.4465 5.35719 16.5 5 16.5C3.067 16.5 1.5 14.933 1.5 13C1.5 12.7978 1.51714 12.5997 1.55004 12.4069C0.615145 11.7786 0 10.7111 0 9.5C0 8.18105 0.729563 7.0325 1.80715 6.43589C1.60981 5.99776 1.5 5.5117 1.5 5C1.5 3.067 3.067 1.5 5 1.5C5.35719 1.5 5.70188 1.55351 6.0265 1.65294C6.64426 0.660546 7.74499 0 9 0C10.255 0 11.3557 0.660548 11.9735 1.65294C12.2981 1.55351 12.6428 1.5 13 1.5C14.933 1.5 16.5 3.067 16.5 5Z"
                                                        fill="currentColor"
                                                    ></path>
                                                    <path
                                                        d="M6 10L8 12L12 6"
                                                        stroke="white"
                                                        stroke-width="1.5"
                                                        stroke-linecap="round"
                                                        stroke-linejoin="round"
                                                    ></path>
                                                </svg>
                                            </span>

                                            <span class="price-item__text">
                                                5 staff account included
                                            </span>
                                        </li>

                                        <li class="price-item__list-item">
                                            <span class="price-item__icon">
                                                <svg
                                                    width="18"
                                                    height="18"
                                                    viewBox="0 0 18 18"
                                                    fill="currentColor"
                                                    xmlns="http://www.w3.org/2000/svg"
                                                >
                                                    <path
                                                        d="M16.5 5C16.5 5.51171 16.3902 5.99776 16.1928 6.43589C17.2704 7.03251 18 8.18105 18 9.5C18 10.7111 17.3849 11.7786 16.45 12.4069C16.4829 12.5997 16.5 12.7978 16.5 13C16.5 14.933 14.933 16.5 13 16.5C12.6428 16.5 12.2981 16.4465 11.9735 16.3471C11.3557 17.3395 10.255 18 9 18C7.74499 18 6.64426 17.3395 6.0265 16.3471C5.70188 16.4465 5.35719 16.5 5 16.5C3.067 16.5 1.5 14.933 1.5 13C1.5 12.7978 1.51714 12.5997 1.55004 12.4069C0.615145 11.7786 0 10.7111 0 9.5C0 8.18105 0.729563 7.0325 1.80715 6.43589C1.60981 5.99776 1.5 5.5117 1.5 5C1.5 3.067 3.067 1.5 5 1.5C5.35719 1.5 5.70188 1.55351 6.0265 1.65294C6.64426 0.660546 7.74499 0 9 0C10.255 0 11.3557 0.660548 11.9735 1.65294C12.2981 1.55351 12.6428 1.5 13 1.5C14.933 1.5 16.5 3.067 16.5 5Z"
                                                        fill="currentColor"
                                                    ></path>
                                                    <path
                                                        d="M6 10L8 12L12 6"
                                                        stroke="white"
                                                        stroke-width="1.5"
                                                        stroke-linecap="round"
                                                        stroke-linejoin="round"
                                                    ></path>
                                                </svg>
                                            </span>

                                            <span class="price-item__text">
                                                Indexation: each hour
                                            </span>
                                        </li>
                                    </ul>
                                </div>
                            </article>
                        </div>
                    </div>
                </div>
            </section>
        </main>

        <c:import url="./footer.jsp" />
    </body>
</html>
