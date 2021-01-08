package priceischina.model;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

import priceischina.model.dto.OrderedDTO;
import priceischina.model.util.PublicCommon;

public class ProductDAO {
	
	public static boolean insert(String id, int gameresult) {
		EntityManager em = PublicCommon.getEntityManager();
		EntityTransaction tx = em.getTransaction();
		boolean result = false;
		try {
			tx.begin();
			OrderedDTO newscore = new OrderedDTO(id, gameresult,
					new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date(System.currentTimeMillis())));
			em.persist(newscore);
			result = true;
			tx.commit();
		}catch(Exception e) {
			e.printStackTrace();
			throw e;
		}finally {
			em.close();
		}
		return result;
	}

	public static ArrayList<OrderedDTO> getLeaderboard() {
		EntityManager em = PublicCommon.getEntityManager();
		ArrayList<OrderedDTO> result = null;
		try {
			result = (ArrayList<OrderedDTO>) em.createNamedQuery("findLeaderboard").getResultList();
		}catch(Exception e) {
			e.printStackTrace();
			throw e;
		}finally {
			em.close();
		}
		return result;
	}
}
