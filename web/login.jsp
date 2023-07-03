<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Smaller</title>

        <!-- Embed Reset -->
        <link rel="stylesheet" href="./assets/css/reset.css" />

        <!-- Embed Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;600;800&family=Syne:wght@700&display=swap"
            rel="stylesheet"
        />

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
        <main class="signup">
            <div class="signup__inner">
                <section class="signup-left">
                    <div class="signup-left__inner">
                        <h1 class="signup-left__heading">
                            Welcome to Kle's Bakery
                        </h1>
                        <p class="signup-left__desc">
                            Sign in to enjoy your time
                        </p>
                    </div>
                </section>
                <section class="signup-right">
                    <form
                        class="signup-right__form"
                        action="MainController"
                        method="POST"
                    >
                        <a class="out" href="index.jsp"
                            ><img src="./assets/icons/x.svg" alt=""
                        /></a>
                        <h2 class="signup-right__heading">Sign In</h2>
                        <div>
                            <input
                                class="section-input signup__username"
                                type="text"
                                name="username"
                                required=""
                                placeholder="Username"
                            />
                        </div>
                        <div>
                            <input
                                class="section-input signup__username"
                                type="password"
                                name="password"
                                required=""
                                placeholder="Password"
                            />
                        </div>
                        <div>
                            <input type="hidden" name="action" value="Login" />
                            <button
                                type="submit"
                                class="signup__button btn-sign"
                            >
                                Sign in
                            </button>
                        </div>
                        <p class="signup-right__break">OR</p>
                        <div class="signup-right__link">
                            <a
                                href="https://accounts.google.com/o/oauth2/auth?scope=profile%20email&redirect_uri=http://localhost:8084/Bakery/MainController?action=Google&response_type=code&client_id=285783151877-hvs57dvtmal99elb2gnpfcavh89mealc.apps.googleusercontent.com&approval_prompt=force"
                                class="signup__link"
                            >
                                <img
                                    src="./assets/icons/google.svg"
                                    alt=""
                                    class="google-img"
                                />
                                <p class="link-content">Continue with Google</p>
                            </a>
                        </div>
                        <p class="signup-left__signup">
                            Don't have account?
                            <a
                                class="signup-left__signup-link"
                                href="register.jsp"
                            >
                                Sign up</a
                            >
                        </p>
                    </form>
                </section>
            </div>
        </main>
    </body>
</html>
