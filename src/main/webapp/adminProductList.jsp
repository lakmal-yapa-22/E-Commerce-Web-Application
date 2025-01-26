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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">

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
    .custom-table th, .custom-table td {
        vertical-align: middle;
    }
    .cat {
        color: red;
    }
    .section {
        margin-top: 50px;
    }
    .input-group button {
        width: 100%;
        padding: 10px;
        background-color: #D10024;
        border: none;
        border-radius: 5px;
        color: white;
        font-size: 16px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .input-group button:hover {
        background-color: #a3001c;
    }

    .input-group input[type="checkbox"] {
        display: inline-block;
        width: auto;
    }

    .back-button {
        position: absolute;
      top: 150px;
        left: 20px;
        background-color: #ddd;
        color: #333;
        border: none;
        border-radius: 50%;
        width: 40px;
        height: 40px;
        font-size: 16px;
        cursor: pointer;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        transition: background-color 0.3s ease;
    }

    .back-button:hover {
        background-color: #bbb;
    }


    /* Table Styling */
    .table {
        width: 100%;
        margin-top: 20px;
        border-collapse: collapse;
    }

    .table th, .table td {
        padding: 10px;
        vertical-align: middle;
        text-align: center;
    }

    .table-bordered {
        border: 1px solid #ddd;
    }

    .table-bordered th, .table-bordered td {
        border: 1px solid #ddd;
    }

    .table-dark th {
        background-color: #343a40;
        color: #fff;
    }

    /* Image Styling */
    .product-image {
        max-width: 100px;
        max-height: 100px;
        object-fit: cover; /* Ensures the image is cropped proportionally */
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    /* Back Button */
    .back-button {
        position: absolute;
        top: 10px;
        left: 10px;
        background-color: #007bff;
        color: #fff;
        border: none;
        padding: 8px 12px;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
    }

    .back-button:hover {
        background-color: #0056b3;
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

                <li><a href="login.jsp"><i class="fa fa-user-o"></i> my Account</a></li>
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
                                            <img src="img/product01.png" alt="">
                                        </div>
                                        <div class="product-body">
                                            <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                            <h4 class="product-price"><span class="qty">1x</span>$980.00</h4>
                                        </div>
                                        <button class="delete"><i class="fa fa-close"></i></button>
                                    </div>

                                    <div class="product-widget">
                                        <div class="product-img">
                                            <img src="img/product02.png" alt="">
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

<nav id="navigation">
    <!-- container -->
    <div class="container">
        <!-- responsive-nav -->
        <div id="responsive-nav">
            <!-- NAV -->
            <ul class="main-nav nav navbar-nav" style="display: inline">

                <li  ><a href="adminHome.jsp">Add Product</a></li>
              <li><a class="active" href="#">Product List</a></li>
                <li><a  href="productUpdate.jsp">product Update</a></li>
                <li><a href="productDelete.jsp">Product Delete</a> </li>


                <li  ><a  href="category.jsp">Add Categories</a></li>
                <li><a  href="categoryVeiw">Categories List</a></li>
                 <li><a href="category_update.jsp">Categories Update</a></li>
                <li><a href="categoriesDelete.jsp">Categories Delete</a></li>

                <li><a href="users_manage.jsp">user manage</a></li>


            </ul>
            <!-- /NAV -->
        </div>
        <!-- /responsive-nav -->
    </div>
<%--    <!-- /container -->--%>
<%--</nav>--%>
<%--<a href="index.jsp">   <button class="back-button" >&#8592;</button></a><div class="container mt-5">--%>
<%--    <h1 class="text-center mb-4"><b>Product <span class="cat">List</span></b></h1>--%>


<%--    <%--%>
<%--        String errorMessage = (String) request.getAttribute("error");--%>
<%--        if (errorMessage != null) {--%>
<%--    %>--%>
<%--    <div class="error">--%>
<%--        <%= errorMessage %>--%>
<%--    </div>--%>
<%--    <%--%>
<%--        }--%>
<%--    %>--%>

<%--    <%--%>
<%--        List<ProductDTO> dataList = (List<ProductDTO>) request.getAttribute("products");--%>
<%--        if (dataList != null && !dataList.isEmpty()) {--%>
<%--    %>--%>
<%--    <table>--%>
<%--        <thead>--%>
<%--        <tr>--%>
<%--            <th>product id</th>--%>
<%--            <th>product name</th>--%>
<%--            <th>product description</th>--%>
<%--            <th>product price</th>--%>
<%--            <th>product quantity</th>--%>
<%--            <th>category id</th>--%>
<%--            <th>product image</th>--%>

<%--        </tr>--%>
<%--        </thead>--%>
<%--        <tbody>--%>
<%--        <%--%>
<%--            for (ProductDTO productDTO : dataList) {--%>
<%--        %>--%>
<%--        <tr>--%>


<%--            <td><%=productDTO.getProductId() %></td>--%>
<%--            <td><%= productDTO.getProductName() %></td>--%>
<%--            <td><%=productDTO.getProductDescription() %></td>--%>
<%--            <td><%= productDTO.getProductPrice() %></td>--%>
<%--            <td><%=productDTO.getProductQuantity() %></td>--%>
<%--            <td><%= productDTO.getCategoryId() %></td>--%>




<%--            <td>--%>
<%--                <%--%>
<%--                    String imagePath = productDTO.getProductImage();--%>
<%--                    if (imagePath != null && !imagePath.isEmpty()) {--%>
<%--                %>--%>
<%--                <img src="<%= request.getContextPath() + "/" + imagePath %>" alt="product Image">--%>
<%--                <%--%>
<%--                } else {--%>
<%--                %>--%>
<%--                <p>No image available</p>--%>
<%--                <%--%>
<%--                    }--%>
<%--                %>--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--        <%--%>
<%--            }--%>
<%--        %>--%>
<%--        </tbody>--%>
<%--    </table>--%>
<%--    <%--%>
<%--    } else {--%>
<%--    %>--%>
<%--    <p>No product found.</p>--%>
<%--    <%--%>
<%--        }--%>
<%--    %>--%>
<%--</div>--%>


    <!-- Back Button -->
    <a href="index.jsp">
        <button class="back-button">&#8592;</button>
    </a>

    <!-- Container -->
    <div class="container mt-5">
        <h1 class="text-center mb-4"><b>Product <span class="cat">List</span></b></h1>

        <!-- Error Message -->
        <%
            String errorMessage = (String) request.getAttribute("error");
            if (errorMessage != null) {
        %>
        <div class="error text-danger">
            <%= errorMessage %>
        </div>
        <%
            }
        %>

        <!-- Product List Table -->
        <%
            List<ProductDTO> dataList = (List<ProductDTO>) request.getAttribute("products");
            if (dataList != null && !dataList.isEmpty()) {
        %>
        <table class="table table-bordered table-striped text-center">
            <thead class="table-dark">
            <tr>
                <th>Product ID</th>
                <th>Product Name</th>
                <th>Product Description</th>
                <th>Product Price</th>
                <th>Product Quantity</th>
                <th>Category ID</th>
                <th>Product Image</th>
            </tr>
            </thead>
            <tbody>
            <%
                for (ProductDTO productDTO : dataList) {
            %>
            <tr>
                <td><%= productDTO.getProductId() %></td>
                <td><%= productDTO.getProductName() %></td>
                <td><%= productDTO.getProductDescription() %></td>
                <td>Rs. <%= productDTO.getProductPrice() %></td>
                <td><%= productDTO.getProductQuantity() %></td>
                <td><%= productDTO.getCategoryId() %></td>
                <td>
                    <%
                        String imagePath = productDTO.getProductImage();
                        if (imagePath != null && !imagePath.isEmpty()) {
                    %>
                    <img src="<%= request.getContextPath() + "/" + imagePath %>" alt="Product Image" class="img-fluid product-image">
                    <%
                    } else {
                    %>
                    <p>No image available</p>
                    <%
                        }
                    %>
                </td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
        <%
        } else {
        %>
        <p class="text-center text-danger">No products found.</p>
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
