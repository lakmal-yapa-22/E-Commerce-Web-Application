package lk.ijse.ecommerce_assignment_01;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.ecommerce_assignment_01.admin.ProductDTO;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "PhoneServlet", value = "/phone")
public class PhoneServlet extends HttpServlet {
    String DB_URL = "jdbc:mysql://localhost/ecommerce";
    String DB_USER = "root";
    String DB_PASSWORD = "Lakmal@123";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<ProductDTO> productDTOList = new ArrayList<>();
        try {
            // Load MySQL driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection
            Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // Query to fetch laptop products
            String sql = "SELECT id, name, price, quantity, description, product_image FROM products WHERE category_id = 2";

            // Execute query
            Statement stm = connection.createStatement();
            ResultSet rst = stm.executeQuery(sql);

            // Process result set
            while (rst.next()) {
                ProductDTO productDTO = new ProductDTO(
                        rst.getInt("id"),
                        rst.getString("name"),
                        rst.getString("description"),
                        rst.getDouble("price"),
                        rst.getInt("quantity"),
                        rst.getString("product_image") // Assuming the field in ProductDTO matches
                );
                productDTOList.add(productDTO);
            }

            // Close resources
            rst.close();
            stm.close();
            connection.close();

            // Set products attribute and forward to JSP
            req.setAttribute("phone", productDTOList);
            RequestDispatcher rd = req.getRequestDispatcher("phone.jsp");
            rd.forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Error loading products: " + e.getMessage());
            RequestDispatcher rd = req.getRequestDispatcher("phone.jsp");
            rd.forward(req, resp);
        }
    }
}

