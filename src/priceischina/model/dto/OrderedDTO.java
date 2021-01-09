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

@NamedQuery(name="findId", query="select c.id from Client c where c.id = :id")
@NamedQuery(name="findPw", query="select c.pw from Client c where c.id = :id")
@NamedQuery(name="update", query="update Client c set c.pw = :pw where c.id = :id")

@NamedQuery(name = "findorderedAll", query = "select p from Ordered p")
@NamedQuery(name = "updateorderedQuantity", query = "update Ordered p set p.orderedQuantity = :quantity where p.orderNo = :orderNo")

@Entity(name = "Ordered")
public class OrderedDTO implements Serializable {
	@Id
	int orderNo;
	String id;
	int productId;
	int orderedQuantity;
	String timestamp;
	
	@Override
	public String toString() {
		return "OrderedDTO [orderNo=" + orderNo + ", id=" + id + ", productId=" + productId + ", orderedQuantity="
				+ orderedQuantity + ", timestamp=" + timestamp + "]";
	}
}

