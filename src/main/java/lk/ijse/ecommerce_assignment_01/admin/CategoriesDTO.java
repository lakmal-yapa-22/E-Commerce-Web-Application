package lk.ijse.ecommerce_assignment_01.admin;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Data
@ToString
public class CategoriesDTO {
    private int id;
    private String name;
    private String description;
}
