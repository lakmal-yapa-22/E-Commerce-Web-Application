<%@ page import="lk.ijse.ecommerce_assignment_01.admin.ProductDTO" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 1/20/2025
  Time: 5:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <title>Electro - HTML Ecommerce Template</title>

    <!-- Google font -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

    <!-- Bootstrap -->
    <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>

    <!-- Slick -->
    <link type="text/css" rel="stylesheet" href="style/slick.css"/>
    <link type="text/css" rel="stylesheet" href="style/slick-theme.css"/>

    <!-- nouislider -->
    <link type="text/css" rel="stylesheet" href="style/nouislider.min.css"/>

    <!-- Font Awesome Icon -->
    <link rel="stylesheet" href="css/font-awesome.min.css">

    <!-- Custom stlylesheet -->
    <link type="text/css" rel="stylesheet" href="style/style.css"/>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<style>.cart-item {
    text-align: center;
    border: 1px solid #ddd;
    padding: 10px;
    margin: 5px;
    background: #f9f9f9;
    border-radius: 5px;
}
.cart-item img {
    width: 100px;
    height: auto;
    margin-bottom: 10px;
}
.cart-item {
    border: 1px solid #ddd;
    padding: 20px;
    text-align: center;
    background-color: #f9f9f9;
    border-radius: 5px;
    height: 100%;
}
.cart-item img {
    width: 100%;
    max-width: 150px;
    height: auto;
    border-radius: 5px;
}
.cart-item p {
    font-weight: bold;
    margin-top: 10px;
}
.cart-item h3 {
    color: green;
}
.error {
    color: red;
    text-align: center;
    margin-bottom: 20px;
}
/* Style for the product grid container */
.product-grid {
    display: flex;
    flex-wrap: wrap;
    gap: 20px; /* Space between grid items */
}

/* Style for each product item */
.cart-item {
    width: 100%;
    height: 350px; /* Set a fixed height for each product item */
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
    background-color: #f8f9fa; /* Light background for the product items */
    border: 1px solid #ddd; /* Border around each product */
    border-radius: 5px; /* Rounded corners for product item */
    padding: 20px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* Light shadow effect */
}

/* Style for product images */
.product-image {
    max-width: 100%;
    max-height: 200px; /* Set a max height for the image */
    object-fit: contain; /* Ensure the image fits within the container without distortion */
    margin-bottom: 10px;
}

/* Style for "Add to Cart" button */
.add-to-cart-btn {
    width: 100%; /* Make the button stretch to fit the container */
    height: 40px; /* Fixed height for the button */
    font-size: 16px;
    font-weight: bold;
    padding: 10px 0;
    background-color: #007bff;
    color: white;
    border: none;
    border-radius: 5px;
    transition: background-color 0.3s ease;
}

/* Change background color on hover */
.add-to-cart-btn:hover {
    background-color: #0056b3;
    cursor: pointer;
}

/* Ensure each product item takes up equal width in the grid */
@media (min-width: 768px) {
    .col-md-3 {
        flex: 1 1 23%; /* Set the width for medium screens (4 items per row) */
    }
}

@media (max-width: 767px) {
    .col-md-3 {
        flex: 1 1 48%; /* Set the width for small screens (2 items per row) */
    }
}

@media (max-width: 480px) {
    .col-md-3 {
        flex: 1 1 100%; /* Full width for very small screens */
    }
}

