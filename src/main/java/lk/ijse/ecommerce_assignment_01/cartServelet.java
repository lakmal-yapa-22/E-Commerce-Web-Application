package lk.ijse.ecommerce_assignment_01;

import jakarta.annotation.Resource;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.ecommerce_assignment_01.admin.ProductDTO;

import javax.sql.DataSource;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "cartServelet", value = "/addtoCart")
public class cartServelet extends HttpServlet {
    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;



    String DB_URL="jdbc:mysql://localhost/ecommerce";
    String DB_USER="root";
    String DB_PASSWORD="Lakmal@123";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<ProductDTO> productDTOList=new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection= DriverManager.getConnection(
                    DB_URL,
                    DB_USER,
                    DB_PASSWORD
            );
            String sql = "SELECT * " +
                    "FROM products " +
                    "WHERE category_id = 1 AND name = 'msi'";


            Statement stm=connection.createStatement();
            ResultSet rst=stm.executeQuery(sql);
            while (rst.next()){
                ProductDTO categoryDTO =new ProductDTO(
                        rst.getInt(1),
                        rst.getString(2),
                        rst.getString(3),
                        rst.getDouble(4),
                        rst.getInt(5),
                        rst.getInt(6),
                        rst.getString(7)

                );
                productDTOList.add(categoryDTO);
            }

            req.setAttribute("carts", productDTOList);
            RequestDispatcher rd = req.getRequestDispatcher("addtoCart.jsp");
            rd.forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Error loading product: " + e.getMessage());
            RequestDispatcher rd = req.getRequestDispatcher("addtoCart.jsp");
            rd.forward(req, resp);
        }
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int productId = Integer.parseInt(req.getParameter("product_id"));
            int quantity = Integer.parseInt(req.getParameter("quantity"));

            try (Connection connection = dataSource.getConnection()) {
                String sql = "INSERT INTO cart (user_id, product_id, quantity) VALUES (?, ?, ?)";
                try (PreparedStatement ps = connection.prepareStatement(sql)) {
                    ps.setInt(1, 1); // Assuming a static user ID for now
                    ps.setInt(2, productId);
                    ps.setInt(3, quantity);

                    ps.executeUpdate();
                }
            }
            resp.sendRedirect("addtoCart.jsp?message=Item added to cart successfully");
        } catch (NumberFormatException e) {
            e.printStackTrace();
            resp.sendRedirect("addtoCart.jsp?error=Invalid quantity or product ID");
        } catch (SQLException e) {
            e.printStackTrace();
            resp.sendRedirect("addtoCart.jsp?error=Error adding item to cart");
        }
    }


}

