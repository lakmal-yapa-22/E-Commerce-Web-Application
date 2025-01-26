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

@WebServlet(name = "CategoriesUpdateServlet", value = "/category_update")
public class CategoriesUpdateServlet extends HttpServlet {
    String DB_URL="jdbc:mysql://localhost/ecommerce";
    String DB_USER="root";
    String DB_PASSWORD="Lakmal@123";
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id=req.getParameter("category_id");
        String name=req.getParameter("category_name");
        String description=req.getParameter("category_Description");


        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection= DriverManager.getConnection(
                    DB_URL,
                    DB_USER,
                    DB_PASSWORD
            );
            String sql="UPDATE categories SET name = ?, description = ? WHERE id = ?";
            PreparedStatement pstm=connection.prepareStatement(sql);

            pstm.setString(1,name);
            pstm.setString(2,description);
            pstm.setString(3, id);

            int effectedRowCount = pstm.executeUpdate();
            if (effectedRowCount > 0) {
                resp.sendRedirect(
                        "category_update.jsp?message=categories updated successfully"
                );
            } else {
                resp.sendRedirect(
                        "category_update.jsp?error=categories not found"
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect(
                    "category_update.jsp?error=Fail to update categories"
            );
        }
    }
}
