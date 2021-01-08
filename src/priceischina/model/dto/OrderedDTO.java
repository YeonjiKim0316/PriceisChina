package priceischina.model.dto;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQuery;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@NamedQuery(name="findId", query="select c.id from Client c where c.id = :id")
@NamedQuery(name="findPw", query="select c.pw from Client c where c.id = :id")
@NamedQuery(name="update", query="update Client c set c.pw = :pw where c.id = :id")
@Entity(name = "Ordered")
public class OrderedDTO implements Serializable {
	@Id
	int orderNo;
	
	String id;
	int productId;
	int orderedQuantity;
	int price;
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("OrderedDTO [orderNo=");
		builder.append(orderNo);
		builder.append(", id=");
		builder.append(id);
		builder.append(", productId=");
		builder.append(productId);
		builder.append(", orderedQuantity=");
		builder.append(orderedQuantity);
		builder.append(", price=");
		builder.append(price);
		builder.append("]");
		return builder.toString();

	}
	
}

