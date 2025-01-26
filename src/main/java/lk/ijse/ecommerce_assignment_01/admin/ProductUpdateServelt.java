package lk.ijse.ecommerce_assignment_01.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.UUID;

@WebServlet(name = "ProductUpdateServelt", value = "/productUpdate")
public class ProductUpdateServelt extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost/ecommerce";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Lakmal@123";
    private static final String UPLOAD_DIR = "uploads";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String code=req.getParameter("product_id");
        String productName=req.getParameter("product_name");
        String productDescription=req.getParameter("product_description");
        Double productPrice= Double.valueOf(req.getParameter("product_price"));
        int productQuantity=Integer.valueOf(req.getParameter("product_quantity"));
        int categoryId=Integer.valueOf(req.getParameter("category_id"));



        String imagePath=req.getParameter("product_image");



        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection= DriverManager.getConnection(
                    DB_URL,
                    DB_USER,
                    DB_PASSWORD
            );

            String sql="UPDATE products SET name = ?, description = ? , price =?,  quantity = ?,WHERE id = ?,category_id =?,product_image=? WHERE id=?";
            PreparedStatement pstm=connection.prepareStatement(sql);
            pstm.setString(1,productName);
            pstm.setString(2,productDescription);
            pstm.setDouble(3,productPrice);
            pstm.setInt(4,productQuantity);
            pstm.setInt(5,categoryId);
            pstm.setString(6,imagePath);
            pstm.setString(7,code);


            int effectRowCount=pstm.executeUpdate();

            if (effectRowCount>0){
                resp.sendRedirect(
                        "productUpdate.jsp?message=product updated successfully"
                );
            }else {
                resp.sendRedirect(
                        "productUpdate.jsp?message=product updated unsuccessfully"
                );
            }
        }catch (Exception e){
            e.printStackTrace();
            resp.sendRedirect(
                    "productUpdate.jsp?=product updated successfully"
            );
        }
    }
}
