package priceischina.model;

import java.util.ArrayList;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

import priceischina.model.dto.OrderedDTO;
import priceischina.model.dto.ProductDTO;
import priceischina.model.util.PublicCommon;

public class OrderedDAO {
	
	//모든 ordered 반환
	public static ArrayList<OrderedDTO> orderedAll() {
		EntityManager em = PublicCommon.getEntityManager();
		ArrayList<OrderedDTO> result = null;
		try {
			result = (ArrayList<OrderedDTO>) em.createNamedQuery("findorderedAll").getResultList();
		}catch(Exception e) {
			e.printStackTrace();
			throw e;
		}finally {
			em.close();
		}
		return result;
	}
	
	// CRUD - ordered insert
	public static String insertOredered(int orderNo, String id, int productId, int orderedQuantity, String timestamp ) {
		EntityManager em = PublicCommon.getEntityManager();
		EntityTransaction tx = em.getTransaction();
		tx.begin();
		String result = "success";
		OrderedDTO ordered = null;
		try {
			ordered = OrderedDTO.builder().orderNo(orderNo).id(id).productId(productId).orderedQuantity(orderedQuantity).timestamp(timestamp).build();
			em.persist(ordered);
			tx.commit();
		} catch (Exception e) {
			result = "fail";
			e.printStackTrace();
		} finally {
			em.close();
		}
		return result;
	}

	// CRUD - UPDATEQuatity
	public static boolean updateorderedQuantity(int orderNo, int neworderQuantity) {
		EntityManager em = PublicCommon.getEntityManager();
		EntityTransaction tx = em.getTransaction();
		tx.begin();
		boolean result = false;
		try {
			int res = em.createNamedQuery("updateorderedQuantity").setParameter("orderNo", orderNo).setParameter("quantity", neworderQuantity).executeUpdate();
			tx.commit();
			if (res == 1) {
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			em.close();
		}
		return result;
	}

	// CRUD - DELETE
	public static boolean deleteOrdered(int orderNo) {
		EntityManager em = PublicCommon.getEntityManager();
		EntityTransaction tx = em.getTransaction();
		tx.begin();
		String sql = "delete from Ordered where orderNo=?";
		try {
			int result = em.createNativeQuery(sql).setParameter(1, orderNo).executeUpdate();
			tx.commit();
			if (result == 1) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			em.close();
		}
		return false;
	}
}