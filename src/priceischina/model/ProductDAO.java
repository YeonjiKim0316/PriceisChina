package priceischina.model;
import java.util.ArrayList;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

import priceischina.model.util.PublicCommon;
import priceischina.model.dto.ProductDTO;

public class ProductDAO {
	
	
	public static ArrayList<ProductDTO> productAll() {
		EntityManager em = PublicCommon.getEntityManager();
		ArrayList<ProductDTO> result = null;
		try {
			result = (ArrayList<ProductDTO>) em.createNamedQuery("findproductAll").getResultList();
		}catch(Exception e) {
			e.printStackTrace();
			throw e;
		}finally {
			em.close();
		}
		return result;
	}
	
	// CRUD - JOIN - insert
	public static String insertProduct(int productId, String pname, int quantity, int price) {
		EntityManager em = PublicCommon.getEntityManager();
		EntityTransaction tx = em.getTransaction();
		tx.begin();
		String result = "success";
		ProductDTO product = null;
		try {
			product = ProductDTO.builder().productId(productId).productName(pname).quantity(quantity).price(price).build();
			em.persist(product);
			tx.commit();
		} catch (Exception e) {
			result = "fail";
			e.printStackTrace();
		} finally {
			em.close();
		}
		return result;
	}

	// CRUD - UPDATEName
	public static boolean updateName(int productId, String newName) {
		EntityManager em = PublicCommon.getEntityManager();
		EntityTransaction tx = em.getTransaction();
		tx.begin();
		boolean result = false;
		try {
			int res = em.createNamedQuery("updateName").setParameter("id", productId).setParameter("name", newName).executeUpdate();
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
	
	// CRUD - UPDATEPrice
	public static boolean updatePrice(int productId, int newPrice) {
		EntityManager em = PublicCommon.getEntityManager();
		EntityTransaction tx = em.getTransaction();
		tx.begin();
		boolean result = false;
		try {
			int res = em.createNamedQuery("updatePrice").setParameter("id", productId).setParameter("price", newPrice).executeUpdate();
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
	public static boolean delete(int productId) {
		EntityManager em = PublicCommon.getEntityManager();
		EntityTransaction tx = em.getTransaction();
		tx.begin();
		String sql1 = "delete from ordered where productId=?";
		String sql = "delete from product where productId=?";
		try {
			int result1 = em.createNativeQuery(sql1).setParameter(1, productId).executeUpdate();
			int result = em.createNativeQuery(sql).setParameter(1, productId).executeUpdate();
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