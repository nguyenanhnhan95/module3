<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
            crossorigin="anonymous"
    />
    <script
            defer
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js"
            integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ"
            crossorigin="anonymous"
    ></script>
    <script
            src="https://kit.fontawesome.com/4bf93b0ca4.js"
            crossorigin="anonymous"
    ></script>
    <title>Home</title>
</head>
<style>
    *,
    *::before,
    *::after {
        box-sizing: border-box;
    }

    * {
        padding: 0;
        margin: 0;
    }

    .message {
        background: black;
        text-align: center;
        color: white;
        padding: 0.5em 0;
        font-size: 14px;
    }

    p {
        margin: 0;
    }

    .logo {
        width: 150px;
    }

    .bag-icon {
        display: inline;
        margin-left: 1rem;
    }

    i {
        font-size: 1.5rem;
    }

    .card {
        border: none;
    }

    footer a {
        text-decoration: none;
        text-transform: uppercase;
        cursor: pointer;
        display: inline-block;
        color: black;
    }

    footer a:hover {
        color: palevioletred;
        text-decoration: underline;
    }

    .footer--text {
        color: gray;
        font-size: 0.85rem;
    }

    .links {
        font-size: 1.5rem;
        text-decoration: none;
        margin-left: 1.5rem;
        padding: 0;
        color: gray;
        font-weight: lighter;
    }

    .links:hover {
        color: palevioletred;
        text-decoration: underline;
    }

    .hamburger {
        background: white;
        border: none;
    }
    .sign-up button,
    .log-in button,
    .sign-up button:hover,
    .log-in button:hover {
        color: white;
    }

    @media (max-width: 768px) {
        .overlay--main {
            z-index: 999;
            position: absolute;
            top: 120px;
            bottom: 0;
            left: 0;
            right: 0;
            background: white;
            /*padding: .5em 1em;*/
        }
        .overlay--main a {
            font-size: 1.5rem;
            font-weight: lighter;
            text-decoration: none;
            color: black;
        }
    }
</style>

<body>
<div class="header">
    <div class="message">
        <p class="">
            NO ADDITIONAL CUSTOM FEES OR TAXES FOR OUR ASIA CUSTOMERS
        </p>
    </div>
    <!-- <div class="container-fluid">
      <img
        class="w-100"
        src="https://static.vecteezy.com/system/resources/previews/002/393/980/original/corporate-banner-with-modern-design-free-vector.jpg"
      />
    </div> -->
    <div class="container-fluid p-md-5 mt-1">
        <div
                class="row row-cols-3 justify-content-between align-items-center pt-2"
        >
            <div class="col col-auto d-block d-md-none">
                <button class="hamburger" onclick="switcher()">
                    <i class="fa fa-bars switcher-icon"></i>
                </button>
            </div>

            <div class="row col col-md-auto align-items-center">
                <div class="col col-auto">
                    <img
                            class="logo"
                            src="https://cdn.shopify.com/s/files/1/0554/1291/6301/files/JOJI_LOGO.png?v=1661459445&width=400"
                    />
                </div>
                <div class="col d-md-block d-none">
                    <a class="links" href="">SMITHEREENS</a>
                    <a class="links" href="">MERCH</a>
                    <a class="links" href="">MUSIC</a>
                </div>
            </div>

            <div class="col col-auto">
                <i class="far fa-user"></i>
                <i class="fa fa-shopping-bag bag-icon"></i>
            </div>
        </div>
    </div>
</div>

