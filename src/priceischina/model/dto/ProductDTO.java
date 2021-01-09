package priceischina.model.dto;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQuery;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
@NamedQuery(name = "findproductAll", query = "select p from Product p")
@NamedQuery(name = "updateName", query = "update Product p set p.productName = :name where p.productId = :id")
@NamedQuery(name = "updatePrice", query = "update Product p set p.price = :price where p.productId = :id")
@Entity(name = "Product")
public class ProductDTO implements Serializable {
	@Id
	int productId;
	String productName;
	int quantity;
	int price;
	
	@Override
	public String toString() {
		return "ProductDTO [productId=" + productId + ", productName=" + productName + ", quantity=" + quantity
				+ ", productPrice=" + price + "]";

	}

}
