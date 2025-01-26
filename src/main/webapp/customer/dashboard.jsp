<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Dashboard</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../style/customer/dashboard.css">
</head>
<body>
<div class="d-flex">
    <!-- Sidebar -->
    <nav class="sidebar bg-light vh-100 p-3">
        <h2 class="text-center text-primary">Customer Panel</h2>
        <ul class="nav flex-column mt-4">
            <li class="nav-item mb-3">
                <a href="view_products.jsp" class="nav-link text-dark">
                    <i class="bi bi-shop"></i> Browse Products
                </a>
            </li>
            <li class="nav-item mb-3">
                <a href="view_cart.jsp" class="nav-link text-dark">
                    <i class="bi bi-cart"></i> My Cart
                </a>
            </li>
            <li class="nav-item mb-3">
                <a href="order_history.jsp" class="nav-link text-dark">
                    <i class="bi bi-list-check"></i> Order History
                </a>
            </li>
            <li class="nav-item mb-3">
                <a href="user_profile.jsp" class="nav-link text-dark">
                    <i class="bi bi-person"></i> My Profile
                </a>
            </li>
            <li class="nav-item">
                <a href="logout" class="nav-link text-danger">
                    <i class="bi bi-box-arrow-left"></i> Logout
                </a>
            </li>
        </ul>
    </nav>

    <!-- Main Content -->
    <main class="flex-grow-1 p-4">
        <div class="container">
            <h1 class="mb-4">Welcome, [Customer Name]!</h1>

            <!-- Featured Products Section -->
            <section class="mb-5">
                <h3>Featured Products</h3>
                <div class="row">
                    <div class="col-md-3">
                        <div class="card">
                            <img src="images/product1.jpg" class="card-img-top" alt="Product 1">
                            <div class="card-body">
                                <h5 class="card-title">Product Name 1</h5>
                                <p class="card-text">$50.00</p>
                                <a href="add_to_cart?productId=1" class="btn btn-primary">Add to Cart</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card">
                            <img src="images/product2.jpg" class="card-img-top" alt="Product 2">
                            <div class="card-body">
                                <h5 class="card-title">Product Name 2</h5>
                                <p class="card-text">$75.00</p>
                                <a href="add_to_cart?productId=2" class="btn btn-primary">Add to Cart</a>
                            </div>
                        </div>
                    </div>
                    <!-- Add more products here -->
                </div>
            </section>

            <!-- Recent Orders Section -->
            <section>
                <h3>Recent Orders</h3>
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Date</th>
                        <th>Total</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>ORD_001</td>
                        <td>2025-01-01</td>
                        <td>$150.00</td>
                        <td>Shipped</td>
                        <td><a href="order_details.jsp?orderId=1" class="btn btn-outline-primary btn-sm">View</a></td>
                    </tr>
                    <tr>
                        <td>ORD_002</td>
                        <td>2025-01-05</td>
                        <td>$90.00</td>
                        <td>Processing</td>
                        <td><a href="order_details.jsp?orderId=2" class="btn btn-outline-primary btn-sm">View</a></td>
                    </tr>
                    <!-- Add more orders here -->
                    </tbody>
                </table>
            </section>
        </div>
    </main>
</div>

<!-- Bootstrap Icons and JS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
