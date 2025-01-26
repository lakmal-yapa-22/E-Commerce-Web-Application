
package lk.ijse.ecommerce_assignment_01.admin;

import jakarta.annotation.Resource;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.*;
        import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CategoriesServlet", value = "/category")
public class CategoriesServlet extends HttpServlet {
    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("category_name");
        String Description = req.getParameter("category_Description");




        try (Connection connection = dataSource.getConnection()) {
            String sql = "INSERT INTO categories (name, description) \n" +
                    "VALUES (?,?)";
            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ps.setString(1, name);
                ps.setString(2, Description);

                ps.executeUpdate();

                resp.sendRedirect("category.jsp?message=categories add successful");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            resp.sendRedirect("category.jsp?error=Invalid values");
        }
    }


}
