<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page
contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Smaller</title>

        <!-- Reset CSS -->
        <link rel="stylesheet" href="./assets/css/reset.css" />

        <!-- Embed Fonts -->
        <link rel="preconnect" href="https://fonts.cdnfonts.com" />
        <link
            href="https://fonts.cdnfonts.com/css/roobert?styles=49579,49577,49581"
            rel="stylesheet"
        />

        <!-- Styles CSS -->
        <link rel="stylesheet" href="./assets/css/style.css" />
    </head>
    <body>
        <!-- Header -->
        <c:import url="./header.jsp" />

        <!-- Main -->
        <main>
            <section class="contact">
                <div class="container">
                    <h1 class="contact__heading">Contact With Us</h1>
                    <p class="contact__desc">
                        The right move at the right time saves your investment.
                        live the dream of expanding your business.
                    </p>
                    <form action="" method="POST" class="contact__form">
                        <div class="contact__form-group">
                            <input
                                type="text"
                                class="contact__form-input"
                                name="firstName"
                                id="firstName"
                                placeholder="First name"
                                required
                            />

                            <input
                                type="text"
                                class="contact__form-input"
                                name="lastName"
                                id="lastName"
                                placeholder="Last name"
                                required
                            />
                        </div>

                        <div class="contact__form-group">
                            <input
                                type="email"
                                class="contact__form-input"
                                name="email"
                                id="email"
                                placeholder="Your email"
                                required
                                pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$"
                            />

                            <input
                                type="tel"
                                class="contact__form-input"
                                name="phone"
                                id="phone"
                                placeholder="Phone number"
                                required
                                pattern="^(0|\+?84)(3|5|7|8|9)[0-9]{8}$"
                            />
                        </div>
                        <div class="contact__form-group">
                            <textarea
                                class="contact__form-textarea"
                                name="yourself"
                                id="yourself"
                                placeholder="Tell us about yourself"
                                minlength="10"
                            ></textarea>
                        </div>
                        <div class="contact__form-group">
                            <button
                                type="submit"
                                class="contact__form-submit btn--secondary"
                            >
                                Contact us
                            </button>
                        </div>
                    </form>
                </div>
            </section>
        </main>

        <!-- Footer -->
        <c:import url="./footer.jsp" />
    </body>
</html>