</style>
</head>
<body>
<!-- HEADER -->
<header>
    <!-- TOP HEADER -->
    <div id="top-header">
        <div class="container">
            <ul class="header-links pull-left">
                <li><a href="#"><i class="fa fa-phone"></i> +94713346662</a></li>
                <li><a href="#"><i class="fa fa-envelope-o"></i> Drift&Dream@email.com</a></li>
                <li><a href="#"><i class="fa fa-map-marker"></i> 1734 Galle road colombo 7</a></li>
            </ul>
            <ul class="header-links pull-right">
                <li><a href="singnup.jsp"><i class="fa fa-sign-in"></i> Register</a></li>
                <li><a href="login.jsp"><i class="fa fa-user-o"></i> Login</a></li>
            </ul>
        </div>
    </div>
    <!-- /TOP HEADER -->

    <!-- MAIN HEADER -->
    <div id="header">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">
                <!-- LOGO -->
                <div class="col-md-3">
                    <div class="header-logo">
                        <a href="#" class="logo">
                            <img class="logo_" src="img/new/smart.png" alt="">
                        </a>
                    </div>
                </div>
                <!-- /LOGO -->

                <!-- SEARCH BAR -->
                <div class="col-md-6">
                    <div class="header-search">
                        <form>
                            <select class="input-select">
                                <option value="0">All Categories</option>
                                <option value="1">Laptop</option>
                                <option value="1">phone</option>
                                <option value="1">camera</option>
                                <option value="1">Head set</option>
                            </select>
                            <input class="input" placeholder="Search here">
                            <button class="search-btn">Search</button>
                        </form>
                    </div>
                </div>
                <!-- /SEARCH BAR -->

                <!-- ACCOUNT -->
                <div class="col-md-3 clearfix">
                    <div class="header-ctn">
                        <!-- Wishlist -->
                        <div>
                            <a href="#">
                                <i class="fa fa-heart-o"></i>
                                <span>Your Wishlist</span>
                                <div class="qty">2</div>
                            </a>
                        </div>


                        <!-- /Wishlist -->

                        <!-- Cart -->
                        <div class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
                                <i class="fa fa-shopping-cart"></i>
                                <span>Your Cart</span>
                                <div class="qty">3</div>
                            </a>
                            <div class="cart-dropdown">
                                <div class="cart-list">
                                    <div class="product-widget">
                                        <div class="product-img">
                                            <img src="./img/product01.png" alt="">
                                        </div>
                                        <div class="product-body">
                                            <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                            <h4 class="product-price"><span class="qty">1x</span>$980.00</h4>
                                        </div>
                                        <button class="delete"><i class="fa fa-close"></i></button>
                                    </div>

                                    <div class="product-widget">
                                        <div class="product-img">
                                            <img src="./img/product02.png" alt="">
                                        </div>
                                        <div class="product-body">
                                            <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                            <h4 class="product-price"><span class="qty">3x</span>$980.00</h4>
                                        </div>
                                        <button class="delete"><i class="fa fa-close"></i></button>
                                    </div>
                                </div>
                                <div class="cart-summary">
                                    <small>3 Item(s) selected</small>
                                    <h5>SUBTOTAL: $2940.00</h5>
                                </div>
                                <div class="cart-btns">
                                    <a href="#">View Cart</a>
                                    <a href="#">Checkout  <i class="fa fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
                        </div>
                        <!-- /Cart -->

                        <!-- Menu Toogle -->
                        <div class="menu-toggle">
                            <a href="#">
                                <i class="fa fa-bars"></i>
                                <span>Menu</span>
                            </a>
                        </div>
                        <!-- /Menu Toogle -->
                    </div>
                </div>
                <!-- /ACCOUNT -->
            </div>
            <!-- row -->
        </div>
        <!-- container -->
    </div>
    <!-- /MAIN HEADER -->
</header>
<!-- /HEADER -->

<!-- NAVIGATION -->
<nav id="navigation">
    <!-- container -->
    <div class="container">
        <!-- responsive-nav -->
        <div id="responsive-nav">
            <!-- NAV -->
            <ul class="main-nav nav navbar-nav">
                <li ><a href="index.jsp">Home</a></li>
                <li><a href="allProductVeiw">Hot Deals</a></li>

                <li class="active"><a href="#">Laptops</a></li>
                <li><a href="phone">Smartphones</a></li>
                <li><a href="camera">Cameras</a></li>

            </ul>
            <!-- /NAV -->
        </div>
        <!-- /responsive-nav -->
    </div>
    <!-- /container -->
</nav>