<section class="main">
    <div class="container">
        <div
                class="row row-cols-md-3 row-cols-2 justify-content-center gy-2 gx-3"
        >
            <div class="col">
                <div class="row justify-content-center">
                    <div class="card" style="width: 15rem">
                        <img
                                src="view/images/1.png"
                                class="card-img-top text-center"
                                alt="merch"
                        />
                        <div class="card-body">
                            <p class="card-text">SMITHEREENS Black Pullover Hoodie</p>
                            <p class="card-text">€<span>69.06</span> EUR</p>
                            <a href="#" class="btn btn-outline-success w-100 mt-1"
                            >Add to cart</a
                            >
                        </div>
                    </div>
                </div>
            </div>

            <div class="col">
                <div class="row justify-content-center">
                    <div class="card" style="width: 15rem">
                        <img
                                src="view/images/2.png"
                                class="card-img-top text-center"
                                alt="merch"
                        />
                        <div class="card-body">
                            <p class="card-text">SMITHEREENS Black Pullover Hoodie</p>
                            <p class="card-text">€<span>69.06</span> EUR</p>
                            <a href="#" class="btn btn-outline-success w-100 mt-1"
                            >Add to cart</a
                            >
                        </div>
                    </div>
                </div>
            </div>

            <div class="col">
                <div class="row justify-content-center">
                    <div class="card" style="width: 15rem">
                        <img
                                src="view/images/3.png"
                                class="card-img-top text-center"
                                alt="merch"
                        />
                        <div class="card-body">
                            <p class="card-text">SMITHEREENS Black Pullover Hoodie</p>
                            <p class="card-text">€<span>69.06</span> EUR</p>
                            <a href="#" class="btn btn-outline-success w-100 mt-1"
                            >Add to cart</a
                            >
                        </div>
                    </div>
                </div>
            </div>

            <div class="col">
                <div class="row justify-content-center">
                    <div class="card" style="width: 15rem">
                        <img
                                src="view/images/4.png"
                                class="card-img-top text-center"
                                alt="merch"
                        />
                        <div class="card-body">
                            <p class="card-text">SMITHEREENS Black Pullover Hoodie</p>
                            <p class="card-text">€<span>69.06</span> EUR</p>
                            <a href="#" class="btn btn-outline-success w-100 mt-1"
                            >Add to cart</a
                            >
                        </div>
                    </div>
                </div>
            </div>

            <div class="col">
                <div class="row justify-content-center">
                    <div class="card" style="width: 15rem">
                        <img
                                src="view/images/5.png"
                                class="card-img-top text-center"
                                alt="merch"
                        />
                        <div class="card-body">
                            <p class="card-text">SMITHEREENS Black Pullover Hoodie</p>
                            <p class="card-text">€<span>69.06</span> EUR</p>
                            <a href="#" class="btn btn-outline-success w-100 mt-1"
                            >Add to cart</a
                            >
                        </div>
                    </div>
                </div>
            </div>

            <div class="col">
                <div class="row justify-content-center">
                    <div class="card" style="width: 15rem">
                        <img
                                src="view/images/6.png"
                                class="card-img-top text-center"
                                alt="merch"
                        />
                        <div class="card-body">
                            <p class="card-text">SMITHEREENS Black Pullover Hoodie</p>
                            <p class="card-text">€<span>69.06</span> EUR</p>
                            <a href="#" class="btn btn-outline-success w-100 mt-1"
                            >Add to cart</a
                            >
                        </div>
                    </div>
                </div>
            </div>

            <div class="col">
                <div class="row justify-content-center">
                    <div class="card" style="width: 15rem">
                        <img
                                src="view/images/7.png"
                                class="card-img-top text-center"
                                alt="merch"
                        />
                        <div class="card-body">
                            <p class="card-text">SMITHEREENS Black Pullover Hoodie</p>
                            <p class="card-text">€<span>69.06</span> EUR</p>
                            <a href="#" class="btn btn-outline-success w-100 mt-1"
                            >Add to cart</a
                            >
                        </div>
                    </div>
                </div>
            </div>

            <div class="col">
                <div class="row justify-content-center">
                    <div class="card" style="width: 15rem">
                        <img
                                src="view/images/8.png"
                                class="card-img-top text-center"
                                alt="merch"
                        />
                        <div class="card-body">
                            <p class="card-text">SMITHEREENS Black Pullover Hoodie</p>
                            <p class="card-text">€<span>69.06</span> EUR</p>
                            <a href="#" class="btn btn-outline-success w-100 mt-1"
                            >Add to cart</a
                            >
                        </div>
                    </div>
                </div>
            </div>

            <div class="col">
                <div class="row justify-content-center">
                    <div class="card" style="width: 15rem">
                        <img
                                src="view/images/9.png"
                                class="card-img-top text-center"
                                alt="merch"
                        />
                        <div class="card-body">
                            <p class="card-text">SMITHEREENS Black Pullover Hoodie</p>
                            <p class="card-text">€<span>69.06</span> EUR</p>
                            <a href="#" class="btn btn-outline-success w-100 mt-1"
                            >Add to cart</a
                            >
                        </div>
                    </div>
                </div>
            </div>

            <div class="col">
                <div class="row justify-content-center">
                    <div class="card" style="width: 15rem">
                        <img
                                src="view/images/10.png"
                                class="card-img-top text-center"
                                alt="merch"
                        />
                        <div class="card-body">
                            <p class="card-text">SMITHEREENS Black Pullover Hoodie</p>
                            <p class="card-text">€<span>69.06</span> EUR</p>
                            <a href="#" class="btn btn-outline-success w-100 mt-1"
                            >Add to cart</a
                            >
                        </div>
                    </div>
                </div>
            </div>

            <div class="col">
                <div class="row justify-content-center">
                    <div class="card" style="width: 15rem">
                        <img
                                src="view/images/11.png"
                                class="card-img-top text-center"
                                alt="merch"
                        />
                        <div class="card-body">
                            <p class="card-text">SMITHEREENS Black Pullover Hoodie</p>
                            <p class="card-text">€<span>69.06</span> EUR</p>
                            <a href="#" class="btn btn-outline-success w-100 mt-1"
                            >Add to cart</a
                            >
                        </div>
                    </div>
                </div>
            </div>

            <div class="col">
                <div class="row justify-content-center">
                    <div class="card" style="width: 15rem">
                        <img
                                src="view/images/12.png"
                                class="card-img-top text-center"
                                alt="merch"
                        />
                        <div class="card-body">
                            <p class="card-text">SMITHEREENS Black Pullover Hoodie</p>
                            <p class="card-text">€<span>69.06</span> EUR</p>
                            <a href="#" class="btn btn-outline-success w-100 mt-1"
                            >Add to cart</a
                            >
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="overlay--main" style="display: none">
    <table class="table table-hover">
        <tr class="table-group-divider">
            <td><a href="">SMITHEREENS</a></td>
        </tr>
        <tr>
            <td><a href="">MERCH</a></td>
        </tr>
        <tr>
            <td><a href="">MUSIC</a></td>
        </tr>
    </table>
