package lk.ijse.ecommerce_assignment_01.admin;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
//package lk.ijse.ecommerce_assignment_01.admin;
//
//import jakarta.annotation.Resource;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//
//import javax.sql.DataSource;
//import java.io.IOException;
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//
//@WebServlet(name = "LoginServelt", value = "/login")
//public class LoginServelt extends HttpServlet {
//
//    @Resource(name = "java:comp/env/jdbc/pool")
//    private DataSource dataSource;
//
//    @Override
//    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        String username = req.getParameter("username");
//        String password = req.getParameter("password");
//
//        // Validate input
//        if (username == null || username.isEmpty() || password == null || password.isEmpty()) {
//            req.setAttribute("error", "Username or password cannot be empty.");
//            req.getRequestDispatcher("login.jsp").forward(req, resp);
//            return;
//        }
//
//        try (Connection connection = dataSource.getConnection()) {
//            // Query to find admin user
//            String sql = "SELECT password FROM users WHERE username = ? AND role = 'admin' AND status = 1";
//            PreparedStatement ps = connection.prepareStatement(sql);
//            ps.setString(1, username);
//
//            ResultSet resultSet = ps.executeQuery();
//            if (resultSet.next()) {
//                // Retrieve hashed password from the database
//                String hashedPassword = resultSet.getString("password");
//
//                // Compare entered password with hashed password
//                if (password.equals(hashedPassword)) {
//                    // Login successful - redirect to admin home
////                    req.getSession().setAttribute("loggedInUser", username);
//
//
//
//
//                    resp.sendRedirect("adminHome.jsp?message=Administrator login Successful");
//                    req.setAttribute("message", "You have successfully signed up!");
//                } else {
//                    // Invalid password
//                    req.setAttribute("error", "Invalid username or password.");
//                    req.getRequestDispatcher("login.jsp").forward(req, resp);
//                    resp.sendRedirect("login.jsp?message=Administrator login fail");
//                }
//            } else {
//                // User not found
//                req.setAttribute("error", "Invalid username or password.");
//                req.getRequestDispatcher("login.jsp").forward(req, resp);
//                resp.sendRedirect("login.jsp?message=Administrator login fail Invalid username or password");
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//            req.setAttribute("error", "An error occurred while processing your request. Please try again.");
//            req.getRequestDispatcher("login.jsp").forward(req, resp);
//            resp.sendRedirect("login.jsp?message=Administrator login fail Invalid username or password");
//        }
//    }
//
//
//
//}
@WebServlet(name = "LoginServelt", value = "/login")
public class LoginServelt extends HttpServlet {

    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        // Validate input
        if (username == null || username.isEmpty() || password == null || password.isEmpty()) {
            req.setAttribute("error", "Username or password cannot be empty.");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
            return;
        }

        try (Connection connection = dataSource.getConnection()) {
            // Query to check user credentials and role
            String sql = "SELECT password, role FROM users WHERE username = ? AND status = 1";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);

            ResultSet resultSet = ps.executeQuery();
            if (resultSet.next()) {
                // Retrieve hashed password and role from the database
                String hashedPassword = resultSet.getString("password");
                String role = resultSet.getString("role");

                // Compare entered password with the hashed password
                if (password.equals(hashedPassword)) {
                    // Login successful
                    req.getSession().setAttribute("loggedInUser", username);

                    if ("admin".equals(role)) {
                        // Redirect admin to admin home
                        resp.sendRedirect("adminHome.jsp?message=Administrator login successful");
                    } else if ("customer".equals(role)) {
                        // Redirect customer to customer home
                        resp.sendRedirect("addtoCart?message=Customer login successful");
                    }
                } else {
                    // Invalid password
                    req.setAttribute("error", "Invalid username or password.");
                    req.getRequestDispatcher("login.jsp").forward(req, resp);
                }
            } else {
                // User not found
                req.setAttribute("error", "Invalid username or password.");
                req.getRequestDispatcher("login.jsp").forward(req, resp);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            req.setAttribute("error", "An error occurred while processing your request. Please try again.");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
    }
}
