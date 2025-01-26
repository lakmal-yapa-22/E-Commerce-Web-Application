package lk.ijse.ecommerce_assignment_01.admin;

import lombok.*;

import java.math.BigDecimal;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class ProductDTO {
    private int productId;
    private String productName;
    private String productDescription;
    private double productPrice;
    private int productQuantity;
    private int categoryId;
    private String productImage;



    public ProductDTO(int id, String name, String description, double price, int quantity, String productImage) {
        this.productId = id;
        this.productName = name;
        this.productDescription = description;
        this.productPrice = price;
        this.productQuantity = quantity;
        this.productImage = productImage;


    }
}
