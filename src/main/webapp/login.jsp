<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - E-Commerce</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script> <!-- Include SweetAlert2 -->
    <style>
        body {
            background: linear-gradient(to right, #D10024, #ed6079);
            color: #fff;
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            overflow: hidden;
        }

        .login-container {
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 12px;
            padding: 30px 40px;
            box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 400px;
            text-align: center;
        }

        h2 {
            margin-bottom: 20px;
            color: #333;
        }

        .input-group {
            margin-bottom: 20px;
            text-align: left;
        }

        .input-group label {
            font-weight: bold;
            margin-bottom: 5px;
            display: block;
            color: #555;
        }

        .input-group input {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 5px;
            outline: none;
            transition: all 0.3s ease;
        }

        .input-group input:focus {
            border-color: #4facfe;
            box-shadow: 0px 0px 5px #4facfe;
        }

        .login-button {
            background-color: #41d831;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            font-weight: bold;
            border-radius: 5px;
            cursor: pointer;
            transition: all 0.3s ease;
            width: 100%;
        }

        .login-button:hover {
            background-color: #00c6ff;
        }

        .extra-links {
            margin-top: 20px;
        }

        .extra-links a {
            color: #4facfe;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .extra-links a:hover {
            text-decoration: underline;
            color: #00c6ff;
        }
    </style>
</head>
<body>
<div class="login-container">
    <h2>Login to Your Account</h2>

    <% String error = request.getParameter("error"); %>
    <% if (error != null) { %>
    <script>
        Swal.fire({
            icon: 'error',
            title: 'Login Failed',
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

    <form action="login" method="get">
        <div class="input-group">
            <label for="username">Username</label>
            <input type="text" id="username" name="username" placeholder="Enter your username" required>
        </div>

        <div class="input-group">
            <label for="password">Password</label>
            <input type="password" id="password" name="password" placeholder="Enter your password" required>
        </div>

        <button type="submit" class="login-button">Login</button>
    </form>

    <div class="extra-links">
        <p style="color: black">Don't have an account? <a href="singnup.jsp">Sign Up</a></p>
    </div>

</div>
</body>
</html>
