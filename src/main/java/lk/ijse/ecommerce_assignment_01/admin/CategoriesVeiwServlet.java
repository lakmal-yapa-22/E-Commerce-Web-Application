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

@WebServlet(name = "CategoriesVeiwServlet", value = "/categoryVeiw")
public class CategoriesVeiwServlet extends HttpServlet {

    String DB_URL="jdbc:mysql://localhost/ecommerce";
    String DB_USER="root";
    String DB_PASSWORD="Lakmal@123";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<CategoriesDTO> categoriesDTOList=new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection= DriverManager.getConnection(
                    DB_URL,
                    DB_USER,
                    DB_PASSWORD
            );
            String sql="SELECT * FROM  categories";
            Statement stm=connection.createStatement();
            ResultSet rst=stm.executeQuery(sql);
            while (rst.next()){
               CategoriesDTO categoryDTO =new CategoriesDTO(
                        rst.getInt(1),
                        rst.getString(2),
                        rst.getString(3)

                );
                categoriesDTOList.add(categoryDTO);
            }

            req.setAttribute("categories", categoriesDTOList);
            RequestDispatcher rd = req.getRequestDispatcher("categoryVeiw.jsp");
            rd.forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Error loading category: " + e.getMessage());
            RequestDispatcher rd = req.getRequestDispatcher("categoryVeiw.jsp");
            rd.forward(req, resp);
        }
    }

}

