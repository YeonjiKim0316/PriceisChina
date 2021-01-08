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
@NamedQuery(name = "updateName", query = "update Product p set p.productName = :name where p.id = :id")
@NamedQuery(name = "updatePrice", query = "update Product p set p.productPrice = :price where p.id = :id")
@Entity(name = "Product")
public class ProductDTO implements Serializable {
	@Id
	String id;
	String productName;
	int productPrice;

	@Override
	public String toString() {
		return "ProductDTO [id=" + id + ", productName=" + productName + ", productPrice=" + productPrice + "]";
	}

}
