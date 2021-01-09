package service;

import java.util.ArrayList;

import priceischina.model.ClientDAO;
import priceischina.model.ProductDAO;
import priceischina.model.dto.ProductDTO;

public class PCService {
	
	//id 불일치시 "id", pw 불일치시 "pw", 로그인 성공시 "success"를 반환
	public static String login(String id, String pw) {
		return ClientDAO.login(id, pw);
	}
	
	//로그아웃시 세션 삭제
	public static String logout(String id, String pw) {
		return ClientDAO.login(id, pw); 
	}
		
		
	//회원 가입
	public static String join(String id, String pw) {
		return ClientDAO.insert(id, pw); 
	}	

	//회원 정보 삭제
	public static boolean deleteID(String id) {
	return ClientDAO.delete(id); 
	}

	//비밀번호 수정
	public static boolean update(String id, String newPw) {
	return ClientDAO.update(id, newPw); 
	}

	
	//제품 List  반환
	public static ArrayList<ProductDTO> product() {
		return ProductDAO.productAll();
	}
	
	//제품 추가
	public static String join(int id, String name, int quantity, int price) {
		return ProductDAO.insertProduct(id, name, quantity, price); 
	}	

	//제품 삭체
	public static boolean deleteProduct(int id) {
	return ProductDAO.delete(id); 
	}

	//제품명 수정
	public static boolean updateName(int id, String newName) {
	return ProductDAO.updateName(id, newName); 
	}
	
	//제품가격 수정
	public static boolean updatePrice(int id, String newPrice) {
		return ProductDAO.updateName(id, newPrice); 
	}
}
