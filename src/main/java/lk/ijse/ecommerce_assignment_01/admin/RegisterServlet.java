package lk.ijse.ecommerce_assignment_01.admin;
import jakarta.annotation.Resource;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.mindrot.jbcrypt.BCrypt;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
@WebServlet(name = "RegisterServlet", value = "/singnup")
public class RegisterServlet extends HttpServlet {
    String DB_URL = "jdbc:mysql://localhost:3306/ecommerce";
    String DB_USER = "root";
    String DB_PASSWORD = "Lakmal@123";

    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try (Connection connection = dataSource.getConnection()) {
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String role = request. getParameter ("user_role");


            String sql = "INSERT INTO users (username, email, password, role) VALUES (?, ?, ?, ?)";
            try (PreparedStatement pstm = connection.prepareStatement(sql)) {
                pstm.setString(1, username);
                pstm.setString(2, email);
                pstm.setString(3, password);
                pstm.setString(4, role);


                int affectedRows = pstm.executeUpdate();
                if (affectedRows > 0) {
                    response.sendRedirect("singnup.jsp?message=Administrator Registration Successful");
                    request.setAttribute("message", "You have successfully signed up!");
                } else {
                    response.sendRedirect("singnup.jsp?error=Administrator Registration Failed");
                    request.setAttribute("error", "An error occurred during signup.");
                }
            } catch (SQLException e) {
                e.printStackTrace();
                response.sendRedirect("singnup.jsp?error=Error occurred during registration");
                RequestDispatcher dispatcher = request.getRequestDispatcher("signup.jsp");
                dispatcher.forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("singnup.jsp?error=Database connection error");
        }
    }





}