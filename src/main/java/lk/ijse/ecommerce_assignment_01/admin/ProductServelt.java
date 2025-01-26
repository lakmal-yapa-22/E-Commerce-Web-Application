//package lk.ijse.ecommerce_assignment_01.admin;
//
//import jakarta.annotation.Resource;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.Part;
//
//import javax.sql.DataSource;
//import java.io.File;
//import java.io.IOException;
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.SQLException;
//@WebServlet(name = "ProductServel", value = "/adminHome")
//public class ProductServelt extends HttpServlet {
//    @Resource(name = "java:comp/env/jdbc/pool")
//    private DataSource dataSource;
//
//@Override
//protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//    String name = req.getParameter("product_name");
//    String description = req.getParameter("product_description");
//    double price = Double.parseDouble(req.getParameter("product_price"));
//    int quantity = Integer.parseInt(req.getParameter("product_quantity"));
//    int category_id = Integer.parseInt(req.getParameter("category_id"));
//
//
//    try (Connection connection = dataSource.getConnection()) {
//        String sql = "INSERT INTO products (product_name, product_description, product_price, product_quantity, category_id) VALUES ( ?, ?, ?, ?, ?);";
//        try (PreparedStatement ps = connection.prepareStatement(sql)) {
//            ps.setString(1, name);
//            ps.setString(2, description);
//            ps.setDouble(3, price);
//            ps.setInt(4, quantity);
//            ps.setInt(5, category_id);
//
//            ps.executeUpdate();
//            resp.sendRedirect("adminHome.jsp?message=Product added successfully");
//        }
//    } catch (SQLException e) {
//        e.printStackTrace();
//        resp.sendRedirect("adminHome.jsp?error=Failed to add product");
//    }
//}
//}

package lk.ijse.ecommerce_assignment_01.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
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

@WebServlet(name = "ProductServelt", value = "/adminHome")
@MultipartConfig(maxFileSize = 169999999)
public class ProductServelt extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost/ecommerce";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Lakmal@123";
    private static final String UPLOAD_DIR = "uploads/images";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Retrieve product details from the request
        String productName = req.getParameter("product_name");
        String productDescription = req.getParameter("product_description");
        double productPrice;
        int productQuantity;
        int categoryId;

        try {
            productPrice = Double.parseDouble(req.getParameter("product_price"));
            productQuantity = Integer.parseInt(req.getParameter("product_quantity"));
            categoryId = Integer.parseInt(req.getParameter("category_id"));
        } catch (NumberFormatException e) {
            resp.sendRedirect("adminHome.jsp?error=Invalid input values");
            return;
        }

        // Handle image upload
        Part imagePart = req.getPart("product_image");
        String imagePath = null;

        if (imagePart != null && imagePart.getSize() > 0) {
            String fileName = getFileName(imagePart);
            String extension = getFileExtension(fileName);
            String uniqueFileName = UUID.randomUUID().toString() + extension;
            Path uploadPath = Path.of(getServletContext().getRealPath("") + File.separator + UPLOAD_DIR, uniqueFileName);

            File uploadDir = new File(uploadPath.getParent().toString());
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }

            try (InputStream inputStream = imagePart.getInputStream()) {
                Files.copy(inputStream, uploadPath, StandardCopyOption.REPLACE_EXISTING);
            }
            imagePath = UPLOAD_DIR + "/" + uniqueFileName;
        }

        // Insert product into the database
        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String sql = "INSERT INTO products (name, description, price, quantity, category_id, product_image) VALUES (?, ?, ?, ?, ?, ?)";
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setString(1, productName);
                preparedStatement.setString(2, productDescription);
                preparedStatement.setDouble(3, productPrice);
                preparedStatement.setInt(4, productQuantity);
                preparedStatement.setInt(5, categoryId);
                if (imagePath != null) {
                    preparedStatement.setString(6, imagePath);
                } else {
                    preparedStatement.setNull(6, java.sql.Types.VARCHAR);
                }

                int rowsAffected = preparedStatement.executeUpdate();
                if (rowsAffected > 0) {
                    resp.sendRedirect("adminHome.jsp?message=Product saved successfully");
                } else {
                    resp.sendRedirect("adminHome.jsp?error=Product save failed");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            resp.sendRedirect("adminHome.jsp?error=Database error occurred");
        }
    }

    private String getFileName(Part part) {
        String contentDisposition = part.getHeader("Content-Disposition");
        for (String content : contentDisposition.split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf("=") + 2, content.length() - 1);
            }
        }
        return null;
    }

    private String getFileExtension(String fileName) {
        int dotIndex = fileName.lastIndexOf(".");
        return (dotIndex > 0) ? fileName.substring(dotIndex) : "";
    }
}