</section>

<footer>
    <div class="container p-5">
        <h3 class="col text-md-center my-5">Quick Links</h3>
        <div
                class="row flex-column flex-md-row flex-md-wrap justify-content-around g-3"
        >
            <a href="" class="col-auto">search</a>
            <a href="" class="col-auto">contact us</a>
            <a href="" class="col-auto">returns and exchanges</a>
            <a href="" class="col-auto">shipping faq</a>
            <a href="" class="col-auto">asia customers</a>
            <a href="" class="col-auto">privacy policy</a>
            <a href="" class="col-auto">site use terms and conditions</a>
        </div>
    </div>
    <div class="container px-5 text-center footer--text">
        <img class="img-fluid mb-5" src="view/images/cards.png" />
        <div class="text-center">
            <p>© 2023 JOJI UK Powered by MANHEAD.</p>
            <p>953 Main Street, Nashville, TN 37206 | support@manheadmerch.com</p>
        </div>
    </div>
</footer>

<script>
    function switcher() {
        let overlayMain = document.querySelector(".overlay--main");
        if (overlayMain.style.display === "none") {
            overlayMain.style.display = "block";
            document.body.style.overflow = "hidden";
        } else {
            overlayMain.style.display = "none";
            document.body.style.overflow = "visible";
        }
    }
</script>
</body>
</html>
