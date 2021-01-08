package pricechina.model;

import java.util.ArrayList;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

import pricechina.model.dto.ProductDTO;
import pricechina.model.util.PublicCommon;

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
	public static String insertProduct(String id, String pname, int pprice) {
		EntityManager em = PublicCommon.getEntityManager();
		EntityTransaction tx = em.getTransaction();
		tx.begin();
		String result = "success";
		ProductDTO product = null;
		try {
			product = ProductDTO.builder().id(id).productName(pname).productPrice(pprice).build();
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
	public static boolean updateName(String id, String newName) {
		EntityManager em = PublicCommon.getEntityManager();
		EntityTransaction tx = em.getTransaction();
		tx.begin();
		boolean result = false;
		try {
			int res = em.createNamedQuery("updateName").setParameter("id", id).setParameter("name", newName).executeUpdate();
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
	public static boolean updatePrice(String id, int newPrice) {
		EntityManager em = PublicCommon.getEntityManager();
		EntityTransaction tx = em.getTransaction();
		tx.begin();
		boolean result = false;
		try {
			int res = em.createNamedQuery("updatePrice").setParameter("id", id).setParameter("price", newPrice).executeUpdate();
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
	public static boolean delete(String id) {
		EntityManager em = PublicCommon.getEntityManager();
		EntityTransaction tx = em.getTransaction();
		tx.begin();
//		String sql1 = "delete from leaderboard where id=?";
		String sql = "delete from product where id=?";
		try {
//			int result1 = em.createNativeQuery(sql1).setParameter(1, id).executeUpdate();
			int result = em.createNativeQuery(sql).setParameter(1, id).executeUpdate();
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