package lk.ijse.ecommerce_assignment_01.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet(name = "CategoriesDeleteServlet", value = "/categoriesDelete")
public class CategoriesDeleteServlet extends HttpServlet {
    String DB_URL = "jdbc:mysql://localhost:3306/ecommerce";
    String DB_USER = "root";
    String DB_PASSWORD = "Lakmal@123";


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("category_id");
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(
                    DB_URL,
                    DB_USER,
                    DB_PASSWORD
            );
            String sql = "DELETE FROM categories WHERE id = ?";
            PreparedStatement pstm = connection.prepareStatement(sql);
            pstm.setString(1, id);
            int effectedRowCount = pstm.executeUpdate();
            if (effectedRowCount > 0) {
                resp.sendRedirect(
                        "categoriesDelete.jsp?message=categories deleted successfully"
                );
            } else {
                resp.sendRedirect(
                        "categoriesDelete.jsp?error=categories not found"
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect(
                    "categoriesDelete.jsp?error=Fail to delete categories"
            );
        }
    }
}