<div class="container mt-5">
    <h1 class="text-center mb-4"><b>Laptop</b></h1>

    <%
        // Check if there's any error message to display
        String errorMessage = (String) request.getAttribute("error");
        if (errorMessage != null) {
    %>
    <div class="error">
        <%= errorMessage %>
    </div>
    <%
        }

        // Retrieve the list of laptops
        List<ProductDTO> dataList = (List<ProductDTO>) request.getAttribute("laptop");
        if (dataList != null && !dataList.isEmpty()) {
    %>

    <!-- Grid row for displaying products -->
    <div class="row">
        <%
            // Loop through each product in the data list
            for (ProductDTO productDTO : dataList) {
                String imagePath = productDTO.getProductImage();
        %>

        <div class="col-md-3 mb-4">
            <div class="cart-item">
                <%
                    if (imagePath != null && !imagePath.isEmpty()) {
                %>
                <img src="<%= imagePath %>" alt="<%= productDTO.getProductName() %>">
                <%
                } else {
                %>
                <img src="img/default.png" alt="Default Product Image">
                <%
                    }
                %>
                <p><%= productDTO.getProductName() %></p>
                <span><%= productDTO.getProductDescription() %></span>
                <h3>RS.<%= productDTO.getProductPrice() %></h3>
               <button type="submit" class="btn btn-primary"> <a href="login.jsp">Add to Cart</a> </button>
            </div>
        </div>

        <%
            }
        %>
    </div>

    <%
    } else {
    %>
    <p class="text-center">No laptops available at the moment.</p>
    <%
        }
    %>
</div>

<!-- FOOTER -->
<footer id="footer">
    <!-- top footer -->
    <div class="section">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">
                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">About Us</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut.</p>
                        <ul class="footer-links">
                            <li><a href="#"><i class="fa fa-map-marker"></i>1734 Stonecoal Road</a></li>
                            <li><a href="#"><i class="fa fa-phone"></i>+021-95-51-84</a></li>
                            <li><a href="#"><i class="fa fa-envelope-o"></i>email@email.com</a></li>
                        </ul>
                    </div>
                </div>

                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">Categories</h3>
                        <ul class="footer-links">
                            <li><a href="#">Hot deals</a></li>
                            <li><a href="#">Laptops</a></li>
                            <li><a href="#">Smartphones</a></li>
                            <li><a href="#">Cameras</a></li>
                            <li><a href="#">Accessories</a></li>
                        </ul>
                    </div>
                </div>

                <div class="clearfix visible-xs"></div>

                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">Information</h3>
                        <ul class="footer-links">
                            <li><a href="#">About Us</a></li>
                            <li><a href="#">Contact Us</a></li>
                            <li><a href="#">Privacy Policy</a></li>
                            <li><a href="#">Orders and Returns</a></li>
                            <li><a href="#">Terms & Conditions</a></li>
                        </ul>
                    </div>
                </div>

                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">Service</h3>
                        <ul class="footer-links">
                            <li><a href="#">My Account</a></li>
                            <li><a href="#">View Cart</a></li>
                            <li><a href="#">Wishlist</a></li>
                            <li><a href="#">Track My Order</a></li>
                            <li><a href="#">Help</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </div>
    <!-- /top footer -->

    <!-- bottom footer -->
    <div id="bottom-footer" class="section">
        <div class="container">
            <!-- row -->
            <div class="row">
                <div class="col-md-12 text-center">
                    <ul class="footer-payments">
                        <li><a href="#"><i class="fa fa-cc-visa"></i></a></li>
                        <li><a href="#"><i class="fa fa-credit-card"></i></a></li>
                        <li><a href="#"><i class="fa fa-cc-paypal"></i></a></li>
                        <li><a href="#"><i class="fa fa-cc-mastercard"></i></a></li>
                        <li><a href="#"><i class="fa fa-cc-discover"></i></a></li>
                        <li><a href="#"><i class="fa fa-cc-amex"></i></a></li>
                    </ul>

                </div>
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </div>
    <!-- /bottom footer -->
</footer>
<!-- /FOOTER -->

<!-- jQuery Plugins -->
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="temp/slick.min.js"></script>
<script src="temp/nouislider.min.js"></script>
<script src="temp/jquery.zoom.min.js"></script>
<script src="js/main.js"></script>

</body>
</html>
