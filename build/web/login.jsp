<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Bakery's Login</title>

        <!-- Embed Favicon -->
        <link
            rel="apple-touch-icon"
            sizes="57x57"
            href="./assets/favicon/apple-icon-57x57.png"
        />
        <link
            rel="apple-touch-icon"
            sizes="60x60"
            href="./assets/favicon/apple-icon-60x60.png"
        />
        <link
            rel="apple-touch-icon"
            sizes="72x72"
            href="./assets/favicon/apple-icon-72x72.png"
        />
        <link
            rel="apple-touch-icon"
            sizes="76x76"
            href="./assets/favicon/apple-icon-76x76.png"
        />
        <link
            rel="apple-touch-icon"
            sizes="114x114"
            href="./assets/favicon/apple-icon-114x114.png"
        />
        <link
            rel="apple-touch-icon"
            sizes="120x120"
            href="./assets/favicon/apple-icon-120x120.png"
        />
        <link
            rel="apple-touch-icon"
            sizes="144x144"
            href="./assets/favicon/apple-icon-144x144.png"
        />
        <link
            rel="apple-touch-icon"
            sizes="152x152"
            href="./assets/favicon/apple-icon-152x152.png"
        />
        <link
            rel="apple-touch-icon"
            sizes="180x180"
            href="./assets/favicon/apple-icon-180x180.png"
        />
        <link
            rel="icon"
            type="image/png"
            sizes="192x192"
            href="./assets/favicon/android-icon-192x192.png"
        />
        <link
            rel="icon"
            type="image/png"
            sizes="32x32"
            href="./assets/favicon/favicon-32x32.png"
        />
        <link
            rel="icon"
            type="image/png"
            sizes="96x96"
            href="./assets/favicon/favicon-96x96.png"
        />
        <link
            rel="icon"
            type="image/png"
            sizes="16x16"
            href="./assets/favicon/favicon-16x16.png"
        />
        <link rel="manifest" href="./assets/favicon/manifest.json" />
        <meta name="msapplication-TileColor" content="#ffffff" />
        <meta
            name="msapplication-TileImage"
            content="./assets/favicon/ms-icon-144x144.png"
        />
        <meta name="theme-color" content="#ffffff" />

        <!-- Embed Reset -->
        <link rel="stylesheet" href="./assets/css/reset.css" />

        <!-- Embed Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;600;800&family=Lora:wght@400;600;700&family=Syne:wght@700&display=swap"
            rel="stylesheet"
        />

        <!-- Embed Style -->
        <link rel="stylesheet" href="./assets/css/login.css" />
    </head>
    <body>
        <!-- Main Right-->
        <section class="signin">
            <div class="container">
                <div class="signin__inner">
                    <div class="signin__inner-left">
                        <div class="signin-left-content">
                            <h1 class="signin-left-title">
                                Welcome back to Kle's Bakery
                            </h1>
                            <p class="signin-left-desc">
                                Log In to buy something new and enjoy your time
                            </p>
                        </div>
                    </div>
                    <div class="signin__inner-right">
                        <form
                            class="signin__form"
                            action="MainController"
                            method="POST"
                        >
                            <h1 class="signin__heading">Sign In</h1>
                            <div class="signin__social">
                                <a href="" class="signin__link">
                                    <img
                                        src="./assets/icons/facebook.svg"
                                        alt=""
                                        class="facebook-img"
                                    />
                                    <p class="link-content">
                                        Continue with Facebook
                                    </p>
                                </a>
                                <a
                                    href="https://accounts.google.com/o/oauth2/auth?scope=profile%20email&redirect_uri=http://localhost:8084/Bakery/MainController?action=Google&response_type=code&client_id=285783151877-hvs57dvtmal99elb2gnpfcavh89mealc.apps.googleusercontent.com&approval_prompt=force"
                                    class="signin__link"
                                >
                                    
                                    <img
                                        src="./assets/icons/google.svg"
                                        alt=""
                                        class="google-img"
                                    />
                                    <p class="link-content">
                                        Continue with Google
                                    </p>
                                </a>
                                <a href="" class="signin__link">
                                    <img
                                        src="./assets/icons/apple.svg"
                                        alt=""
                                        class="apple-img"
                                    />
                                    <p class="link-content">
                                        Continue with Apple
                                    </p>
                                </a>
                            </div>
                            <p class="signin__option">OR</p>
                            <div class="signin__input">
                                <div>
                                    <input
                                        class="section-input signin__username"
                                        type="text"
                                        name="username"
                                        required=""
                                        placeholder="Username"
                                    />
                                </div>
                                <div>
                                    <input
                                        class="section-input signin__password"
                                        type="password"
                                        name="password"
                                        required=""
                                        placeholder="Password"
                                    />
                                </div>
                            </div>
                            <div class="signin__forget">
                                <a class="signin__forget-link" href=""
                                    >Forgot password?</a
                                >
                            </div>
                            <input
                                type="submit"
                                name="action"
                                value="Sign In"
                                class="signin__button btn"
                            />
                            <p class="signin__signup">
                                Don't a have account?
                                <a
                                    class="signin__signup-link"
                                    href="./register.html"
                                >
                                    Sign Up</a
                                >
                            </p>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
