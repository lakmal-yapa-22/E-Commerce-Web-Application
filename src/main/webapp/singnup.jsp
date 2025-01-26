<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up - E-Commerce</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script> <!-- Include SweetAlert2 -->
    <link rel="stylesheet" href="style/signup.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

    <style>


        .signup-container {

            position: relative;
        }



        .input-group {
            margin-bottom: 15px;
        }

        .input-group label {
            display: block;
            font-size: 14px;
            margin-bottom: 5px;
            color: #333;
        }

        .input-group input, .input-group select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
        }

        .input-group input:focus, .input-group select:focus {
            border-color: #D10024;
            outline: none;
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
            top: -15px;
            left: -15px;
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

        .signup-container p {
            text-align: center;
            font-size: 14px;
        }

        .signup-container p a {
            color: #D10024;
            text-decoration: none;
        }

        .signup-container p a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body style="background-color: darkred">
<% String error = request.getParameter("error"); %>
<% if (error != null) { %>
<script>
    Swal.fire({
        icon: 'error',
        title: 'singn_up Failed',
        text: '<%= error %>',
        confirmButtonText: 'OK'
    });
</script>
<% } %>

<% String message = request.getParameter("message"); %>
<% if (message != null) { %>
<script>
    Swal.fire({
        icon: 'success',
        title: 'Success',
        text: '<%= message %>',
        confirmButtonText: 'OK'
    });
</script>
<% } %>

<div class="signup-container">
    <!-- Back Button -->

    <a href="index.jsp">   <button class="back-button" >&#8592;</button></a>

    <h2>Create an Account</h2>
    <form action="singnup" method="POST" onsubmit="return validateForm()">
        <div class="input-group">
            <label for="username">Username</label>
            <input type="text" id="username" name="username" required>
        </div>

        <div class="input-group">
            <label for="email">Email</label>
            <input type="email" id="email" name="email" required>
        </div>

        <div class="input-group">
            <label for="password">Password</label>
            <input type="password" id="password" name="password" required>
        </div>

        <!-- Role -->
        <div class="mb-3">
            <label class="form-label">Role</label>
            <div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="user_role" id="roleCustomer" value="customer" required>
                    <label class="form-check-label" for="roleCustomer">Customer</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="user_role" id="roleAdmin" value="admin">
                    <label class="form-check-label" for="roleAdmin">Admin</label>
                </div>
            </div>
        </div>



        <div class="input-group">
            <button type="submit">Sign Up</button>
        </div>
    </form>

    <p>Already have an account? <a href="login.jsp">Login here</a></p>
</div>

<script>
    function validateForm() {
        const termsCheckbox = document.getElementById("terms");
        if (!termsCheckbox.checked) {
            Swal.fire({
                icon: 'warning',
                title: 'Agreement Required',
                text: 'You must agree to the terms and conditions before signing up.',
                confirmButtonText: 'OK'
            });
            return false; // Prevent form submission
        }
        return true; // Allow form submission
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
