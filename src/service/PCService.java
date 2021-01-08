package service;

import java.util.ArrayList;

import priceischina.model.ProductDAO;
import priceischina.model.dto.ProductDTO;

public class PCService {
	
	//제품 List  반환
	public static ArrayList<ProductDTO> getLeaderboard() {
		return ProductDAO.productAll();
	}
	
	//제품 추가
	public static String join(String id, String name, int price) {
		return ProductDAO.insertProduct(id, name, price); 
	}	

	//제품 삭체
	public static boolean delete(String id) {
	return ProductDAO.delete(id); 
	}

	//제품명 수정
	public static boolean updateName(String id, String newName) {
	return ProductDAO.updateName(id, newName); 
	}
	
	//제품가격 수정
	public static boolean updatePrice(String id, String newPrice) {
		return ProductDAO.updateName(id, newPrice); 
	}
}
